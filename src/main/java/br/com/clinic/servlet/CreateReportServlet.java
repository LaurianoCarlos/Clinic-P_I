package br.com.clinic.servlet;

import br.com.clinic.dao.ReportDao;
import br.com.clinic.model.Report;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/create-report")
public class CreateReportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("form-report.jsp").forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String idAnimal = req.getParameter("idAnimal");
        String consultaId = req.getParameter("consultaId");
        String diagnostico = req.getParameter("diagnostico");

        new ReportDao().createReport(new Report(diagnostico,consultaId,idAnimal));

        resp.sendRedirect("/create-report");



    }
}
