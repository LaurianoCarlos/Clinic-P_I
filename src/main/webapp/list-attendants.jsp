<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Atendentes</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div class="container">
    <h1 class="my-4">Atendentes</h1>
    <span><a class="btn btn-primary" href="form-attendant.jsp">Cadastrar Atendentes</a></span>
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
            <th>Atualizar Dados</th>
            <th>Apagar</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="attendant" items="${attendants}">
            <tr>
                <td>${attendant.id}</td>
                <td>${attendant.name}</td>
                <td>${attendant.email}</td>
                <td>${attendant.cpf}</td>
                <td>${attendant.address}</td>
                <td>${attendant.phone}</td>
                <td>${attendant.userId}</td>
                <td>
                    <form action="form-attendant.jsp" method="POST">
                        <input type="hidden" name="attendantId" value="${attendant.id}">
                        <input type="hidden" name="name" value="${attendant.name}">
                        <input type="hidden" name="email" value="${attendant.email}">
                        <input type="hidden" name="cpf" value="${attendant.cpf}">
                        <input type="hidden" name="address" value="${attendant.address}">
                        <input type="hidden" name="phone" value="${attendant.phone}">
                        <button type="submit" class=" btn btn-warning btn-sm">
                            <i class="far fa-edit"></i> Atualizar
                        </button>
                    </form>
                </td>
                <td>
                    <form action="/delete-attendant" method="POST">
                        <input type="hidden" name="attendantId" value="${attendant.id}">
                        <input type="hidden" name="userId" value="${attendant.userId}">
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
