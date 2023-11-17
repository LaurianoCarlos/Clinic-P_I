<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Animais do Cliente</title>
    <link rel="icon" type="image/x-icon" href="/resources/img/favicon-32x32.png">
    <link rel="stylesheet"
          href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div id="header-container"></div>
<main>
    <div class="container fs-5">
        <h1 class="my-4 fs-2">Animais</h1>
        <h2 class="fs-2">Cliente: ${nameClient}</h2>
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
        <a class="btn btn-primary my-3"
           href="form-animal.jsp?clientId=${clientId}">Cadastrar Animal</a>
        <%
            String admin = request.getParameter("admin");

        %>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th>Nome</th>
                <th>Espécie</th>
                <th>Tamanho</th>
                <th>Consultas</th>
                <th>Laudos</th>
                <th>Marcar Consulta</th>
                <th>Excluir</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="animal" items="${animals}">
                <tr>
                    <td>${animal.name}</td>
                    <td>${animal.specie}</td>
                    <td>${animal.size}</td>
                    <td>
                        <form action="/my-queries" method="post">
                            <input type="hidden" name="idAnimal"  value="${animal.id}">
                            <button type="submit" class="btn btn-primary"> Consultas
                            </button>
                        </form>
                    </td>
                    <td>
                        <form action="/list-report" method="get">
                            <input type="hidden" name="idAnimal"  value="${animal.id}">
                            <input type="hidden" name="animalName"  value="${animal.name}">
                            <button type="submit" class="btn btn-primary"> Laudos
                            </button>
                        </form>
                    </td>
                    <td>
                        <form action="/list-query" method="get">
                            <input type="hidden" name="idAnimal" value="${animal.id}">
                            <input type="hidden" name="idClient" value="${clientId}">
                            <button type="submit" class="btn btn-primary">Marcar Consulta</button>
                        </form>
                    </td>
                    <td>
                        <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal-${client.id}">
                            <i class="far fa-trash-alt"></i> Excluir
                        </button>
                        <div class="modal fade " id="deleteModal-${client.id}" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <form action="/delete-animal" method="POST">
                                        <input type="hidden" name="idAnimal" value="${animal.id}">
                                        <input type="hidden" name="idClient" value="${clientId}">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="deleteModalLabel">Confirmação de Exclusão</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Tem certeza de que deseja excluir este animal?</p>
                                            <p>${animal.name}</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                            <button type="submit" class="btn btn-danger">Confirmar Exclusão</button>
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
