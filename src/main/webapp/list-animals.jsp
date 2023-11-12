<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Animais do Cliente</title>
    <link rel="stylesheet"
          href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div class="container fs-5">
    <h1 class="my-4">Animais do Cliente</h1>
    <h2>Cliente: ${nameClient}</h2>
    <h2>ID: ${clientId}</h2>
    <a class="btn btn-primary my-3"
       href="form-animal.jsp?clientId=${clientId}">Cadastrar Animal</a>
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>Nome</th>
            <th>Espécie</th>
            <th>Tamanho</th>
            <th>Consultas</th>
            <th>Marcar Consulta</th>
            <th>Excluir</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="animal" items="${animals}">
            <tr>
                <td>${animal.name}</td>
                <td>${animal.specie}</td>
                <td>${animal.size}</td>
                <td>
                    <form action="/my-queries" method="post">
                        <input type="hidden" name="idAnimal"  value="${animal.id}">
                        <button type="submit" class="btn btn-primary"> consultas
                        </button>
                    </form>
                </td>
                <td>
                    <form action="/list-report" method="get">
                        <input type="hidden" name="idAnimal"  value="${animal.id}">
                        <input type="hidden" name="animalName"  value="${animal.name}">
                        <button type="submit" class="btn btn-primary"> Laudos
                        </button>
                    </form>
                </td>
                <td>
                    <form action="/list-query" method="get">
                        <input type="hidden" name="idAnimal" value="${animal.id}">
                        <input type="hidden" name="idClient" value="${clientId}">
                        <button type="submit" class="btn btn-primary">Marcar Consulta</button>
                    </form>
                </td>
                <td>
                    <form action="/delete-animal" method="post">
                        <input type="hidden" name="idAnimal"
                               value="${animal.id}">
                        <button type="submit" class="btn btn-danger">Excluir</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
