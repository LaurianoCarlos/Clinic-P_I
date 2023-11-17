<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Lista de Veterinários</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div id="header-container"></div>
<main>
    <div class="container">
        <h1 class="my-4 fs-2">Lista de Veterinários</h1>
        <div class="container text-center mt-4">
            <a href="/administrator-panel" class="btn btn-secondary">Voltar ao Painel</a>
        </div>
        <span><a class="btn btn-primary mb-3" href="form-veterinarian.jsp"> Cadastrar Veterinario</a></span>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th>Nome</th>
                <th>CRMV</th>
                <th>CPF</th>
                <th>Endereço</th>
                <th>Email</th>
                <th>Telefone</th>
                <th>Atualizar</th>
                <th>Apagar</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="veterinarian" items="${veterinarians}">
                <tr>
                    <td>${veterinarian.name}</td>
                    <td>${veterinarian.crmv}</td>
                    <td>${veterinarian.cpf}</td>
                    <td>${veterinarian.address}</td>
                    <td>${veterinarian.email}</td>
                    <td>${veterinarian.phone}</td>
                    <td>
                        <form action="form-veterinarian.jsp" method="POST">
                            <input type="hidden" name="veterinarianId" value="${veterinarian.id}">
                            <input type="hidden" name="name" value="${veterinarian.name}">
                            <input type="hidden" name="crmv" value="${veterinarian.crmv}">
                            <input type="hidden" name="email" value="${veterinarian.email}">
                            <input type="hidden" name="cpf" value="${veterinarian.cpf}">
                            <input type="hidden" name="address" value="${veterinarian.address}">
                            <input type="hidden" name="phone" value="${veterinarian.phone}">
                            <button type="submit" class=" btn btn-warning btn-sm">
                                <i class="far fa-edit"></i> Atualizar
                            </button>
                        </form>
                    </td>
                    <td>
                        <form action="/delete-veterinarian" method="POST">
                            <input type="hidden" name="veterinarianId" value="${veterinarian.id}">
                            <input type="hidden" name="userId" value="${veterinarian.userId}">
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