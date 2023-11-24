<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Atendimentos</title>
    <link rel="icon" type="image/x-icon" href="/resources/img/favicon-32x32.png">
    <link rel="stylesheet"
          href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>

<body>
<div id="header-container"></div>
<main class="h-100">
    <div class="container mt-4 mb-4">
        <h1 class="fs-3">Criar Atendimentos</h1>
        <div class="container text-center mt-4">
            <a href="/administrator-panel" class="btn btn-secondary">Voltar ao Painel</a>
        </div>
        <p class="mt-3">Selecione Ano e mês para gerar lista de atendementos</p>
        <% String success = (String) session.getAttribute("success"); %>
        <% if (success != null) { %>
        <div class="alert alert-success">
            <p><%= success %></p>
        </div>
        <% session.removeAttribute("success"); %>
        <% } %>
        <form action="/gerenate-queries" method="POST">
            <div class="col-1 form-group">
                <label for="year">Ano:</label>
                <select class="form-control" id="year" name="year" required>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                    <option value="2026">2026</option>
                    <option value="2027">2027</option>
                    <option value="2028">2028</option>
                    <option value="2029">2029</option>
                    <option value="2030">2030</option>
                </select>
            </div>
            <div class="col-1 form-group">
                <label for="month">Mês:</label>
                <select class="form-control" id="month" name="month" required>
                    <option value="1">Janeiro</option>
                    <option value="2">Fevereiro</option>
                    <option value="3">Março</option>
                    <option value="4">Abril</option>
                    <option value="5">Maio</option>
                    <option value="6">Junho</option>
                    <option value="7">Julho</option>
                    <option value="8">Agosto</option>
                    <option value="9">Setembro</option>
                    <option value="10">Outubro</option>
                    <option value="11">Novembro</option>
                    <option value="12">Dezembro</option>
                </select>
            </div>
            <label>Selecione um veterinário:</label>
            <select name="idVeterinarian" required>
                <option>Escolha um veterinário</option>
                <c:forEach items="${veterinarians}" var="veterinarian">
                    <option value="${veterinarian.id}">${veterinarian.name}</option>
                </c:forEach>
            </select>
            <button type="submit" class="btn btn-primary align-left">Criar Atendimentos</button>
        </form>
    </div>
</main>
<div id="footer-container"></div>
<script src="resources/js/admin/loadAdmin.js"></script>
<script type="text/javascript" src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>
