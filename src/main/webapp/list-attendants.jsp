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
<div id="header-container"></div>
<main>
    <div class="container">
        <h1 class="my-4">Atendentes</h1>
        <div class="container text-center mt-4">
            <a href="/administrator-panel" class="btn btn-secondary">Voltar ao Painel</a>
        </div>
        <span><a class="btn btn-primary mb-3" href="/create-attendant">Cadastrar Atendentes</a></span>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th>Nome</th>
                <th>Email</th>
                <th>CPF</th>
                <th>Endereço</th>
                <th>Telefone</th>
                <th>Atualizar Dados</th>
                <th>Apagar</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="attendant" items="${attendants}">
                <tr>
                    <td>${attendant.name}</td>
                    <td>${attendant.email}</td>
                    <td>${attendant.cpf}</td>
                    <td>${attendant.address}</td>
                    <td>${attendant.phone}</td>
                    <td>
                        <form action="/create-attendant" method="POST">
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
</main>
<div id="footer-container"></div>
<script src="resources/js/admin/loadAdmin.js"></script>
<script type="text/javascript" src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>
