package br.com.clinic.servlet;

import br.com.clinic.dao.ClientDao;
import br.com.clinic.dao.UserDao;
import br.com.clinic.dao.VeterinarianDao;
import br.com.clinic.enums.UserType;
import br.com.clinic.model.Client;
import br.com.clinic.model.User;
import br.com.clinic.model.Veterinarian;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       System.out.println("ESTOU AQUI");
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("ESTOU AQUI FORM");

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User isValidUser = new UserDao().verifyCredentials(new User(email, password));

        if (isValidUser != null) {
            UserType userType = UserType.valueOf(isValidUser.getUserType());

            switch (userType) {
                case VETERINARIAN:
                    veterinarianLogin(req, resp, isValidUser.getId());
                    break;
                case CLIENT:
                    clientLogin(req, resp, isValidUser.getId());
                    break;
                case ATTENDANT:
                    resp.sendRedirect("/list-attendants");
                    break;
                default:
                    //invalidCredentials(req, resp);
                    break;
            }
        } else {
            invalidCredentials(req, resp);
        }
    }

    private void veterinarianLogin(HttpServletRequest req, HttpServletResponse resp, String userId) throws ServletException, IOException {
        Veterinarian veterinarian = new VeterinarianDao().getVeterinarianByUserID(userId);
        HttpSession session = req.getSession();
        session.setAttribute("loggedUser", veterinarian);
        resp.sendRedirect("/administrator-panel");
    }
    private void clientLogin(HttpServletRequest req, HttpServletResponse resp, String userId) throws ServletException, IOException {
        Client client = new ClientDao().getClientByUserID(userId);
        HttpSession session = req.getSession();
        session.setAttribute("loggedUser", client);
        resp.sendRedirect("/client-panel");
    }
    private void invalidCredentials(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String erro = "Credenciais inválidas";
        req.getSession().setAttribute("erro", erro);
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
}
