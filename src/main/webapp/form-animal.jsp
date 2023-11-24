<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <title>Formulário de Cadastro de Animal</title>
    <link rel="icon" type="image/x-icon" href="/resources/img/favicon-32x32.png">
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div id="header-container"></div>
<main>
    <div class="container mb-3">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <h2 class="mb-4">Cadastro de Animal</h2>
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
                <form action="/create-animal" method="post">
                    <input type="hidden" name="clientId" value="${param.clientId}">

                    <div class="form-group">
                        <label for="name">Nome:</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="specie">Espécie:</label>
                        <input type="text" class="form-control" id="specie" name="specie" required>
                    </div>
                    <div class="form-group">
                        <label for="size">Tamanho:</label>
                        <select class="form-control" id="size" name="size" required>
                            <option value="" disabled selected>Escolha um tamanho</option>
                            <option value="Grande">Grande</option>
                            <option value="Médio">Médio</option>
                            <option value="Pequeno">Pequeno</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary mt-4">Cadastrar</button>
                </form>
            </div>
        </div>
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
