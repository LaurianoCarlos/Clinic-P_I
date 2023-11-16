package br.com.clinic.servlet;

import br.com.clinic.dao.ConsultationDao;
import br.com.clinic.model.Consultation;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/list-consultation")
public class ListConsultationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        if (req.getSession().getAttribute("loggedUser") == null) {

            resp.sendRedirect("login.jsp");

        } else {

            req.getRequestDispatcher("list-consultation.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String date = req.getParameter("date");
        List<Consultation> consultations = new ConsultationDao().getConsultationsForDay(date);
        req.setAttribute("consultations", consultations);

        req.getRequestDispatcher("list-consultation.jsp").forward(req, resp);
    }
}