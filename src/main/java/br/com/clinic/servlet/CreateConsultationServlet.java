package br.com.clinic.servlet;

import br.com.clinic.dao.ConsultationDao;
import br.com.clinic.dao.VeterinarianDao;
import br.com.clinic.enums.StatusConsultation;
import br.com.clinic.model.Consultation;
import br.com.clinic.model.Veterinarian;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/create-consultation")
public class CreateConsultationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idClient = req.getParameter("idClient");
        String idAnimal = req.getParameter("idAnimal");
        String idConsult = req.getParameter("idConsult");

        System.out.println("DADOS\n" +
                "ID_Client: "+ idClient + " \n"+ "ID_Animal: " + idAnimal + "\n" + "\n" + "IdConult: " + idConsult );

        new ConsultationDao().scheduleConsultation(idConsult,idAnimal,idClient);

        resp.sendRedirect("/list-animals?clientId=" + idClient);
    }
}
