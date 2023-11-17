<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Detalhes da Consulta</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div id="header-container"></div>
<main>
    <div class="container mt-4">
        <h2 class="fs-1">Detalhes da Consulta</h2>
        <c:if test="${not empty admin}">
            <div class="container text-center mt-4 mb-3">
                <button class="btn btn-secondary" onclick="goBack()">Voltar</button>
                <a href="/administrator-panel" class="btn btn-secondary">Voltar ao Painel</a>
            </div>
        </c:if>
        <c:if test="${empty admin}">
            <div class="container text-center mt-4 mb-3">
                <button class="btn btn-secondary" onclick="goBack()">Voltar</button>
                <a href="/client-panel" class="btn btn-secondary">Voltar ao Painel</a>
            </div>
        </c:if>
        <% String animalName = request.getParameter("animalName");%>
        <c:choose>
            <c:when test="${not empty reports}">

                <p>Animal: <%= animalName%> </p>
                <table class="table table-bordered">
                    <thead class="thead-dark">
                    <tr>
                        <th>Data da Consulta</th>
                        <th>Atendido Por</th>
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
</main>
<script>
    function goBack() {
        window.history.back();
    }
</script>
<div id="footer-container"></div>
<script src="resources/js/admin/loadAdmin.js"></script>
<script type="text/javascript" src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>
