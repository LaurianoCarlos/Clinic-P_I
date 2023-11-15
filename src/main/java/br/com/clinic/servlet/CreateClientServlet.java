package br.com.clinic.servlet;

import br.com.clinic.dao.ClientDao;
import br.com.clinic.dao.UserDao;
import br.com.clinic.enums.UserType;
import br.com.clinic.model.Client;
import br.com.clinic.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/create-client")
public class CreateClientServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("form-client.jsp").forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("clientId");

        System.out.println("Idd: " + id);

        String name = req.getParameter("name");
        String cpf = req.getParameter("cpf");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");

        //data User
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String userType = String.valueOf(UserType.CLIENT);

        User user = new User(email, password, userType);


        int userId = 0;
        if (id == null) {

            userId = 0;
            try {
                userId = new UserDao().createUser(user);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            Client client = new Client(name, email, cpf, address, phone, userId);

            new ClientDao().createClient(client);
            resp.sendRedirect("/form-client.jsp");

        } else {

            Client client = new Client(address,phone,id);
            new ClientDao().updateClient(client);
            resp.sendRedirect("/client-panel");
        }
    }
}
