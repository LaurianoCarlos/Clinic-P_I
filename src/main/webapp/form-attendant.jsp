<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário de Cadastro</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="resources/img/veterinaria-logo.png" width="100" height="100"
                                                      alt="Logo"></a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white">Informações</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white">Dicas</a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link text-white">Sobre</a>
                        </li>
                    </ul>
                    <div class="d-flex">
                        <a class="btn btn-secondary" href="/login">
                            <img src="resources/img/svg/user.svg">
                            Logi
                        </a>
                    </div>
                </div>
            </div>
        </nav>
    </header>
<div id="header-container"></div>
<%
    String attendantId = request.getParameter("attendantId");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String cpf = request.getParameter("cpf");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
%>
<% if (attendantId == null ){%>
<div class="container mt-4 mb-4">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8 col-sm-10">
<h1<div class="container mt-4 mb-4">
  <div class="row justify-content-center">
     <div class="col-lg-6 col-md-8 col-sm-10">Formulário de Cadastro</h1>
<form action="/create-attendant" method="POST">
    <div class="mb-3">
        <label class="form-label">Nome:</label>
        <input type="text" class="form-control" name="name" required>
    </div>
    <div class="mb-3">
        <label  class="form-label">CPF:</label>
        <input type="text" class="form-control"  name="cpf" required>
    </div>
    <div class="mb-3">
        <label  class="form-label">Endereço:</label>
        <input type="text" class="form-control"  name="address" required>
    </div>
    <div class="mb-3">
        <label  class="form-label">Telefone:</label>
        <input type="text" class="form-control"  name="phone" required>
    </div>
    <div class="mb-3">
        <label class="form-label">E-mail:</label>
        <input type="email" class="form-control"  name="email" required>
    </div>
    <div class="mb-3">
        <label class="form-label">Senha:</label>
        <input type="password" class="form-control" name="password" required>
    </div>
    <button type="submit" class="btn btn-primary">Enviar</button>
</form>
<%}%>

<% if (attendantId != null ){%>
<div class="container mt-4 mb-4">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8 col-sm-10">
<h1 class="text-center mb-4">Formulário de Atualizar</h1>
<p>id: <%= attendantId%></p>
<form action="/create-attendant" method="POST">
    <input type="hidden" name="attendantId" value="<%= attendantId%>">
    <div class="mb-3">
        <label class="form-label">Nome:</label>
        <input type="text" class="form-control"  name="name" value="<%= name %>" disabled>
    </div>
    <div class="mb-3">
        <label class="form-label">CPF:</label>
        <input type="text" class="form-control" name="cpf" value="<%= cpf %>"  disabled>
    </div>
    <div class="mb-3">
        <label class="form-label">Endereço:</label>
        <input type="text" class="form-control"  name="address" value="<%= address %>" required>
    </div>
    <div class="mb-3">
        <label class="form-label">Telefone:</label>
        <input type="text" class="form-control"  name="phone" value="<%= phone %>" required>
    </div>
    <div class="mb-3">
        <label class="form-label">E-mail:</label>
        <input type="email" class="form-control"  name="email" value="<%= email%>" disabled>
    </div>

    <button type="submit" class="btn btn-primary">Atualizar</button>
</form>
<%}%>
<footer class="container-fluid bg-tertiary pt-7">
    <div
            class="row mb-4 text-white justify-content-center align-items-center">
        <div class="col-md-4">
            <div class="footer-text pull-left">
                <div class="d-flex">
                    <a href="index.html"><img
                            src="resources/img/veterinaria-logo.png"
                            width="100" alt></a>
                </div>
                <p class="card-text">A Clínica Veterinária Senac Sul é
                    dedicada ao bem-estar dos animais de estimação.
                    Nossos veterinários altamente qualificados e equipe
                    experiente estão prontos para cuidar do seu amado
                    animal de estimação.</p>
            </div>
        </div>
        <div class="col-md-2">
            <h5 class="heading">Serviços</h5>
            <ul class="card-text">
                <li><a class="text-decoration-none link-light" href>Consultoria
                    Veterinária</a></li>
                <li><a class="text-decoration-none link-light" href>Exames
                    de Laboratório</a></li>
                <li><a class="text-decoration-none link-light" href>Tratamento
                    de Doenças</a></li>
            </ul>
        </div>
        <div class="col-md-2">
            <h5 class="heading">Especialidades</h5>
            <ul class="card-text">
                <li><a class="text-decoration-none link-light" href>Tratamento
                    de Emergência</a></li>
                <li><a class="text-decoration-none link-light" href>Cuidados
                    Preventivos</a></li>
                <li><a class="text-decoration-none link-light" href>Animais
                    de Pequeno Porte</a></li>
            </ul>
        </div>
        <div class="col-md-2">
            <h5 class="heading">Empresa</h5>
            <ul class="card-text">
                <li><a class="text-decoration-none link-light" href>Sobre
                    Nós</a></li>
                <li><a class="text-decoration-none link-light" href>Contato</a></li>
                <li><a class="text-decoration-none link-light" href>Carreiras</a></li>
            </ul>
        </div>
    </div>
    <p class="text-center text-white">&copy;Todos os Direitos Reservados
        - 2023</p>
</footer>
<script src="resources/js/loadIndex.js"></script>
<script src="/webjars/bootstrap/5.3.1/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
