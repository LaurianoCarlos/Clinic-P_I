package br.com.clinic.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class IndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implemente a lógica para processar a solicitação aqui
        // Por exemplo, redirecionar para a página index.html
        request.getRequestDispatcher("/index.html").forward(request, response);
    }
}
