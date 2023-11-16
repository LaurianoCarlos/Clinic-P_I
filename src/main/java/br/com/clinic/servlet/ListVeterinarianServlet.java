package br.com.clinic.servlet;

import br.com.clinic.dao.ClientDao;
import br.com.clinic.dao.VeterinarianDao;
import br.com.clinic.model.Client;
import br.com.clinic.model.Veterinarian;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/list-veterinarians")
public class ListVeterinarianServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        if (req.getSession().getAttribute("loggedUser") == null) {

            resp.sendRedirect("login.jsp");

        } else {

            List<Veterinarian> veterinarians = new VeterinarianDao().findAllVeterinarian();
            req.setAttribute("veterinarians", veterinarians);

            System.out.println("Number of veterinarians found:" + veterinarians.size());
            req.getRequestDispatcher("list-veterinarians.jsp").forward(req, resp);
        }
    }
}