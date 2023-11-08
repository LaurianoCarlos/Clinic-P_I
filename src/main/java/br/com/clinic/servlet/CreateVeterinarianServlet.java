
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


@WebServlet("/create-veterinarian")
public class CreateVeterinarianServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("form-veterinarian.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {


        //data update
        String id = req.getParameter("veterinarianId");
        System.out.println("Meu ID: " + id);

        //data Veterinarian
        String name = req.getParameter("name");
        String crmv = req.getParameter("crmv");
        String cpf = req.getParameter("cpf");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");


        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String userType = String.valueOf(UserType.VETERINARIAN);

        User user = new User(email, password, userType);
        int userId = 0;

        if (id == null) {

            try {
                userId = new UserDao().createUser(user);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

            String userIdConvert = String.valueOf(userId);

            Veterinarian veterinarian = new Veterinarian(name,crmv,cpf,address,email,phone,userIdConvert);
            boolean created = new VeterinarianDao().createVeterinarian(veterinarian);

            if(!(created)){
                new UserDao().deleteUserById(userIdConvert);
            }

            resp.sendRedirect("/");
        } else {

            System.out.println("UPDATE VETERINARIAN LORO");
            new VeterinarianDao().updateVeterinarian(new Veterinarian(address,phone,id));
            resp.sendRedirect("/");
        }
    }
}