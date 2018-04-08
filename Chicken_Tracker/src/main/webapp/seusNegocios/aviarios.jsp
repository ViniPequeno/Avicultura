<% String css = "";%>
<%@page import="java.util.List"%>
<%@page import="br.com.avicultura.chicken_tracker.Controller.ConsultaLocalAves" %>
<%@page import="br.com.avicultura.chicken_tracker.Models.LocalAves" %>
<%@ include file="../cabecalho.jsp"%>
<div class="container">
    <!--Table-->
    <h2 class="py-5 font-weight-bold text-left">Neg�cios</h2>

    <table class="table table-hover table-responsive-md btn-table">
        <!--Table head-->
        <thead class="mdb-color darken-3">
            <tr class="text-white">
                <th> </th>
                <th>C�digo</th>
                <th>�rea</th>
                <th>Fun��o</th>
                <th>Estabelecimento</th>
                <th></th>
            </tr>
        </thead>
        <!--Table head-->

        <!--Table body-->
        <tbody>
            <%List<LocalAves> locaisAves;
                locaisAves = ConsultaLocalAves.returnList();
                for (LocalAves l : locaisAves) {%>
            <tr>
                <th scope="row" class="pr-md-3 pr-5">
                    <input type="checkbox" id="checkbox<%=l.getCodigo()%>">
                    <label for="checkbox<%=l.getCodigo()%>" class="label-table"></label>
                </th>
                <td><%=l.getCodigo()%></td>
                <td><%=l.getArea()%></td>
                <td><%=l.getFuncao()%></td>
                <td><%=l.getEstabelecimento()%></td>
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
</div>
<%@include file="../rodape.jsp" %>
<script src="../_JS/formUtils.js"></script>
</body>
</html>
