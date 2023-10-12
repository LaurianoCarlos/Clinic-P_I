package br.com.clinic.servlet;

import br.com.clinic.dao.AnimalDao;
import br.com.clinic.model.Animal;
import org.jetbrains.annotations.NotNull;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/list-animals")
public class ListAnimalServlet extends HttpServlet {

    @Override
    protected void doGet(@NotNull HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String clientId = req.getParameter("clientId");
        System.out.println("Id do cliente:" + clientId);
        String nameClient = req.getParameter("nameClient");
        List<Animal> animals = new AnimalDao().findAllAnimals(clientId);
        req.setAttribute("animals", animals);
        req.setAttribute("nameClient", nameClient);
        req.setAttribute("clientId", clientId);

        System.out.println("Número de animais02 encontrados: " + animals.size());
        req.getRequestDispatcher("list-animals.jsp").forward(req, resp);
    }
}
