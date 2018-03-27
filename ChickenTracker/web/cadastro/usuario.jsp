<% String css = "../css/cadastro.css";%>
<%@ include file="../cabecalho.jsp"%>
<!-- Material form register -->
<div class="container">
    <div class="card ">
        <div class="card-body">
            <form>
                <p class="h1 text-center mb-4">Criar conta</p>
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile test">
                            <div class="photo ">
                                <input type="file" accept="image/*">
                                <div class="photo__helper">
                                    <div class="photo__frame photo__frame--circle">
                                        <canvas class="photo__canvas"></canvas>
                                        <div class="message is-empty">
                                            <p class="message--desktop">Arraste sua foto at� aqui ou procure no seu PC.</p>
                                            <p class="message--mobile">Aperte aqui para escolher sua foto</p>
                                        </div>
                                        <div class="message is-loading">
                                            <i class="fa fa-2x fa-spin fa-spinner"></i>
                                        </div>
                                        <div class="message is-dragover">
                                            <i class="fa fa-2x fa-cloud-upload"></i>
                                            <p>Drop your photo</p>
                                        </div>
                                        <div class="message is-wrong-file-type">
                                            <p>Only images allowed.</p>
                                            <p class="message--desktop">Drop your photo here or browse your computer.</p>
                                            <p class="message--mobile">Tap here to select your picture.</p>
                                        </div>
                                        <div class="message is-wrong-image-size">
                                            <p>Your photo must be larger than 350px.</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="photo__options hide">
                                    <div class="photo__zoom">
                                        <input type="range" class="zoom-handler">
                                    </div><a href="javascript:;" class="remove"><i class="fa fa-trash"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-user prefix grey-text"></i>
                            <input type="text" id="inputNome" class="form-control">
                            <label for="inputNome">Nome</label>
                        </div>

                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-id-card prefix grey-text"></i>
                            <input type="text" id="inputLogin" class="form-control">
                            <label for="inputLogin">Login</label>
                        </div>

                        <!-- Material input email -->
                        <div class="md-form">
                            <i class="fa fa-envelope prefix grey-text"></i>
                            <input type="email" id="inputEmail" class="form-control">
                            <label for="inputEmail">Email</label>
                        </div>

                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-lock prefix grey-text"></i>
                            <input type="password" id="inputSenha" class="form-control">
                            <label for="inputSenha">Senha</label>
                        </div>

                        <!-- Material input text -->
                        <div class="md-form">
                            <i class="fa fa-lock prefix grey-text"></i>
                            <input type="password" id="inputConfirmarSenha" class="form-control">
                            <label for="inputConfirmarSenha">Confirmar senha</label>
                        </div>
                    </div>
                </div>
                <div class="text-center mt-4">
                    <button class="btn btn-cyan" type="submit">Confirmar</button>
                </div>
            </form>
            <!-- Material form register -->
        </div>
    </div>
</div>

<%@include file="../rodape.jsp" %>
<script src="../js/profile-picture.js"></script>
</body>
</html>