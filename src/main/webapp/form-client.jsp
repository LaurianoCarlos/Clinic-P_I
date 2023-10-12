<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Usuário/Cliente</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Cadastro de Usuário/Cliente</h1>
    <%
        String clientId = request.getParameter("clientId");
        String name = request.getParameter("nameClient");
        String email = request.getParameter("email");
        String cpf = request.getParameter("cpfClient");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
    %>

    <% if (clientId == null) { %>
    <form action="/create-client" method="POST">
        <!-- Campos do Cliente -->
        <div class="mb-3">
            <label for="name" class="form-label">Nome:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="mb-3">
            <label for="cpf" class="form-label">CPF:</label>
            <input type="text" class="form-control" id="cpf" name="cpf" required>
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">Endereço:</label>
            <input type="text" class="form-control" id="address" name="address" required>
        </div>
        <div class="mb-3">
            <label for="phone" class="form-label">Telefone:</label>
            <input type="text" class="form-control" id="phone" name="phone" required>
        </div>
        <!-- USUARIO -->
        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Senha:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary">Cadastrar</button>
    </form>
    <% } %>

    <% if (clientId != null) { %>
    <form method="post" action="/create-client">

        <input type="text" class="form-control" name="clientId" value="<%= clientId %>">

        <div class="mb-3">
            <label class="form-label">Nome:</label>
            <input type="text" class="form-control" name="name" required value="<%= name %>" disabled>
        </div>
        <div class="mb-3">
            <label class="form-label">Email:</label>
            <input type="email" class="form-control" name="email" required value="<%= email %>" disabled>
        </div>
        <div class="mb-3">
            <label class="form-label">CPF:</label>
            <input type="text" class="form-control" name="cpf" required value="<%= cpf %>" disabled>
        </div>
        <div class="mb-3">
            <label class="form-label">Endereço:</label>
            <input type="text" class="form-control" name="address" required value="<%= address %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Telefone:</label>
            <input type="text" class="form-control" name="phone" required value="<%= phone %>">
        </div>
        <button type="submit" class="btn btn-primary">Atualizar</button>
    </form
    <% } %>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
