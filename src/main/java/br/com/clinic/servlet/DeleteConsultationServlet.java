package br.com.clinic.servlet;

import br.com.clinic.dao.ConsultationDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;


@WebServlet("/delete-consultation")
public class DeleteConsultationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id =  req.getParameter("idConsultation");
        String idAnimal =  req.getParameter("idAnimal");
        System.out.println("idConsultation:" + id);

        new ConsultationDao().deleteConsultationById(id);

        req.getSession().setAttribute("deleteConsultation", "Consulta desmarcada com sucesso!");
        req.getSession().setAttribute("idAnimal", idAnimal);

        req.getRequestDispatcher("/my-queries").forward(req, resp);

    }
}