package br.com.clinic.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/administrator-panel", "/admin/administrator-panel"})
public class AdministratorPanelServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession().getAttribute("loggedUser") == null) {

            response.sendRedirect("login.jsp");

        } else {

            request.getRequestDispatcher("/administrator-panel.jsp").forward(request, response);
        }
    }
}
