<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário de Diagnóstico Veterinário</title>
    <link rel="icon" type="image/x-icon" href="/resources/img/favicon-32x32.png">
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div id="header-container"></div>
<main>
    <div class="container mt-3 mb-3">
        <h2 class="fs-2">Formulário de Diagnóstico</h2>
        <div class="container text-center mt-4">
            <a href="/administrator-panel" class="btn btn-secondary">Voltar</a>
            <a href="/administrator-panel" class="btn btn-secondary">Voltar ao Painel</a>
        </div>
        <%
            String idAnimal = request.getParameter("idAnimal");
            String idConsultation = request.getParameter("idConsultation");
        %>

        <form action="/create-report" method="post">
            <div class="mb-3">
                <label class="form-label">Diagnóstico:</label>
                <textarea class="form-control"  name="diagnostico" rows="4" required></textarea>
            </div>

            <input type="hidden" name="idAnimal" value="<%= idAnimal %>">
            <input type="hidden" name="idConsultation" value="<%= idConsultation %>">

            <button type="submit" class="btn btn-primary">Adicionar Diagnóstico</button>
        </form>
    </div>
</main>
<div id="footer-container"></div>
<script src="resources/js/admin/loadAdmin.js"></script>
<script type="text/javascript" src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>
