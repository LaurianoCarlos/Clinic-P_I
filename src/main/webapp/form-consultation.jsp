<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Formulário de Consulta</title>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
</head>
<body>
<%
   String id = request.getParameter("idClient");
%>
<div class="container fs-5">
    <h2 class="my-4">Formulário de Consulta</h2>
    <p>id: <%= id %></p>
    <form action="/create-consultation" method="POST">
        <div class="form-group">
            <label for="horaInput">Horário da Consulta:</label>
            <select class="form-control" name="time" id="horaInput" required>
                <option value="08:00">08:00</option>
                <option value="09:00">09:00</option>
                <option value="10:00">10:00</option>
            </select>
        </div>
        <div class="form-group">
            <label for="dataInput">Data da Consulta:</label>
            <input class="form-control" type="date" id="dataInput" required>
        </div>
        <div class="form-group">
            <label for="animalSelect">Selecione seu Animal:</label>
            <select class="form-control" name="idAnimal" id="animalSelect" required>
                <c:forEach var="animal" items="${sessionScope.animals}">
                    <option name="idAnimal" value="${animal.id}">${animal.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="veterinarianSelect">Selecione o Veterinário:</label>
            <select class="form-control" name="idVeterinarian" id="veterinarianSelect" required>
                <c:forEach var="veterinarian" items="${sessionScope.veterinarians}">
                    <option  name="idVeterinarian" value="${veterinarian.id}">${veterinarian.name}</option>
                </c:forEach>
            </select>
        </div>
        <input type="hidden" name="idClient" value="<%= id %>" required>
        <input type="hidden" id="dataHora" name="dataHora">
        <button class="btn btn-primary" type="submit">Inserir Consulta</button>
    </form>
</div>
<script>
    document.querySelector('form').addEventListener('submit', function(event) {
        var dataInput = document.getElementById("dataInput").value;
        var horaInput = document.getElementById("horaInput").value;

        // Combine a data e a hora em um único formato
        var dataHoraFormatada = dataInput + " " + horaInput;

        // Preencha o campo oculto com o valor combinado
        document.getElementById("dataHora").value = dataHoraFormatada;

        // Evite que o formulário seja enviado automaticamente
        event.preventDefault();

        // Envie o formulário manualmente
        this.submit();
    });
</script>
</body>
</html>
