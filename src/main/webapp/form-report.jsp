<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário de Diagnóstico Veterinário</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>

<div class="container">
    <h2>Formulário de Diagnóstico</h2>
    <%
        String idAnimal = request.getParameter("idAnimal");
        String consultaId = request.getParameter("consultaId");
    %>

    <form action="/create-report" method="post">
        <div class="mb-3">
            <label class="form-label">Diagnóstico:</label>
            <textarea class="form-control"  name="diagnostico" rows="4" required></textarea>
        </div>

        <input type="hidden" name="idAnimal" value="<%= idAnimal %>">
        <input type="hidden" name="consultaId" value="<%= consultaId %>">

        <button type="submit" class="btn btn-primary">Adicionar Diagnóstico</button>
    </form>
</div>

<script src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>
