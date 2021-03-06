<% String css = "../css/seu_negocio.css";
   String titulo ="Lista de produtos";%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Produto.ConsultaProduto" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Produto" %>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <h2 class="py-5 font-weight-bold text-left">
        <a href="estabelecimento.jsp?estabelecimento=<%=request.getParameter("estabelecimento")%>">
            <i class="fa fa-arrow-left mr-1" aria-hidden="true"></i>Voltar </a>Lista de produtos</h2>

    <%  List<Produto> produtos;
        produtos = ConsultaProduto.returnList(request.getParameter("estabelecimento"));
        if (produtos.size() > 0) {%>
    <div class="card card-cascade narrower mt-5">

        <!--Card image-->
        <div class="view gradient-card-header blue-grey darken-4 narrower py-4 mx-4 mb-3 d-flex justify-content-center align-items-center">

            <h4 class="white-text font-weight-bold text-uppercase mb-0">Produtos</h4>

        </div>
        <!--/Card image-->

        <div class="px-4">
            <!--Table-->
            <table class="table table-hover table-responsive-md" id="tableDados">
                <!--Table head-->
                <thead>
                    <tr>
                        <th class="check-column"> </th>
                        <th>C�digo</th>
                        <th>Nome</th>
                        <th>Qtde. atual</th>
                        <th>Tipo</th>
                    </tr>
                </thead>
                <!--Table head-->

                <!--Table body-->
                <tbody>
                    <% for (Produto p : produtos) {
                            String dataProduto = ConsultaProduto.returnValues(p);
                    %>
                    <tr data-produto="<%=dataProduto%>">
                        <th scope="row" class="pr-md-3 pr-5">
                            <input form="checks" type="checkbox" id="checkbox!<%=p.getCodigo()%>" name="checkbox!<%=p.getCodigo()%>">
                            <label for="checkbox!<%=p.getCodigo()%>" class="label-table"></label>
                        </th>
                        <td><%=p.getCodigo()%></td>
                        <td><%=p.getNome()%></td>
                        <td><%=p.getQuantidadeAtual()%></td>
                        <% String tipo = p.getTipo()=='P'?"Produ��o":"Estoque";%>
                        <td><%=tipo%></td>
                    </tr>
                    <%}%>
                </tbody>
                <!--Table body-->
            </table>
            <!--Table-->
            <hr class="my-0">

            <!--Bottom Table UI-->
            <div class="d-flex justify-content-center">

                <!--Pagination -->
                <nav class="my-4 pt-2">
                    <ul class="pagination pagination-circle pg-dark-grey mb-0" id="pg-link">

                        <!--First-->
                        <li id="first-item" class="page-item disabled clearfix d-none d-md-block"><a class="page-link">Primeiro</a></li>

                        <!--Arrow left-->
                        <li id="previous" class="page-item disabled">
                            <a class="page-link" aria-label="Anterior">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Anterior</span>
                            </a>
                        </li>

                        <!--Arrow right-->
                        <li id="next" class="page-item">
                            <a class="page-link" aria-label="Pr�ximo">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Pr�ximo</span>
                            </a>
                        </li>

                        <!--Last-->
                        <li id="last-item" class="page-item clearfix d-none d-md-block"><a class="page-link">�ltimo</a></li>

                    </ul>
                </nav>
                <!--/Pagination -->

            </div>
            <!--Bottom Table UI-->
        </div> 
    </div>
    <%} else {%>
    <h2 class="my-5 py-5 text-center">Nenhum produto registrado ainda</h2>
    <%}%>

    <a href="../cadastro/produto.jsp" class="btn btn-light-green btn-rounded mt-4 mb-0" data-toggle="tooltip" data-placement="bottom" title="Novo produto" role="button">
        <i class="fa fa-plus fa-lg mr-1" aria-hidden="true"></i></a>
    <span class="d-inline-block" data-toggle="tooltip" data-placement="bottom" title="Excluir produtos selecionados">
        <a href="" class="btn btn-danger btn-rounded mt-4 disabled mb-0" id="btnExcluir" role="button" data-toggle="modal" data-target="#confirmarExclusao">
            <i class="fa fa-trash fa-lg mr-1" aria-hidden="true"></i></a>
    </span>
    <button id="btnBaixarPDF" class="btn btn-mdb-color btn-rounded mt-4 mb-0" data-toggle="tooltip" data-placement="bottom" title="Exportar para PDF">
        <i class="fa fa-file-pdf fa-lg mr-1" aria-hidden="true"></i></button>

    <!-- Modal -->
    <div class="modal fade" id="confirmarExclusao" tabindex="-1" role="dialog" aria-labelledby="confirmarExclusao" aria-hidden="true">
        <div class="modal-dialog modal-notify modal-danger" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title heading lead" id="labelExclusao">Confirmar altera��es?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="text-center"> 
                        <i class="fa fa-trash-alt fa-4x mb-3 animated rotateIn"></i>
                        <p>Esta a��o n�o pode ser desfeita</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Cancelar</button>
                    <form id="checks" action="/Chicken_Tracker/ProdutoServlet" method="post">
                        <button name="produto" value="alterar" type="submit" class="btn btn-danger">Confirmar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="detalhesProduto" tabindex="-1" role="dialog" aria-labelledby="labelDetalhes" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header blue-grey">
                    <h5 class="modal-title white-text" id="labelDetalhes">Detalhes</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id='bodyDetalhes'>
                    <p id="codigo"> C�digo: </p>
                    <p id="nome"> Nome: </p>
                    <p id="qtdeAtual"> Em estoque: </p>
                    <p id="qtdeMin"> Quantidade M�nima: </p>
                    <p id="qtdeMax"> Quantidade M�xima: </p>
                    <p id="descricao"> Descri��o: </p>
                    <p id="estabelecimento"> Usado por: </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Fechar</button>
                    <button name="produto" value="editar" type="button" class="btn btn-primary" id="btnEditarConfirmar">Editar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../js/paginacaoTabelas.js"></script>
