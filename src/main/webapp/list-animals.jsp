<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Animais do Cliente</title>
</head>
<body>
<div>
    <h1>Animais do Cliente</h1>
    <h2>Cliente: ${nameClient}</h2>
    <table border="1">
        <tr>
            <th>Noome</th>
            <th>Espécie</th>
            <th>Tamanho</th>
        </tr>
        <c:forEach var="animal" items="${animals}">
            <tr>
                <td>${animal.name}</td>
                <td>${animal.specie}</td>
                <td>${animal.size}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
