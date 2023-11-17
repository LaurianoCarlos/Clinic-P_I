<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário de Dados</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div id="header-container"></div>
<main>
    <%
        String veterinarianId = request.getParameter("veterinarianId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String crmv = request.getParameter("crmv");
        String cpf = request.getParameter("cpf");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
    %>

    <% if (veterinarianId == null) { %>
    <div class="container mt-4 mb-4">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8 col-sm-10">
                <div class="container text-center mt-4">
                    <a href="/administrator-panel" class="btn btn-secondary">Voltar ao Painel</a>
                </div>
                <h1 class="text-center mb-4 mt-3 fs-2">Cadastro de Veterinário</h1>
                <form action="/create-veterinarian" method="POST">
                    <div class="mb-3">
                        <label for="name" class="form-label">Nome:</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="crmv" class="form-label">CRMV:</label>
                        <input type="text" class="form-control" id="crmv" name="crmv" required>
                    </div>
                    <div class="mb-3">
                        <label for="cpf" class="form-label">CPF:</label>
                        <input type="text" class="form-control" id="cpf" name="cpf" required>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Endereço:</label>
                        <input type="text" class="form-control" id="address" name="address" required>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Telefone:</label>
                        <input type="text" class="form-control" id="phone" name="phone" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">E-mail:</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Senha:</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Enviar</button>
                </form>
            </div>
        </div>
    </div>
    <%}%>

    <% if (veterinarianId != null){ %>
    <div class="container mt-4 mb-4">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8 col-sm-10">
                <div class="container text-center mt-4">
                    <a href="/administrator-panel" class="btn btn-secondary">Voltar ao Painel</a>
                </div>
                <h1 class="text-center mb-4 mt-3 fs-2">Atualizar dados de Veterinário</h1>
                <form action="/create-veterinarian" method="POST">
                    <div class="mb-3">
                        <input type="hidden" class="form-control"  name="veterinarianId" value="<%= veterinarianId %>">

                        <label class="form-label">Nome:</label>
                        <input type="text" class="form-control"  name="name" value="<%= name %>" disabled>
                    </div>
                    <div class="mb-3">
                        <label  class="form-label">CRMV:</label>
                        <input type="text" class="form-control" name="crmv" value="<%= crmv %>" disabled>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">CPF:</label>
                        <input type="text" class="form-control"  name="crmv" value="<%= cpf %>" disabled>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Endereço:</label>
                        <input type="text" class="form-control" name="address" value="<%= address %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Telefone:</label>
                        <input type="text" class="form-control" name="phone" value="<%= phone %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">E-mail:</label>
                        <input type="email" class="form-control" name="email" value="<%= email %>" disabled>
                    </div>
                    <button type="submit" class="btn btn-primary">Atualizar</button>
                </form>
            </div>
        </div>
    </div>
    <%}%>
</main>
<div id="footer-container"></div>
<script src="resources/js/admin/loadAdmin.js"></script>
<script type="text/javascript" src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>