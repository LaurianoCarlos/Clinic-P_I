<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Resultados da Consulta</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div id="header-container"></div>
<main>
    <div class="container">
        <%
            String idAnimal = request.getParameter("idAnimal");
            String idClient = request.getParameter("idClient");
        %>
        <h2 class="fs-2">Agendar Consultas</h2>
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
        <h1 class="my-4 fs-2">Selecione uma data</h1>
        <form action="/list-query" method="GET">
            <input type="hidden" name="idClient" value="<%= idAnimal%>">
            <input type="hidden" name="idAnimal" value="<%= idClient%>">
            <label for="data">Data da Consulta:</label>
            <input type="date" id="data" name="data" placeholder="YYYY-MM-DD" required>
            <button type="submit" class="btn btn-primary">Buscar Horários Disponíveis</button>
        </form>

        <!-- Se a lista não estiver vazia -->
        <c:if test="${not empty openConsultations}">
            <table class="table table-bordered">
                <thead class="thead-dark">
                <tr>
                    <th>Data e Hora</th>
                    <th>Veterinário</th>
                    <th>Marcar Consulta</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${openConsultations}" var="consulta">
                    <tr>
                        <td>
                            <!--usado para formatar a data-->
                            <fmt:formatDate value="${consulta.date}" pattern="dd/MM/yyyy HH:mm:ss" />
                        </td>
                        <td>${consulta.veterinarianName}</td>
                        <td>
                            <form action="/create-consultation" method="post">
                                <input type="hidden" name="idConsult" value="${consulta.id}">
                                <input type="hidden" name="idClient" value="<%= idAnimal%>">
                                <input type="hidden" name="idAnimal" value="<%= idClient%>">
                                <input type="hidden" name="date" value="${consulta.date}">
                                <button type="submit" class="btn btn-primary">Marcar Consulta</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
        <!-- Lista vazia -->
        <c:if test="${empty openConsultations}">
            <p>Nenhuma consulta disponivel para a data especificada.</p>
        </c:if>
    </div>
</main>
<div id="footer-container"></div>
<script>
    function goBack() {
        window.history.back();
    }
</script>
<script src="resources/js/admin/loadAdmin.js"></script>
<script type="text/javascript" src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>
