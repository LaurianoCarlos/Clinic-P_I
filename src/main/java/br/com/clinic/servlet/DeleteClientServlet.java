package br.com.clinic.servlet;

import br.com.clinic.dao.AnimalDao;
import br.com.clinic.dao.ClientDao;
import br.com.clinic.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete-client")
public class DeleteClientServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      String clientId =  req.getParameter("clientId");
      String userId = req.getParameter("userId");

      System.out.println("idClient: " + clientId);
      System.out.println("userID: " + userId);

      new AnimalDao().deleteAnimalsByClientId(clientId);
      new ClientDao().deleteClientById(clientId);
      new UserDao().deleteUserById(userId);

      resp.sendRedirect("list-clients.jsp");
    }
}
