package br.com.clinic.servlet;

import br.com.clinic.dao.ClientDao;
import br.com.clinic.dao.UserDao;
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String name = req.getParameter("name");
        String cpf = req.getParameter("cpf");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String userType = "client";


        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        user.setUserType(userType);

        int userId; // Variável para armazenar o ID do usuário

        UserDao userDao = new UserDao();
        try {
            userId = userDao.createUser(user); // Obtém o ID do usuário criado
        } catch (SQLException e) {
            // Lide com exceções de banco de dados aqui, se necessário
            e.printStackTrace();
            return; // Saia da função se ocorrer um erro
        }


        Client client = new Client();
        client.setName(name);
        client.setCpf(cpf);
        client.setAddress(address);
        client.setPhone(phone);
        client.setEmail(email);
        client.setUserId(userId); // Define o ID do usuário no objeto Client

        // Chama o método createClient para inserir o cliente no banco de dados
        ClientDao clientDao = new ClientDao();
        clientDao.createClient(client);

        // Redireciona de volta para a página inicial ou outra página apropriada
        resp.sendRedirect("/");
    }
}
