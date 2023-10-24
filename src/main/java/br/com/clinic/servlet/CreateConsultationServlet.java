package br.com.clinic.servlet;

import br.com.clinic.dao.ConsultationDao;
import br.com.clinic.model.Consultation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/create-consultation")
public class CreateConsultationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("form-consultation.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String idClient = req.getParameter("idClient");
        String idAnimal = req.getParameter("idAnimal");
        String idVeterinarian = req.getParameter("idVeterinarian");
        String dateForm = req.getParameter("dataHora") + ":00";

        System.out.println("DATA " + dateForm);
        System.out.println("AM " + idAnimal);
        System.out.println("CL " + idClient);
        System.out.println("Vt " + idVeterinarian);


        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

        Date date = null;

        try {
            date = sdf.parse(dateForm);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        if (date != null){
            new ConsultationDao().createConsultation(new Consultation(date,idAnimal,idClient,idVeterinarian));
            System.out.println("CREATE CONSULTATION");
        } else {
            System.out.println("FALED CREATE CONSULTATION");
        }

    }
}
