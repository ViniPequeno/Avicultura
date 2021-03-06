<%@page import="br.com.avicultura.chicken_tracker.Models.Negocio"%>
<%@page import="br.com.avicultura.chicken_tracker.Servlets.Produto.ConsultaProduto"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Produto"%>
<%@page import="br.com.avicultura.chicken_tracker.Models.Estabelecimento"%>
<% String css = "../css/cadastro.css";
   String titulo ="Novo Fornecimento";%>
<%@ include file="../cabecalho.jsp"%>

<!-- Material form register -->
<div class="container">
    <div class="card mx-auto my-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/FornecimentoServlet" name="formCadastro" method="post">
                <p class="h1 text-center mb-4">Novo Fornecimento</p>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-card prefix grey-text"></i>
                    <input type="text" id="inputCNPJCompleto" name="inputCNPJCompleto" class="form-control" required autofocus maxlength="8">
                    <label for="inputCNPJCompleto">CNPJ</label>
                </div>
                
                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="inputNome" name="inputNome" class="form-control" required>
                    <label for="inputNome">Nome</label>
                </div>
                
                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-at prefix grey-text"></i>
                    <input type="email" id="inputEmail" name="inputEmail" class="form-control">
                    <label for="inputEmail">Email</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-box prefix grey-text"></i>
                    <input type="text" id="inputQtde" name="inputQtde" class="form-control" required  maxlength="5">
                    <label for="inputQtde">Quantidade</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-money-bill-alt prefix grey-text"></i>
                    <input type="text" id="inputValorPagamento" name="inputValorPagamento" class="form-control" required maxlength="20">
                    <label for="inputValorPagamento">Valor do pagamento</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-calendar-alt prefix grey-text"></i>
                    <input type="text" id="inputDataVencimento" name="inputDataVencimento" class="form-control" required maxlength="10">
                    <label for="inputDataVencimento">Data de vencimento</label>
                </div>
                <div class="md-form">
                    <select name="inputProduto" id="inputProduto">
                        <% Estabelecimento e = (Estabelecimento) request.getSession().getAttribute("estabelecimento");
                            for (Produto p : ConsultaProduto.returnListProduto(e.getId().toString())) { %>
                        <option value="<%=p.getCodigo()%>"><%=p.getNome()%></option>
                        <% }%>
                    </select>
                </div>
                <div class="text-center mt-4">
                    <button class="btn btn-primary" name="fornecimento" value="cadastrar" type="submit">Confirmar</button>
                    <button class="btn btn-primary" type="reset">Limpar</button>
                </div>
            </form>
            <!-- Material form register -->
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
<script src="../js/mascara.js"></script>
<script src="../js/maskMoney.js"></script>
<script src="../js/consultaCNPJ.js"></script>
<script>
    $('#inputCNPJ, #inputProduto').blur(function () {
        if ($('#inputCNPJ').val() !== "" && $('#inputProduto').val() !== "") {
            $.ajax({
                url: "http://localhost:8080/public/index.php/api/fornecimento/" + $('#inputCNPJ').val() + "/" + $('#inputProduto').val() + "/V",
                async: false,
                dataType: 'json',
                success: function (data) {
                    if (data.existe === "false") {
                        $('#inputCNPJ, #inputProduto').removeClass('invalid');
                        $('#inputCNPJ, #inputProduto').addClass('valid');
                    } else {
                        $('#inputCNPJ, #inputProduto').removeClass('valid');
                        $('#inputCNPJ, #inputProduto').addClass('invalid');
                    }
                }
            });
        }
    });
    $('#inputValorPagamento').maskMoney({prefix: 'R$ ', thousands: '.', decimal: ','});
    $('form[name="formCadastro"').submit(function () {
        var value = $('#inputValorPagamento').maskMoney('unmasked')[0];
        $('#inputValorPagamento').val(value);
        $('#inputCNPJ').unmask('00.000.000');
    });
</script>
<script src="../js/formUtils.js"></script>
</body>
</html>