<script src="../js/formUtils.js"></script>
<script src="../js/exportTableToPDF.js"></script>
<script>
    var dataP = "";
    var modalDetalhesInnerHTML = '<p id="codigo"> C�digo </p>'+
                    '<p id="nome"> Nome: </p>'+
                    '<p id="qtdeAtual"> Em estoque: </p>'+
                    '<p id="qtdeMin"> Quantidade M�nima: </p>'+
                    '<p id="qtdeMax"> Quantidade M�xima: </p>'+
                    '<p id="descricao"> Descri��o: </p>'+
                    '<p id="estabelecimento"> Usado por: </p>';
    $("td").not(function () {
        return $("a", this).length != 0;
    }).click(function () {
        $("#detalhesProduto").modal();
        $("#bodyDetalhes").html(modalDetalhesInnerHTML);
        $("#btnEditarConfirmar").text("Editar");

        var linha = $(this).closest('tr');
        var dados = linha.data('produto').toString();
        var campo = dados.split("#");
        dataP = campo;

        var codigo = campo[0];
        var nome = campo[1];
        var qtdeAtual = campo[2];
        var qtdeMin = campo[3];
        var qtdeMax = campo[4];
        var descricao = campo[5];
        var estabelecimento = campo[6];

        $("#codigo").text("C�digo: " + codigo);

        $("#nome").text("Nome: " + nome);

        $("#qtdeAtual").text("Em estoque: " + qtdeAtual);

        $("#qtdeMin").text("Quantidade m�nima: " + qtdeMin);

        $("#qtdeMax").text("Quantidade M�xima " + qtdeMax);

        $("#descricao").text("Descri��o: " + descricao);

        $("#estabelecimento").text("Estabelecimento: " + estabelecimento);
    });
    var modalEditarInnerHTML = '<form method="post" action="/Chicken_Tracker/ProdutoServlet" name="formEditar">' +
            '<div class="md-form"><i class="fa fa-hashtag prefix grey-text"></i>' +
            '<input type="text" id="inputCodigo" name="inputCodigo" class="form-control" required autofocus maxlength="20">' +
            '<label for="inputCodigo">C�digo</label> </div>' +
            '<div class="md-form"><i class="fa fa-book prefix grey-text"></i>' +
            '<input type="text" id="inputNome" name="inputNome" class="form-control" required maxlength="50">' +
            '<label for="inputNome">Nome</label></div>' +
            '<div class="md-form"><i class="fa fa-clipboard-list prefix grey-text"></i>' +
            '<input type="text" id="inputDescricao" name="inputDescricao" class="form-control md-textarea" required maxlength="100">' +
            '<label for="inputDescricao">Descri��o</label></div>' +
            '<div class="md-form">    <i class="fa fa-inbox prefix grey-text"></i>' +
            '<input type="text" id="inputQtdeAtual" name="inputQtdeAtual" class="form-control" required maxlength="10">' +
            '<label for="inputQtdeAtual">Quantidade atual</label> </div>' +
            '<div class="md-form">     <i class="fa fa-box prefix grey-text"></i>' +
            '<input type="text" id="inputMinQtde" name="inputMinQtde" class="form-control" required maxlength="10">' +
            '<label for="inputMinQtde">Quantidade M�nima</label> </div>' +
            '<div class="md-form">  <i class="fa fa-boxes prefix grey-text"></i>' +
            '<input type="text" id="inputMaxQtde" name="inputMaxQtde" class="form-control" required maxlength="10">' +
            '<label for="inputMaxQtde">Quantidade M�xima</label> </div>' +
            '</form>';
    $("#btnEditarConfirmar").click(function () {
        if ($(this).text() == "Editar") {
            $(this).text("Confirmar");
            $("#bodyDetalhes").html(modalEditarInnerHTML);
            initInputs();
            $('#inputCodigo').val(dataP[0]).trigger("change");
            $('#inputNome').val(dataP[1]).trigger("change");
            $('#inputQtdeAtual').val(dataP[2]).trigger("change");
            $('#inputMinQtde').val(dataP[3]).trigger("change");
            $('#inputMaxQtde').val(dataP[4]).trigger("change");
            $('#inputDescricao').val(dataP[5]).trigger("change");
        } else {
            formEditar.submit();
        }
    });
</script>
</body>
</html>
