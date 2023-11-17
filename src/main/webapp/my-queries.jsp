<%@ page import="br.com.clinic.model.Client" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Consultation Results</title>
    <link rel="icon" type="image/x-icon" href="/resources/img/favicon-32x32.png">
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<%
    String idAnimal = request.getParameter("idAnimal");
    String clientId = "";

    //tratamento de erro
    //Verifica se o usuario na sessão é do tipo Client
    Object userObj = session.getAttribute("loggedUser");

    if (userObj != null && userObj instanceof Client) {
        Client client = (Client) userObj;
        clientId = client.getId();
    }
%>
<div id="header-container"></div>
    <main>
    <div class="container mt-4">
        <h1 class="fs-2">Lista de Consultas</h1>
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

        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Data</th>
                    <c:if test="${not empty admin}">
                        <th>Atribuir Diagnóstico</th>
                    </c:if>
                    <th>Desmarcar Consulta</th>
                </tr>

            </thead>
            <c:forEach items="${consultations}" var="consulta">
                <tr>
                    <td>${consulta.date}</td>
                    <c:if test="${not empty admin}">
                        <td>
                            <form action="/create-report" method="get">
                                <input type="hidden" name="idConsultation" value="${consulta.id}">
                                <input type="hidden" name="idAnimal" value="<%= idAnimal%>">
                                <button type="submit" class="btn btn-primary">Atribuir Diagnóstico ${consulta.id}</button>
                            </form>
                        </td>
                    </c:if>
                    <td>
                        <div>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                Desmarcar Consulta
                            </button>
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Desmarcar Consulta</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Tem certeza de deseja desmarcar a consulta?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                            <form action="/delete-consultation" method="post">
                                                <input type="hidden" name="idConsultation" value="${consulta.id}">
                                                <input type="hidden" name="idAnimal" value="<%= idAnimal%>">
                                                <button type="submit" class="btn btn-primary">Desmarcar Consulta</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                           </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
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
