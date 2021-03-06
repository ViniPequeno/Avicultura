<% String css = "../css/seu_negocio.css";
    String titulo = "Estabelecimentos";%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos.ConsultaEstabelecimento" %>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Negocio.ConsultaNegocio" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Estabelecimento" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Perfil" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio" %>
<%@ include file="../cabecalho.jsp"%>
<div class="container">

    <h2 class="py-5 font-weight-bold text-left blue-text">
        <a href="negocios.jsp"><i class="fa fa-arrow-left mr-1" aria-hidden="true"></i> Voltar</a></h2>

    <%Negocio n = (Negocio) sessao.getAttribute("negocio");
        if (n == null) {
            n = ConsultaNegocio.findById(request.getParameter("negocio"));
            sessao.setAttribute("negocio", n);
        } else if (!n.getEmpresaCNPJ().equals(request.getParameter("negocio").toString())) {
            n = ConsultaNegocio.findById(request.getParameter("negocio"));
            sessao.setAttribute("negocio", n);
        }
        List<Estabelecimento> estabelecimentos;
        estabelecimentos = ConsultaEstabelecimento.returnListOfNegocio(n.getEmpresaCNPJ());
        if (estabelecimentos.size() > 0) {%>

    <div class="card card-cascade narrower">

        <!--Card image-->
        <div class="view gradient-card-header blue-grey darken-4 narrower py-4 mx-4 mb-3 d-flex justify-content-center align-items-center">

            <h4 class="white-text font-weight-bold text-uppercase mb-0">Estabelecimentos</h4>

        </div>
        <!--/Card image-->

        <div class="px-4">
            <!--Table-->
            <table class="table table-hover table-responsive-md btn-table" id="tableDados">
                <!--Table head-->
                <thead>
                    <tr>
                        <th class="check-column"> </th>
                        <th>Neg�cio</th>
                        <th>Propriet�rio</th>
                        <th>CNAE</th>
                        <th>CNPJ</th>
                        <th>Cidade/Estado</th>
                        <th></th>
                    </tr>
                </thead>
                <!--Table head-->

                <!--Table body-->
                <tbody>
                    <%  for (Estabelecimento e : estabelecimentos) {
                            String dataEstabelecimento = ConsultaEstabelecimento.returnValues(e);
                    %>
                    <tr data-estabelecimento="<%=dataEstabelecimento%>">
                        <th scope="row" class="pr-md-3 pr-5 mt-0">
                            <input form="checks" type="checkbox" id="checkbox!<%=e.getSufixoCNPJ()%>" name="checkbox!<%=e.getSufixoCNPJ()%>">
                            <label for="checkbox!<%=e.getSufixoCNPJ()%>" class="label-table"></label>
                        </th>
                        <td class="nomeEmpresa"><%=e.getNegocio().getNome()%></td>
                        <td class="proprietario"><%=n.getPerfil().getNome()%></td>
                        <td class="CNAE"><%=e.getCNAE()%></td>
                        <td class="CNPJCompleto"><%=n.getEmpresaCNPJ()%><%=e.getSufixoCNPJ()%></td>
                        <td><%=e.getCidade()%>/<%=e.getEstado()%></td>
                        <td><a class="btn btn-cyan btn-rounded" href="../seusNegocios/estabelecimento.jsp?estabelecimento=<%=e.getId()%>" data-toggle="tooltip" data-placement="bottom" title="Mais informa��es" role="button">
                                <i class="fa fa-ellipsis-h fa-lg mr-1" aria-hidden="true"></i></a></td>
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
    <h2 class="my-5 py-5 text-center">Nenhum estabelecimento registrado ainda</h2>
    <%}%>

    <a href="../cadastro/estabelecimento.jsp" class="btn btn-light-green btn-rounded mt-4 mb-0" data-toggle="tooltip" data-placement="bottom" title="Novo estabelecimento" role="button">
        <i class="fa fa-plus fa-lg mr-1" aria-hidden="true"></i></a>
    <span class="d-inline-block" data-toggle="tooltip" data-placement="bottom" title="Excluir estabelecimentos selecionados">
        <a href="" class="btn btn-danger btn-rounded mt-4 disabled mb-0" id="btnExcluir" role="button" data-toggle="modal" data-target="#confirmarExclusao">
            <i class="fa fa-trash fa-lg mr-1" aria-hidden="true"></i></a>
    </span>
    <button id="btnBaixarPDF" class="btn btn-mdb-color btn-rounded mt-4 mb-0" data-toggle="tooltip" data-placement="bottom" title="Exportar para PDF">
        <i class="fa fa-file-pdf fa-lg mr-1" aria-hidden="true"></i></button>

    <!-- Modal -->
    <div class="modal fade" id="confirmarExclusao" tabindex="-1" role="dialog" aria-labelledby="labelExclusao" aria-hidden="true">
        <div class="modal-dialog modal-notify modal-danger" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title heading lead" id="labelExclusao">Confirmar exclus�o?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="text-center"> 
                        <i class="fa fa-trash-alt fa-4x mb-3 animated rotateIn"></i>
                        <p>Todos os funcion�rios associados a este estabelecimento tamb�m ser�o apagados</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Cancelar</button>
                    <form id="checks" action="/Chicken_Tracker/EstabelecimentoServlet" method="post">
                        <button name="estabelecimento" type="submit" value="excluir" class="btn btn-danger">Confirmar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="detalhesEstabelecimento" tabindex="-1" role="dialog" aria-labelledby="labelDetalhes" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header blue-grey">
                    <h5 class="modal-title white-text" id="labelDetalhes">Detalhes</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="bodyDetalhes">
                    <p id="negocio">Neg�cio: </p>
                    <p id="proprietario">Propriet�rio: </p>
                    <p id="cnae">CNAE: </p>
                    <p id="sufixoCNPJ"> Sufixo do CNPJ: </p>
                    <p id="endereco"> Endere�o: </p>
                    <p id="qtdeFuncionarios">Quantidade de funcion�rios: </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Fechar</button>
                    <button name="estabelecimento" value="alterar" type="button" class="btn btn-primary" id="btnEditarConfirmar">Editar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../js/paginacaoTabelas.js"></script>
<script src="../js/formUtils.js"></script>
<script src="../js/consultaCEP.js"></script>
<script src="../js/mascara.js"></script>
<script src="../js/exportTableToPDF.js"></script>
<script>
    dataE = "";
    var modalDetalhesInnerHTML = '<p id="negocio">Neg�cio: </p>' +
            '<p id="proprietario">Propriet�rio: </p>' +
            '<p id="cnae">CNAE: </p>' +
            '<p id="sufixoCNPJ"> Sufixo do CNPJ: </p>' +
            '<p id="CEP"> CEP: </p>' +
            '<p id="endereco"> Endere�o: </p>' +
            '<p id="cidade-uf"> Cidade: </p>' +
            '<p id="qtdeFuncionarios">Quantidade de funcion�rios: </p>';
    $("td").not(function () {
        return $("a", this).length != 0;
    }).click(function () {
        $("#detalhesEstabelecimento").modal();
        $("#bodyDetalhes").html(modalDetalhesInnerHTML);
        $("#btnEditarConfirmar").text("Editar");

        var linha = $(this).closest('tr');
        var dados = linha.data('estabelecimento').toString();
        var campo = dados.split("#");
        dataE = campo;

        var negocio = campo[0];
        var proprietario = campo[1];
        var sufixoCNPJ = campo[2];
        var cnae = campo[3];
        var CEP = campo[4];
        var rua = campo[5];
        var bairro = campo[6];
        var cidade = campo[7];
        var estado = campo[8];
        var qtdeFuncionarios = campo[9];

        $("#negocio").text("Neg�cio: " + negocio);

        $("#proprietario").text("Propriet�rio: " + proprietario);

        cnae = cnae.replace(/^(\d{5})(\d{1})(\d{2}).*/, '$1-$2/$3');
        $("#cnae").text("CNAE: " + cnae);

        sufixoCNPJ = sufixoCNPJ.replace(/^(\d{4})(\d{2}).*/, '$1-$2');
        $("#sufixoCNPJ").text("Sufixo do CNPJ: " + sufixoCNPJ);

        CEP = CEP.replace(/^(\d{5})(\d{3}).*/, '$1-$2');
        $("#CEP").text("CEP: " + CEP);

        $("#endereco").text("Endere�o: " + rua + ", " + bairro);

        $("#cidade-uf").text("Cidade: " + cidade + "/" + estado);

        $("#qtdeFuncionarios").text("Quantidade de funcion�rios: " + qtdeFuncionarios);
    });
    var modalEditarInnerHTML = '<form method="post" action="/Chicken_Tracker/EstabelecimentoServlet" >' +
            '<div class="md-form"><i class="fa fa-id-badge prefix grey-text"></i>' +
            '<input type="text" id="inputSufixoCNPJ" name="inputSufixoCNPJ" class="form-control" required autofocus maxlength="8" readonly="true">' +
            '<label for="inputSufixoCNPJ">Sufixo CNPJ</label></div>' +
            '<div class="md-form"><i class="fa fa-money-bill-alt prefix grey-text"></i>' +
            '<input type="text" id="inputCNAE" name="inputCNAE" class="form-control" required maxlength="7">' +
            '<label for="inputCNAE">CNAE</label></div>' +
            '<div class="md-form">' +
            '<input type="text" id="inputCEP" name="inputCEP" class="form-control CEP" required maxlength="80">' +
            '<label for="inputCEP">CEP</label> </div>' +
            '<div class="md-form">' +
            '<input type="text" id="inputRua" name="inputRua" class="form-control" readonly="true" required maxlength="80">' +
            '<label for="inputRua">Rua</label> </div>' +
            '<div class="md-form">' +
            '<input type="text" id="inputBairro" name="inputBairro" class="form-control" readonly="true" required maxlength="80">' +
            '<label for="inputBairro">Bairro</label> </div>' +
            '<div class="md-form">' +
            '<input type="text" id="inputCidade" name="inputCidade" class="form-control" readonly="true" required maxlength="80">' +
            '<label for="inputCidade">Cidade</label> </div>' +
            '<div class="md-form">' +
            '<input type="text" id="inputEstado" name="inputEstado" class="form-control" readonly="true" required maxlength="80">' +
            '<label for="inputEstado">Estado</label> </div>' +
            '</form>';
    $("#btnEditarConfirmar").click(function () {
        if ($(this).text() == "Editar") {
            $(this).text("Confirmar");
            $("#bodyDetalhes").html(modalEditarInnerHTML);
            initInputs();
            initCEP();
            $('#inputSufixoCNPJ').val(dataE[2]).trigger("change");
            $('#inputCNAE').val(dataE[3]).trigger("change");
            $('#inputCEP').val(dataE[4]).trigger("change");
            $('#inputRua').val(dataE[5]).trigger("change");
            $('#inputBairro').val(dataE[6]).trigger("change");
            $('#inputCidade').val(dataE[7]).trigger("change");
            $('#inputEstado').val(dataE[8]).trigger("change");
            $('#inputSufixoCNPJ').mask('0000-00', {reverse: false});
            $('#inputCNAE').mask('00000-0/00', {reverse: false});
            $('.CEP').mask('00000-000', {reverse: false});
        } else {
            $('#inputSufixoCNPJ').unmask('0000-00');
            $('#inputCNAE').unmask('00000-0/00');
            $('.CEP').unmask('00000-000');
            formEditar.submit();
        }
    });
</script>
</body>
</html>
