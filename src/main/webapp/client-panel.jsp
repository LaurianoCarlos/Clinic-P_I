<%@ page import="br.com.clinic.model.Client" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
<header>
    <nav class="navbar bg-primary ">
        <div class="container">
            <p class="text-white">Cliente ADMIN</p>
        </div>
    </nav>
</header>
<main class="text-center">
    <div class="text-center">
        <img class="img-fluid" width="150" height="150" src="resources/img/veterinaria-logo.png">
    </div>
    <%
        Client client = (Client) session.getAttribute("loggedUser");

        String clientId = client.getId();
        String name = client.getName();
        String cpf = client.getCpf();
        String email = client.getEmail();
        String address = client.getAddress();
        String phone = client.getPhone();
    %>

    <p><%= name %>
    </p>

    <p><c:out value="${sessionScope.client.name}"/></p>
    <div class="container-fluid w-100">
        <div class="row justify-content-center">
            <div class="btn-group col-8">
                <a class="btn btn-secondary m-2" href="/list-animals?clientId=<%= clientId %>">
                    Meus Animais</a>

                <a class="btn btn-secondary m-2" href="/list-animals?clientId=<%= clientId %>">
                    Minhas Consultas</a>

                <a class="btn btn-secondary m-2"
                   href="form-animal.jsp?clientId=<%= clientId%>">Cadastrar Animal</a>


                <form action="form-client.jsp" method="POST">
                    <input type="hidden" name="clientId" value="<%= clientId%>">
                    <input type="hidden" name="nameClient" value="<%= name %>">
                    <input type="hidden" name="email" value="<%= email %>">
                    <input type="hidden" name="cpfClient" value="<%= cpf %>">
                    <input type="hidden" name="address" value="<%= address %>">
                    <input type="hidden" name="phone" value="<%= phone %>">
                    <button type="submit" class="btn btn-secondary m-2">
                        Atualizar Informações
                    </button>
                </form>
            </div>
        </div>
        <hr>
    </div>
</main>
<div id="footer-container"></div>
<script src="resources/js/admin/loadAdmin.js"></script>
<script type="text/javascript" src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>