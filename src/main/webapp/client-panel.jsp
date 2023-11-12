<%@ page import="br.com.clinic.model.Client" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PAINEL</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<header>
    <nav class="navbar bg-primary ">
        <div class="container">
            <p class="text-white">Client ADMIN</p>
        </div>
    </nav>
</header>
<main class="text-center">
    <div class="text-center">
        <img class="img-fluid"  width="150" height="150" src="resources/img/veterinaria-logo.png">
    </div>
    <%
        Client client = (Client) session.getAttribute("loggedUser");

            String clientId = client.getId();
            String clienteName = client.getName();
    %>

    <p><%= clienteName %></p>

    <p><c:out value="${sessionScope.client.name}"/></p>
    <div class="container-fluid w-100">
        <div class="row justify-content-center">
            <div class="btn-group col-8">
                <a class="btn btn-secondary m-2" href="/list-animals?clientId=<%= clientId %>">Meus Animais</a>
                <a class="btn btn-secondary m-2"  href="/list-animals?clientId=<%= clientId %>">Minhas Consultas</a>
                <a class="btn btn-primary my-3"
                   href="form-animal.jsp?clientId=<%= clientId %>">Cadastrar Animal</a>
            </div>
        </div>
        <hr>
    </div>
</main>
</body>
</html>