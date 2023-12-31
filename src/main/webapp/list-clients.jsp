<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>
    <link rel="icon" type="image/x-icon" href="/resources/img/favicon-32x32.png">
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <script src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
</head>
<link rel="stylesheet" href="/resources/css/index.css">
<body>
<div id="header-container"></div>
<div class="container h-100">
    <h1 class="my-4 text-center">Clientes</h1>
    <div class="container text-center mt-4">
        <a href="/administrator-panel" class="btn btn-secondary">Voltar ao Painel</a>
    </div>
    <div class="form-group">
        <label for="searchCpf">Buscar por CPF:</label>
        <input type="text" class="form-control" id="searchCpf" placeholder="Digite o CPF">
        <button class="btn btn-primary mt-3 mb-3" id="searchButton">Buscar</button>
    </div>
    <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
            <th>Nome</th>
            <th>Email</th>
            <th>CPF</th>
            <th>Endereço</th>
            <th>Telefone</th>
            <th>Listar Animais</th>
            <th>Atualizar Dados</th>
            <th>Apagar</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="client" items="${clients}">
            <tr>
                <td>${client.name}</td>
                <td>${client.email}</td>
                <td>${client.cpf}</td>
                <td>${client.address}</td>
                <td>${client.phone}</td>
                <td class="d-flex">
                    <form action="/list-animals" method="GET" class="d-flex">
                        <input type="hidden" name="clientId" value="${client.id}">
                        <input type="hidden" name="nameClient" value="${client.name}">
                        <button type="submit" class="btn btn-primary btn-sm">
                            <i class="fas fa-paw align-middle"></i> Animais
                        </button>
                    </form>
                </td>
                <td>
                    <form action="form-client.jsp" method="POST">
                        <input type="hidden" name="clientId" value="${client.id}">
                        <input type="hidden" name="nameClient" value="${client.name}">
                        <input type="hidden" name="email" value="${client.email}">
                        <input type="hidden" name="cpf" value="${client.cpf}">
                        <input type="hidden" name="address" value="${client.address}">
                        <input type="hidden" name="phone" value="${client.phone}">
                        <button type="submit" class=" btn btn-warning btn-sm">
                            <i class="far fa-edit"></i> Atualizar
                        </button>
                    </form>
                </td>
                <td>
                    <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal"
                            data-bs-target="#deleteModal-${client.id}">
                        <i class="far fa-trash-alt"></i> Apagar
                    </button>
                    <div class="modal fade " id="deleteModal-${client.id}" tabindex="-1"
                         aria-labelledby="deleteModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <form action="/delete-client" method="POST">
                                    <input type="hidden" name="clientId" value="${client.id}">
                                    <input type="hidden" name="userId" value="${client.userId}">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="deleteModalLabel">Confirmação de Exclusão</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Tem certeza de que deseja excluir este cliente?</p>
                                        <p>${client.name}</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                            Cancelar
                                        </button>
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
<div id="footer-container"></div>
<script src="resources/js/seachCpf.js"></script>
<script src="resources/js/admin/loadAdmin.js"></script>
<script type="text/javascript" src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>