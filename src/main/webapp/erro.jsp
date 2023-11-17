<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt"
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Página de Erro</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<div id="header-container"></div>
<main>
    <div class="container mt-5 mb-5 h-100">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-danger text-white">
                        <h3 class="card-title">Erro</h3>
                    </div>
                    <div class="card-body">
                        <p>Ocorreu um erro. Por favor, tente novamente mais tarde.</p>
                        <a href="http://localhost:8080/" class="btn btn-primary">Voltar para a Página Inicial</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<div id="footer-container"></div>
<script src="resources/js/loadIndex.js"></script>
<script src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
</body>
</html>
