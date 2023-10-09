<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>
</head>
<body>
  <div>
    <h1>Clientes</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>CPF</th>
            <th>Endereço</th>
            <th>Telefone</th>
            <th>ID do Usuário</th>
        </tr>
       <c:forEach var="client" items="${clients}">
           <tr>
               <td>${client.id}</td>
               <td>${client.name}</td>
               <td>${client.email}</td>
               <td>${client.cpf}</td>
               <td>${client.address}</td>
               <td>${client.phone}</td>
               <td>${client.userId}</td>
           </tr>
       </c:forEach>
    </table>
  </div>
</body>
</html>
