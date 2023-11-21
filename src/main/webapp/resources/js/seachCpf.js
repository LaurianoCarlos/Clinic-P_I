function buscarPorCpf() {
    var searchCpf = document.getElementById("searchCpf").value.toLowerCase();
    var table = document.querySelector("table");
    var rows = table.getElementsByTagName("tr");

    for (var i = 1; i < rows.length; i++) {
        var td = rows[i].getElementsByTagName("td")[2];//indice 2 para a coluna do CPF.

        if (td) {
            var cpf = td.textContent.toLowerCase();

            var match = cpf.includes(searchCpf);

            rows[i].style.display = match ? "" : "none";
        }
    }
}

var searchCpf = document.getElementById("searchCpf");
searchCpf.addEventListener("input", buscarPorCpf);
