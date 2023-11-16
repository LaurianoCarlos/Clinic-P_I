package br.com.clinic.servlet;

import br.com.clinic.dao.ConsultationDao;
import br.com.clinic.model.Consultation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/my-queries")
public class MyQueriesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        if (req.getSession().getAttribute("loggedUser") == null) {

            resp.sendRedirect("login.jsp");

        } else {

            String idClient = req.getParameter("idAnimal");
            List<Consultation> consultations = new ConsultationDao().findAllConsultationByAnimalId(idClient);
            req.setAttribute("consultations", consultations);

            req.getRequestDispatcher("my-queries.jsp").forward(req, resp);
        }
    }
}