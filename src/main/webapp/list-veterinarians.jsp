<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Veterinários</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div id="header-container"></div>
<main>
    <div class="container">
        <h1 class="my-4 fs-2">Lista de Veterinários</h1>
        <div class="container text-center mt-4">
            <a href="/administrator-panel" class="btn btn-secondary">Voltar ao Painel</a>
        </div>
        <span><a class="btn btn-primary mb-3" href="form-veterinarian.jsp"> Cadastrar Veterinario</a></span>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th>Nome</th>
                <th>CRMV</th>
                <th>CPF</th>
                <th>Endereço</th>
                <th>Email</th>
                <th>Telefone</th>
                <th>Atualizar</th>
                <th>Apagar</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="veterinarian" items="${veterinarians}">
                <tr>
                    <td>${veterinarian.name}</td>
                    <td>${veterinarian.crmv}</td>
                    <td>${veterinarian.cpf}</td>
                    <td>${veterinarian.address}</td>
                    <td>${veterinarian.email}</td>
                    <td>${veterinarian.phone}</td>
                    <td>
                        <form action="form-veterinarian.jsp" method="POST">
                            <input type="hidden" name="veterinarianId" value="${veterinarian.id}">
                            <input type="hidden" name="name" value="${veterinarian.name}">
                            <input type="hidden" name="crmv" value="${veterinarian.crmv}">
                            <input type="hidden" name="email" value="${veterinarian.email}">
                            <input type="hidden" name="cpf" value="${veterinarian.cpf}">
                            <input type="hidden" name="address" value="${veterinarian.address}">
                            <input type="hidden" name="phone" value="${veterinarian.phone}">
                            <button type="submit" class=" btn btn-warning btn-sm">
                                <i class="far fa-edit"></i> Atualizar
                            </button>
                        </form>
                    </td>
                    <td>
                        <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal-${veterinarian.id}">
                            <i class="far fa-trash-alt"></i> Apagar
                        </button>
                        <div class="modal fade " id="deleteModal-${veterinarian.id}" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <form action="/delete-veterinarian" method="POST">
                                        <input type="hidden" name="veterinarianId" value="${veterinarian.id}">
                                        <input type="hidden" name="userId" value="${veterinarian.userId}">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="deleteModalLabel">Confirmação de Exclusão</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Tem certeza de que deseja excluir este Veterinário?</p>
                                            <p>${veterinarian.name}</p>
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