package br.com.clinic.servlet;

import br.com.clinic.dao.AttendantDao;
import br.com.clinic.dao.UserDao;
import br.com.clinic.dao.VeterinarianDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete-attendant")
public class DeleteAttendantServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id =  req.getParameter("attendantId");
        String userId = req.getParameter("userId");

        System.out.println("attendant Id: " + id);
        System.out.println("userID: " + userId);

        new AttendantDao().deleteAttendantById(id);
        new UserDao().deleteUserById(userId);

        resp.sendRedirect("list-attendants.jsp");
    }
}
