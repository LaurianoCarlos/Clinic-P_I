package br.com.clinic.servlet;

import br.com.clinic.dao.AttendantDao;
import br.com.clinic.dao.ReportDao;
import br.com.clinic.model.Attendant;
import br.com.clinic.model.Report;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/list-report")
public class ListReportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {



        if (req.getSession().getAttribute("loggedUser") == null) {

            resp.sendRedirect("login.jsp");

        } else {

            String animalId = req.getParameter("idAnimal");

            List<Report> reports = new ReportDao().getReportsById(animalId);
            req.setAttribute("reports", reports);

            System.out.println("Número de reports encontrados: " + reports.size());
            req.getRequestDispatcher("list-report.jsp").forward(req, resp);
        }
    }
}