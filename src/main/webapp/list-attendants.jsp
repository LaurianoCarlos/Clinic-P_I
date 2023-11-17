<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Atendentes</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div id="header-container"></div>
<main>
    <div class="container">
        <h1 class="my-4">Atendentes</h1>
        <div class="container text-center mt-4">
            <a href="/administrator-panel" class="btn btn-secondary">Voltar ao Painel</a>
        </div>
        <span><a class="btn btn-primary mb-3" href="/create-attendant">Cadastrar Atendentes</a></span>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th>Nome</th>
                <th>Email</th>
                <th>CPF</th>
                <th>Endereço</th>
                <th>Telefone</th>
                <th>Atualizar Dados</th>
                <th>Apagar</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="attendant" items="${attendants}">
                <tr>
                    <td>${attendant.name}</td>
                    <td>${attendant.email}</td>
                    <td>${attendant.cpf}</td>
                    <td>${attendant.address}</td>
                    <td>${attendant.phone}</td>
                    <td>
                        <form action="/create-attendant" method="GET">
                            <input type="hidden" name="attendantId" value="${attendant.id}">
                            <input type="hidden" name="name" value="${attendant.name}">
                            <input type="hidden" name="email" value="${attendant.email}">
                            <input type="hidden" name="cpf" value="${attendant.cpf}">
                            <input type="hidden" name="address" value="${attendant.address}">
                            <input type="hidden" name="phone" value="${attendant.phone}">
                            <button type="submit" class=" btn btn-warning btn-sm">
                                <i class="far fa-edit"></i> Atualizar
                            </button>
                        </form>
                    </td>
                    <td>
                        <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal-${attendant.id}">
                            <i class="far fa-trash-alt"></i> Apagar
                        </button>
                        <div class="modal fade " id="deleteModal-${attendant.id}" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <form action="/delete-attendant" method="POST">
                                        <input type="hidden" name="attendantId" value="${attendant.id}">
                                        <input type="hidden" name="userId" value="${attendant.userId}">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="deleteModalLabel">Confirmação de Exclusão</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Tem certeza de que deseja excluir este Atendente?</p>
                                            <p>${attendant.name}</p>
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
<script src="resources/js/admin/loadAdmin.js"></script>
<script type="text/javascript" src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>
