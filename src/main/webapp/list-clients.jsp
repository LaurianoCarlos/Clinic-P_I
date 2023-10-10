<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>
</head>
<body>
<div>
    <h1>Clientes</h1>
    <table border="1">
        <tr>
            <th>Id</th>
            <th>Nome</th>
            <th>Email</th>
            <th>CPF</th>
            <th>Endereço</th>
            <th>Telefone</th>
            <th>ID do Usuário</th>
            <th>Ação</th>
        </tr>
        <c:forEach var="client" items="${clients}">
            <tr>
                <td>${client.id}</td>
                <td>${client.name}</td>
                <td>${client.email}</td>
                <td>${client.cpf}</td>
                <td>${client.address}</td>
                <td>${client.phone}</td>
                <td>${client.userId}</td>
                <td>
                    <form action="/list-animals" method="Get">
                        <input type="hidden" name="clientId" value="${client.id}">
                        <input type="hidden" name="nameClient" value="${client.name}">
                        <input type="submit" value="Animals">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
