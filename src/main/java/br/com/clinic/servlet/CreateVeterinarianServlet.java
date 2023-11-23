
package br.com.clinic.servlet;

import br.com.clinic.dao.UserDao;
import br.com.clinic.dao.VeterinarianDao;
import br.com.clinic.enums.UserType;
import br.com.clinic.model.User;
import br.com.clinic.model.Veterinarian;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/create-veterinarian")
public class CreateVeterinarianServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        if (req.getSession().getAttribute("loggedUser") == null) {

            resp.sendRedirect("login.jsp");

        } else {

            req.getRequestDispatcher("form-veterinarian.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("veterinarianId");
        System.out.println("Meu ID: " + id);

        String name = req.getParameter("name");
        String crmv = req.getParameter("crmv");
        String cpf = req.getParameter("cpf");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String userType = String.valueOf(UserType.VETERINARIAN);

        try {
            int userId = createUser(email, password, userType);

            if (id == null) {
                if (!createVeterinarian(name, crmv, cpf, address, email, phone, String.valueOf(userId))) {
                    resp.sendRedirect("/erro");
                }
            } else {
                try {
                    updateVeterinarian(address, phone, id);
                } catch (Exception e) {
                    System.out.println("Error updating veterinarian: " + e.getMessage());
                    resp.sendRedirect("/erro");
                }
            }

            resp.sendRedirect("/list-veterinarians");
        } catch (Exception e) {
            System.out.println("Error processing veterinarian: " + e.getMessage());

        }
    }

    private int createUser(String email, String password, String userType) throws SQLException {
        return new UserDao().createUser(new User(email, password, userType));
    }
    private boolean createVeterinarian(String name, String crmv, String cpf, String address, String email, String phone, String userIdConvert) {
        boolean createVeterinarian = new VeterinarianDao().createVeterinarian(
                new Veterinarian(name, crmv, cpf, address, email, phone, userIdConvert));

        return createVeterinarian;
    }
    private void updateVeterinarian(String address, String phone, String id){
        System.out.println("UPDATE VETERINARIAN");
        new VeterinarianDao().updateVeterinarian(new Veterinarian(address, phone, id));
    }
}