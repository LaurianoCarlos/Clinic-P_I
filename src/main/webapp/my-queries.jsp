<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Consultation Results</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div class="container mt-4">
    <h1>Lista de Consultas</h1>
<%
    String idAnimal = request.getParameter("idAnimal");
%>
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Data</th>
            <th>Atribuir Diagnóstico</th>
        </tr>
        </thead>
        <c:forEach items="${consultations}" var="consulta">
            <tr>
                <td>${consulta.id}</td>
                <td>${consulta.date}</td>
                <td>
                    <form action="/create-report" method="get">
                        <input type="hidden" name="consultaId" value="${consulta.id}">
                        <input type="hidden" name="idAnimal" value="<%= idAnimal%>">
                        <button type="submit" class="btn btn-primary">Atribuir Diagnóstico</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
