
function buscarPorCpf() {
    var searchCpf = document.getElementById("searchCpf").value;
    var table = document.querySelector("table");
    var rows = table.getElementsByTagName("tr");

    for (var i = 1; i < rows.length; i++) { // Começando em 1 para pular o cabeçalho.
        var td = rows[i].getElementsByTagName("td")[3]; // A coluna com CPF é a quarta (índice 3).

        if (td) {
            var cpf = td.textContent;
            if (cpf.includes(searchCpf)) {
                rows[i].style.display = "";
            } else {
                rows[i].style.display = "none";
            }
        }
    }
}

var searchButton = document.getElementById("searchButton");
searchButton.addEventListener("click", buscarPorCpf);

var searchCpf = document.getElementById("searchCpf");
searchCpf.addEventListener("input", buscarPorCpf);
