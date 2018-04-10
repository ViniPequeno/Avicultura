<% String css = "";%>
<%@ include file="../cabecalho.jsp"%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Controller.ConsultaNegocio" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio" %>
<div class="container">
    <a href="../main/index.jsp"><i class="fa fa-arrow-left mr-1" aria-hidden="true" style="margin-top: 25px"></i>Voltar</a>
    <!--Table-->
    <h2 class="py-5 font-weight-bold text-left">Neg�cios</h2>

    <table class="table table-hover table-responsive-md btn-table" id="tableDados">
        <!--Table head-->
        <thead class="blue-grey lighten-4">
            <tr>
                <th> </th>
                <th>Nome</th>
                <th>Propriet�rio</th>
                <th>CNPJ</th>
                <th>Email</th>
                <th>Fone 1</th>
                <th>Fone 2</th>
                <th></th>
            </tr>
        </thead>
        <!--Table head-->

        <!--Table body-->
        <tbody>
            <%List<Negocio> negocios;
                negocios = ConsultaNegocio.returnList(sessao.getAttribute("nome_usuario").toString());
                for (Negocio n : negocios) {%>
            <tr data-negocio="<%=n.getNome()%>#<%=n.getPerfil().getNome()%>#<%=n.getEmpresaCNPJ()%>#<%=n.getLinkEmail()%>#<%=n.getLinkFacebook()%>#<%=n.getLinkInstragram()%>#<%=n.getEstabelecimentos()%>">
                <th scope="row" class="pr-md-3 pr-5">
                    <input type="checkbox" id="checkbox<%=n.getEmpresaCNPJ()%>">
                    <label for="checkbox<%=n.getEmpresaCNPJ()%>" class="label-table"></label>
                </th>
                <td><%=n.getNome()%></td>
                <td><%=n.getPerfil().getNome()%></td>
                <td><%=n.getEmpresaCNPJ()%></td>
                <td><%=n.getLinkEmail()%></td>
                <td><%=n.getLinkFacebook()%></td>
                <td><%=n.getLinkInstragram()%></td>
                <td><a class="btn btn-cyan btn-rounded" href="../cadastro/negocio.jsp" data-toggle="tooltip" data-placement="bottom" title="Editar Neg�cio" role="button">
                        <i class="fa fa-edit mr-1" aria-hidden="true"></i></a></td>
            </tr>
            <%}%>
        </tbody>
        <!--Table body-->
    </table>

    <!--Table-->
    <a href="../cadastro/negocio.jsp" class="btn btn-light-green btn-rounded" data-toggle="tooltip" data-placement="bottom" title="Novo neg�cio" role="button"><i class="fa fa-plus mr-1" aria-hidden="true"></i></a>
    <a href="" class="btn btn-danger btn-rounded" data-toggle="modal" data-target="#confirmarExclusao" data-tooltip="true" data-placement="bottom" title="Excluir neg�cios selecionados" role="button">
        <i class="fa fa-trash mr-1" aria-hidden="true"></i></a>

    <!-- Modal -->
    <div class="modal fade" id="confirmarExclusao" tabindex="-1" role="dialog" aria-labelledby="confirmarExclusao" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Confirmar exclus�o?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Todos os estabelecimentos associados a este neg�cio tamb�m ser�o apagados</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary">Confirmar</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="detalhesNegocio" tabindex="-1" role="dialog" aria-labelledby="detalhesNegocio" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="labelDetalhes">Detalhes</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p id="nome">Nome: </p>
                    <p id="proprietario">Propriet�rio: </p>
                    <p id="cnpj">CNPJ: </p>
                    <p id="email"> Email: </p>
                    <p id="fone1"> Fone 1: </p>
                    <p id="fone2">Fone 2: </p>
                    <p id="linkFB">Link da p�gina do Facebook: </p>
                    <p id="linkInstagram">Link da p�gina do Instagram: </p>
                    <p id="estabelecimentos">Estabelecimentos: </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Fechar</button>
                    <button type="button" class="btn btn-primary">Editar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../_JS/formUtil.js"></script>
<script>
    $("td").not(function () {
        return $("a", this).length != 0;
    }).click(function (event) {
        $("#detalhesNegocio").modal();
        var linha = $(this).closest('tr');
        var dados = linha.data('negocio').toString();
        var campo = dados.split("#");
        var nome = campo[0];
        var proprietario = campo[1];
        var cnpj = campo[2];
        var email = campo[3];
        var facebook = campo[4];
        var instagram = campo[5];
        var estabelecimentos = campo[6];
        $("#nome").text("Nome: " + nome);
        
        $("#proprietario").text("Propriet�rio: " + proprietario);
        
        $("#cnpj").text("CNPJ: " + cnpj);

        $("#email").text("Email: " + email);

        $("#linkFB").text("Link da p�gina do Facebook: " + facebook);

        $("#linkInstagram").text("Link da p�gina do Instagram: " + instagram);
        
        $("#estabelecimentos").text("Estabelecimentos: " + estabelecimentos);

        $("#fone1").text("Fone 1: " + nome);
        $("#fone2").text("Fone 2: " + nome);
    });
</script>
</body>
</html>
