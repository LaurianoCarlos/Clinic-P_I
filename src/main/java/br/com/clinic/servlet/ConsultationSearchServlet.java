package br.com.clinic.servlet;

import br.com.clinic.dao.ConsultationDao;
import br.com.clinic.model.Consultation;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/list-query")
public class ConsultationSearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String dataConsulta = request.getParameter("data");
        System.out.println( "Data da Consulta: "+ dataConsulta);

        if (dataConsulta != null && !dataConsulta.isEmpty()) {
            List<Consultation> openConsultations =
                    new ConsultationDao().getOpenConsultationsByDate(dataConsulta);

            for (Consultation c: openConsultations) {
                System.out.println("Consultas: " + c.getDate().toString());
            }
            request.setAttribute("openConsultations", openConsultations);
        }

        request.getRequestDispatcher("list-query.jsp").forward(request, response);
    }
}
