<% String css = "../css/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>
<!-- Material form register -->
<div class="container">
    <div class="card mx-auto mt-5">
        <div class="card-body">
            <form action="/Chicken_Tracker/VacinaServlet" method="post">
                <p class="h1 text-center mb-4">Nova Vacina</p>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="inputNome" name="inputNome" class="form-control" required autofocus maxlength="50">
                    <label for="inputNome">Nome</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-money-bill-alt prefix grey-text"></i>
                    <input type="text" id="inputDataPrimeiraVacina" name="inputDataPrimeiraVacina" class="form-control" required maxlength="10">
                    <label for="inputDataPrimeiraVacina">Data da primeira vacina:</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-badge prefix grey-text"></i>
                    <input type="text" id="inputDataProximaVacina" name="inputDataProximaVacina" class="form-control" required maxlength="10">
                    <label for="inputDataProximaVacina">Data da pr�xima vacina</label>
                </div>

                <!-- Material input text -->
                <div class="md-form">
                    <i class="fa fa-id-card prefix grey-text"></i>
                    <input type="text" id="inputCodigo" name="inputCodigo" class="form-control" required maxlength="10">
                    <label for="inputCodigo">C�digo</label>
                </div>

                <!-- Material textarea message -->
                <div class="md-form">
                    <i class="fa fa-pencil-alt prefix grey-text"></i>
                    <textarea id="inputDescricao" name="inputDescricao" class="form-control md-textarea" rows="3" required=""></textarea>
                    <label for="inputDescricao">Descri��o</label>
                </div>
                <div class="text-center mt-4">
                    <button class="btn btn-primary" type="submit">Confirmar</button>
                </div>
            </form>
            <!-- Material form register -->
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>
</body>
</html>