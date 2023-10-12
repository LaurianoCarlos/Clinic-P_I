package br.com.clinic.servlet;

import br.com.clinic.dao.AnimalDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete-animal")
public class DeleteAnimalServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String idAnimal = req.getParameter("idAnimal");
        System.out.println("IdAnimal: " + idAnimal);

        new AnimalDao().deleteAnimalById(idAnimal);

        resp.sendRedirect("list-clients.jsp");
    }
}
