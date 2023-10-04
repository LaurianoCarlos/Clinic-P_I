/*load-header.js*/
     fetch("/layout/header.html")
    .then(response => response.text())
    .then(data => {
        const headerContainer = document.getElementById("header-container");
        headerContainer.innerHTML = data;
    });


    fetch("/layout/footer.html")
    .then(response => response.text())
    .then(data => {
        const headerContainer = document.getElementById("footer-container");
        headerContainer.innerHTML = data;
    });