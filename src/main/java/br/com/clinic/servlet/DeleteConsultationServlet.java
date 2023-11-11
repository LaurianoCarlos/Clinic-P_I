package br.com.clinic.servlet;

import br.com.clinic.dao.ConsultationDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/delete-consultation")
public class DeleteConsultationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id =  req.getParameter("idConsultation");
        System.out.println("idConsultation:" + id);

        new ConsultationDao().deleteConsultationById(id);

        String success = "Excluido com sucesso";
        req.getSession().setAttribute("success", success);

        resp.sendRedirect("/list-consultation");
    }
}