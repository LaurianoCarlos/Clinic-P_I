<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>Formulário de Cadastro de Animal</title>
</head>
<body>
<h2>Cadastro de Animal id = ${param.clientId}</h2>

<form action="/create-animal" method="post">

    <input type="hidden" name="clientId" value="${param.clientId}">

    <label for="name">Nome:</label>
    <input type="text" id="name" name="name" required><br><br>

    <label for="specie">Espécie:</label>
    <input type="text" id="specie" name="specie" required><br><br>

    <label for="size">Tamanho:</label>
    <input type="text" id="size" name="size" required><br><br>

    <input type="submit" value="Cadastrar">
</form>
</body>
</html>
