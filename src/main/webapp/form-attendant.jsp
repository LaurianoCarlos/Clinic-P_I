<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title class="fs-5"> Formulário de Cadastro</title>
    <link rel="icon" type="image/x-icon" href="/resources/img/favicon-32x32.png">
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div id="header-container"></div>

<%
    String attendantId = request.getParameter("attendantId");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String cpf = request.getParameter("cpf");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
%>
<% if (attendantId == null) { %>
<div class="container mt-4 mb-4">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8 col-sm-10">
            <h1 class="text-center mb-4 fs-1">Atendente Cadastro</h1>
            <div class="container text-center mt-4">
                <a href="/administrator-panel" class="btn btn-secondary">Voltar ao Painel</a>
            </div>
            <form action="/create-attendant" method="POST">
                <div class="mb-3">
                    <label for="name" class="form-label">Nome:</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="mb-3">
                    <label for="cpf" class="form-label">CPF:</label>
                    <input type="text" class="form-control" id="cpf" name="cpf" pattern="[0-9]*" required>
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Endereço:</label>
                    <input type="text" class="form-control" id="address" name="address" required>
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">Telefone</label>
                    <input type="tel" class="form-control" id="phone" name="phone" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Senha:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary">Cadastrar</button>
            </form>
        </div>
    </div>
</div>
<% } %>

<% if (attendantId != null) { %>
<div class="container mt-4 mb-4">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8 col-sm-10">
            <h1 class="text-center  mb-4 fs-1">Formulario de atendente</h1>
            <div class="container text-center mt-4">
                <a href="/administrator-panel" class="btn btn-secondary">Voltar ao Painel</a>
            </div>
            <form method="post" action="/create-attendant">
                <input type="hidden" class="form-control" name="attendantId" value="<%= attendantId %>">
                <div class="mb-3">
                    <label class="form-label">Nome:</label>
                    <input type="text" class="form-control" name="name" required value="<%= name %>" disabled>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email:</label>
                    <input type="email" class="form-control" name="email" required value="<%= email %>" disabled>
                </div>
                <div class="mb-3">
                    <label class="form-label">CPF:</label>
                    <input type="text" class="form-control" name="cpf" required value="<%= cpf %>" disabled>
                </div>
                <div class="mb-3">
                    <label class="form-label">Endereço:</label>
                    <input type="text" class="form-control" name="address" required value="<%= address %>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Telefone:</label>
                    <input type="text" class="form-control" name="phone" required value="<%= phone %>">
                </div>
                <button type="submit" class="btn btn-primary">Atualizar</button>
            </form>
        </div>
    </div>
</div>
<% } %>
<div id="footer-container"></div>
<script src="resources/js/admin/loadAdmin.js"></script>
<script src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>
