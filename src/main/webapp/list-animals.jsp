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
    <form action="form-animal.html" method="post">
        <input type="hidden" name="idClient" value="${idClient}">
        <input type="submit" value="Cadastrar Animal">
    </form>
    <table border="1">
        <tr>
            <th>Nome</th>
            <th>Espécie</th>
            <th>Tamanho</th>
            <th>Ações</th>
        </tr>
        <c:forEach var="animal" items="${animals}">
            <tr>
                <td>${animal.name}</td>
                <td>${animal.specie}</td>
                <td>${animal.size}</td>
                <td>
                    <form action="delete-animal.html" method="post">
                        <input type="hidden" name="idAnimal" value="${animal.id}">
                        <input type="submit" value="Excluir">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
