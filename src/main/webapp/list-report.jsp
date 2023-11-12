<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalhes da Consulta</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>

<div class="container mt-4">
    <h2>Detalhes da Consulta</h2>
    <% String animalName = request.getParameter("animalName");%>
    <c:choose>
        <c:when test="${not empty reports}">

            <p>Animal: <%= animalName%> </p>
            <table class="table table-bordered">
                <thead class="thead-dark">
                <tr>
                    <th>Data da Consulta</th>
                    <th>Nome do Veterinário</th>
                    <th>Diagnóstico</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="report" items="${reports}">

                    <tr>
                        <td>
                            <!--usado para formatar a data-->
                            <fmt:formatDate value="${report.dateConsultation}" pattern="dd/MM/yyyy HH:mm:ss" />
                        </td>
                        <td>${report.veterinarianName}</td>
                        <td>${report.diagnosis}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p>Nenhum relatório disponível.</p>
        </c:otherwise>
    </c:choose>

</div>
</body>
</html>
