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


        if (req.getSession().getAttribute("loggedUser") == null) {

            resp.sendRedirect("login.jsp");

        } else {

            req.getRequestDispatcher("form-attendant.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //data update
        String id = req.getParameter("attendantId");
        System.out.println("Meu IDATTENDANT: " + id);

        //data Veterinarian
        String name = req.getParameter("name");
        String cpf = req.getParameter("cpf");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String userType = String.valueOf(UserType.ATTENDANT);


        try {
            int userId = createUser(email, password, userType);

            if (id == null) {

               if(!createAttendant(name, cpf, email, address, phone, String.valueOf(userId))) {
                   resp.sendRedirect("/erro");
               }

            } else {

                try {
                    updateAttendant(address, phone, id);
                } catch (Exception e) {
                    System.out.println("Error updating attendant: " + e.getMessage());
                    resp.sendRedirect("/erro");
                }
            }

            resp.sendRedirect("/list-attendants");
        } catch (Exception e) {
            System.out.println("Error processing attendant: " + e.getMessage());
        }
    }

    private int createUser(String email, String password, String userType) throws Exception {
        return new UserDao().createUser(new User(email, password, userType));
    }
    private boolean createAttendant(String name, String cpf, String email, String address, String phone, String userIdConvert){
        boolean crateAttendant = new AttendantDao().createAttendant(
                new Attendant(name, cpf, email, address, phone, userIdConvert));

        return crateAttendant;
    }
    private void updateAttendant(String address, String phone, String id){
        System.out.println("UPDATE ATTENDANT");
        new AttendantDao().updateAttedant(new Attendant(address, phone, id));
    }
}