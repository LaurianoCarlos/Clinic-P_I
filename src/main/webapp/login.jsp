<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PI - Clínica</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div id="header-container"></div>
<div class="container-fluid mt-5">
    <div class="row">
        <div class="col-md-7 img-box">
            <img src="/resources/img/cachorros.png" alt="Imagem de cachorros">
        </div>
        <div class="col-md-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 offset-md-2">
                        <h2 class="fw-bold text-center fs-4">Login</h2>
                        <% String erro = (String) session.getAttribute("erro"); %>
                        <% if (erro != null) { %>
                        <div class="alert alert-danger" role="alert">
                            <p><%= erro %></p>
                        </div>
                        <form action="/login" method="post">
                            <div class="form-group">
                                <label>Email:</label>
                                <input type="email" class="form-control" name="email" placeholder="exemplo@gmail.com">
                            </div>
                            <div class="form-group pt-1">
                                <label>Senha:</label>s
                                <input type="password" class="form-control" name="password" placeholder="Digite aqui sua senha">
                            </div>
                            <div class="pt-2">
                                <a class="text-decoration-none" href="#">Esqueceu a Senha?</a>
                            </div>
                            <div class="form-group pt-3">
                                <button type="submit" class="btn btn-primary btn-block">Entrar</button>
                            </div>
                        </form>
                        <div class="text-center pt-3">
                            <p>Não Tem Uma Conta? <a href="/form-client.jsp"> Cadastre-se</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="footer-container"></div>
<script src="resources/js/loadIndex.js"></script>
<script src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>
