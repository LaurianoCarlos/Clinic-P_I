<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div class="container">
    <h1 class="my-4">Clientes</h1>
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>Id</th>
            <th>Nome</th>
            <th>Email</th>
            <th>CPF</th>
            <th>Endereço</th>
            <th>Telefone</th>
            <th>ID do Usuário</th>
            <th>Listar Animais</th>
            <th>Atualizar Dados</th>
            <th>Apagar</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="client" items="${clients}">
            <tr>
                <td>${client.id}</td>
                <td>${client.name}</td>
                <td>${client.email}</td>
                <td>${client.cpf}</td>
                <td>${client.address}</td>
                <td>${client.phone}</td>
                <td>${client.userId}</td>
                <td class="d-flex">
                    <form action="/list-animals" method="GET" class="d-flex">
                        <input type="hidden" name="clientId" value="${client.id}">
                        <input type="hidden" name="nameClient" value="${client.name}">
                        <button type="submit" class="btn btn-primary btn-sm">
                            <i class="fas fa-paw align-middle"></i> Animais
                        </button>
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
                        <button type="submit" class=" btn btn-warning btn-sm">
                            <i class="far fa-edit"></i> Atualizar
                        </button>
                    </form>
                </td>
                <td>
                    <form action="/delete-client" method="POST">
                        <input type="hidden" name="clientId" value="${client.id}">
                        <input type="hidden" name="userId" value="${client.userId}">
                        <button type="submit" class="btn btn-danger btn-sm">
                            <i class="far fa-trash-alt"></i> Apagar
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
