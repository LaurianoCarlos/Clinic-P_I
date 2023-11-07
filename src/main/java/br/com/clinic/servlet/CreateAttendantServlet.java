package br.com.clinic.servlet;

import br.com.clinic.dao.AttendantDao;
import br.com.clinic.dao.UserDao;
import br.com.clinic.enums.UserType;
import br.com.clinic.model.Attendant;
import br.com.clinic.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/create-attendant")
public class CreateAttendantServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("form-attendant.jsp").forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //data update
        String id = req.getParameter("attendantId");
        System.out.println("Meu ID: " + id);

        //data Veterinarian
        String name = req.getParameter("name");
        String cpf = req.getParameter("cpf");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");


        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String userType = String.valueOf(UserType.ATTENDANT);

        User user = new User(email, password, userType);
        int userId = 0;

        if (id == null) {

            try {
                userId = new UserDao().createUser(user);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

            String userIdConvert = String.valueOf(userId);

            Attendant attendant = new Attendant(name,cpf,email,address,phone,userIdConvert);
            boolean created = new AttendantDao().createAttendant(attendant);

            if (!(created)) {
                new UserDao().deleteUserById(userIdConvert);
            }

            resp.sendRedirect("/");
        } else {

            System.out.println("UPDATE ATTENDANT");
            new AttendantDao().updateAttedant(new Attendant(address, phone, id));
            resp.sendRedirect("/");

        }
    }
}
