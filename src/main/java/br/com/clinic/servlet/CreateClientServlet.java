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


        if (req.getSession().getAttribute("loggedUser") == null) {

            resp.sendRedirect("login.jsp");

        } else {

            req.getRequestDispatcher("form-client.jsp").forward(req,resp);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("clientId");
        System.out.println("Id: " + id);

        String name = req.getParameter("name");
        String cpf = req.getParameter("cpf");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String userType = String.valueOf(UserType.CLIENT);

        User user = new User(email, password, userType);

        try {
            int userId = createUser(user);

            if (id == null) {
                if (!createClient(name, email, cpf, address, phone, userId)) {
                    resp.sendRedirect("/erro");
                } else {
                    resp.sendRedirect("/list-clients");
                }
            } else {
                updateClient(address, phone, id);
                resp.sendRedirect("/list-clients");
            }
        } catch (SQLException e) {
            resp.sendRedirect("/erro");
        }
    }

    private int createUser(User user) throws SQLException {
        return new UserDao().createUser(user);
    }

    private boolean createClient(String name, String email, String cpf, String address, String phone, int userId) {
        return new ClientDao().createClient(new Client(name, email, cpf, address, phone, userId));
    }

    private void updateClient(String address, String phone, String id) {
        new ClientDao().updateClient(new Client(address, phone, id));
    }
}

