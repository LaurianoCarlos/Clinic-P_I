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
                    <form action="/list-animals" method="GET">
                        <input type="hidden" name="clientId" value="${client.id}">
                        <input type="hidden" name="nameClient" value="${client.name}">
                        <input type="submit" value="Animais">
                    </form>
                </td>
                <td>
                    <form action="form-client.jsp" method="POST">
                        <input type="hidden" name="clientId" value="${client.id}">
                        <input type="hidden" name="nameClient" value="${client.name}">
                        <input type="hidden" name="email" value="${client.email}">
                        <input type="hidden" name="cpf" value="${client.cpf}">
                        <input type="hidden" name="address" value="${client.address}">
                        <input type="hidden" name="phone" value="${client.phone}">
                        <input type="submit" value="Atualizar">
                    </form>
                </td>
                <td>
                    <form action="/delete-client" method="POST">
                        <input type="hidden" name="clientId" value="${client.id}">
                        <input type="hidden" name="userId" value="${client.userId}">
                        <input type="submit" value="Apagar">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
