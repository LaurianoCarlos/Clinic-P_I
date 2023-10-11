package br.com.clinic.servlet;

import br.com.clinic.dao.AnimalDao;
import br.com.clinic.model.Animal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-animal")
public class CreateAnimalServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String idClient = req.getParameter("idClient");
        String name = req.getParameter("name");
        String specie = req.getParameter("specie");
        String size = req.getParameter("size");



        Animal animal = new Animal(name,specie,size,idClient);
        AnimalDao animalDao = new AnimalDao();

        animalDao.createAnimal(animal);

        resp.sendRedirect("list-animals");
    }
}
