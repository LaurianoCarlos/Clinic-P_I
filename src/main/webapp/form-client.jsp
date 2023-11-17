<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title class="fs-5">Cadastro de Cliente</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div id="header-container"></div>

<%
    String clientId = request.getParameter("clientId");
    String name = request.getParameter("nameClient");
    String email = request.getParameter("email");
    String cpf = request.getParameter("cpfClient");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
%>
<% if (clientId == null) { %>
<div class="container mt-4 mb-4">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8 col-sm-10">
            <h1 class="text-center mb-4">Cadastro de Cliente</h1>
            <form action="/create-client" method="POST">
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

<% if (clientId != null) { %>
<div class="container mt-4 mb-4">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8 col-sm-10">
            <h1 class="text-center mb-4">Atualizar de Cliente</h1>
            <form method="post" action="/create-client">
                <input type="hidden" class="form-control" name="clientId" value="<%= clientId %>">
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
<script src="resources/js/loadIndex.js"></script>
<script src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>
