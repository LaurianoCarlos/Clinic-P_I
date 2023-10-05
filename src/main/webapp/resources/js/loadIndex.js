/*load-header.js*/
     fetch("resources/layout/header.html")
    .then(response => response.text())
    .then(data => {
        const headerContainer = document.getElementById("header-container");
        headerContainer.innerHTML = data;
    });


    fetch("resources/layout/footer.html")
    .then(response => response.text())
    .then(data => {
        const headerContainer = document.getElementById("footer-container");
        headerContainer.innerHTML = data;
    });