package br.com.clinic.servlet;

import br.com.clinic.dao.ConsultationDao;
import br.com.clinic.dao.VeterinarianDao;
import br.com.clinic.model.Veterinarian;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.Year;
import java.util.List;

@WebServlet("/gerenate-queries")
public class GenerateQueries extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Veterinarian> veterinarians = new VeterinarianDao().findAllVeterinarian();
        req.setAttribute("veterinarians", veterinarians);

        req.getRequestDispatcher("/form-generate-queries.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Estou AQUI MARACNDO CONSULTAS");
        int year = Integer.parseInt(req.getParameter("year"));
        int month = Integer.parseInt(req.getParameter("month"));
        String idVeterinarian = req.getParameter("idVeterinarian");

        System.out.println("ano:" + year);
        System.out.println("mes:" + month);

        new ConsultationDao().createConsultationsForMonth(year, month,idVeterinarian);

        String success = "Atendimentos Gerados";
        req.getSession().setAttribute("success", success);
        req.getRequestDispatcher("/form-generate-queries.jsp").forward(req, resp);
    }
}
