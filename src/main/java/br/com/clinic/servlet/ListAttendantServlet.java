package br.com.clinic.servlet;

import br.com.clinic.dao.AttendantDao;
import br.com.clinic.dao.ClientDao;
import br.com.clinic.model.Attendant;
import br.com.clinic.model.Client;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/list-attendants")
public class ListAttendantServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Attendant> attendants = new AttendantDao().findAllAttendants();
        req.setAttribute("attendants", attendants);

        System.out.println("Número de atendentes encontrados: " + attendants.size());
        req.getRequestDispatcher("list-attendants.jsp").forward(req, resp);
    }
}

