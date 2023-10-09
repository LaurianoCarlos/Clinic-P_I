package br.com.clinic.servlet;

import br.com.clinic.dao.ClientDao;
import br.com.clinic.model.Client;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/list-clients")
public class ListClientServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Client> clients = new ClientDao().findAllClients();
        req.setAttribute("clients", clients);

        System.out.println("Número de clientes encontrados: " + clients.size());
        req.getRequestDispatcher("list-clients.jsp").forward(req, resp);
    }
}

