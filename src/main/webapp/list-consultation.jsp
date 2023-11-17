<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Consultas</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div id="header-container"></div>
<div class="container mt-4">
    <h1 class="fs-1">Verificar Consultas</h1>
    <div class="container text-center mt-4">
        <a href="/administrator-panel" class="btn btn-secondary">Voltar ao Painel</a>
    </div>
    <h2 class="fs-4">Selecione uma data</h2>
    <form action="/list-consultation" method="POST">
        <div class="form-group">
            <label for="date">Data da Consulta:</label>
            <input type="date" class="form-control" id="date" name="date" required>
        </div>
        <button type="submit" class="btn btn-primary mt-3">Buscar Consultas</button>
    </form>

    <c:if test="${empty consultations}">
        <p class="mt-5">Nenhuma consulta disponivel</p>
    </c:if>

    <c:if test="${not empty consultations}">
    <table class="table table-bordered mt-4">
        <thead class="thead-dark">
        <tr>
            <th>Data e Hora</th>
            <th>Nome do Cliente</th>
            <th>Nome do Animal</th>
            <th>Nome do Veterinário</th>
            <th>Desmarcar Consulta</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="consultation" items="${consultations}">
            <tr>
                <td>
                    <fmt:formatDate value="${consultation.date}" pattern="dd/MM/yyyy HH:mm:ss" />
                </td>
                <td>${consultation.clientName}</td>
                <td>${consultation.animalName}</td>
                <td>${consultation.veterinarianName}</td>
                <td>
                    <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal-${consultation.id}">
                        <i class="far fa-trash-alt"></i> Desmarcar Consulta
                    </button>
                    <div class="modal fade " id="deleteModal-${consultation.id}" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <form action="/delete-consultation" method="POST">
                                    <input type="hidden" name="idConsultation" value="${consultation.id}">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="deleteModalLabel">Confirmação de Exclusão</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Tem certeza de que deseja desmarcar a consulta ?</p>
                                        <p class="fw-bold">Data e Hora</p>
                                        <p><fmt:formatDate value="${consultation.date}" pattern="dd/MM/yyyy HH:mm:ss" /></p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                        <button type="submit" class="btn btn-danger">Desmarcar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </c:if>
</div>
<div id="footer-container"></div>
<script src="resources/js/admin/loadAdmin.js"></script>
<script type="text/javascript" src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>
