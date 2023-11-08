<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Consultas</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div class="container mt-4">
    <h1>Verificar Consultas</h1>
    <h2 class="my-4">Selecione uma data</h2>
    <form action="/list-consultation" method="POST">
        <div class="form-group">
            <label for="date">Data da Consulta:</label>
            <input type="date" class="form-control" id="date" name="date" required>
        </div>
        <button type="submit" class="btn btn-primary mt-3">Buscar Consultas</button>
    </form>

    <table class="table table-bordered mt-4">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Data</th>
            <th>Nome do Cliente</th>
            <th>Nome do Animal</th>
            <th>Nome do Veterinário</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="consultation" items="${consultations}">
            <tr>
                <td>${consultation.id}</td>
                <td>${consultation.date}</td>
                <td>${consultation.clientName}</td>
                <td>${consultation.animalName}</td>
                <td>${consultation.veterinarianName}</td>
                <td>
                    <form action="/delete-consultation" method="post">
                        <input type="hidden" name="idConsultation" value="${consultation.id}">
                        <button type="submit" class="btn btn-primary">Desmarcar Consulta</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
