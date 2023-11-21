<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PAINEL</title>
    <link rel="icon" type="image/x-icon" href="/resources/img/favicon-32x32.png">
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div id="header-container"></div>
<main class="text-center">
    <div class="text-center">
        <img class="img-fluid"  width="150" height="150" src="resources/img/veterinaria-logo.png">
    </div>
    <%
      Object attendant = request.getAttribute("attendant");
    %>
    <p><c:out value="${sessionScope.loggedUser.name}"/></p>
    <div class="container-fluid w-100">
        <div class="row justify-content-center">
            <div class="btn-group col-8">
                <a class="btn btn-secondary m-2" href="/list-consultation" role="button">Lista de Consultas</a>
                <a class="btn btn-secondary m-2" href="/list-clients" role="button">Lista de Clientes</a>
                <a class="btn btn-secondary m-2" href="/gerenate-queries" role="button">Gerar Atendimentos</a>
                <a class="btn btn-secondary m-2" href="/create-client" role="button">Cadastrar Cliente</a>
            </div>
        </div>
        <hr>
        <c:if test="${empty sessionScope.attendant}">
        <div class="row justify-content-center">
            <p>Funcionarios</p>
            <div class="btn-group col-8">
                <a class="btn btn-secondary m-2" href="/list-attendants" role="button">Listar Atendentes</a>
                <a class="btn btn-secondary m-2" href="/list-attendants" role="button">Excluir Atendente</a>
                <a class="btn btn-secondary m-2" href="/create-attendant" role="button">Cadastrar Atendente</a>
            </div>
        </div>
        <hr>
        <div class="row justify-content-center mb-3">
            <p>Veterianrios</p>
            <div class="btn-group col-8">
                <a class="btn btn-secondary m-2" href="/list-veterinarians" role="button">Listar Veterinarios</a>
                <a class="btn btn-secondary m-2" href="/list-veterinarians" role="button">Excluir Veterinario</a>
                <a class="btn btn-secondary m-2" href="/create-veterinarian" role="button">Cadastrar Veterinarios</a>
            </div>
        </div>
        </c:if>
    </div>
</main>
<div id="footer-container"></div>
<script src="resources/js/admin/loadAdmin.js"></script>
<script type="text/javascript" src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>