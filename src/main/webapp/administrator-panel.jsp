<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Logo</a>
        </div>
    </nav>
</header>
<main class="row">
    <p>Nome do Veterinário: <c:out value="${sessionScope.loggedUser.name}" /></p>
    <div class="col-2 list-group bg-body-secondary vh-100">
        <a href="/form-consultation.jsp" class="list-group-item list-group-item-action list-group-item-dark content-link">Marcar Consulta</a>
        <a href="/list-clients" class="list-group-item list-group-item-action list-group-item-dark content-link">Clientes</a>
        <hr>
        <a href="/list-veterinarians" class="list-group-item list-group-item-action list-group-item-dark content-link">Listar Veteriarios</a>
    </div>
    <div class="col-10" id="content-area">

    </div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
    const contentArea = document.getElementById('content-area');
    const contentLinks = document.querySelectorAll('.content-link');

    contentLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const href = link.getAttribute('href');
            fetch(href)
                .then(response => response.text())
                .then(data => {
                    contentArea.innerHTML = data;
                });
        });
    });
</script>
</body>
</html>