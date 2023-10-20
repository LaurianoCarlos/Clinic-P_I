package br.com.clinic.dao;

import br.com.clinic.model.Attendant;
import br.com.clinic.model.Veterinarian;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class AttendantDao {

    public boolean createAttendant(Attendant attendant){

        String sql = "INSERT INTO ATTENDANT (NAME,CPF,EMAIL,ADDRESS,PHONE,USER_ID) VALUES (?,?,?,?,?,?)";

        try {
            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, attendant.getName());
            preparedStatement.setString(2, attendant.getCpf());
            preparedStatement.setString(3, attendant.getEmail());
            preparedStatement.setString(4, attendant.getAddress());
            preparedStatement.setString(5, attendant.getPhone());
            preparedStatement.setString(6, attendant.getUserId());

            preparedStatement.execute();

            DatabaseDao.disconnect(connection);
            System.out.println("SUCCESS IN CREATING ATTENDANT");

            return true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("ERRO CREATE ATTENDANT");

            return false;
        }
    }

    public List<Attendant> findAllAttendants() {

        String SQL = "SELECT * FROM ATTENDANT";

        try {

            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Attendant> attendants = new ArrayList<>();

            while (resultSet.next()) {

                String id = resultSet.getString("ID");
                String name = resultSet.getString("NAME");
                String cpf = resultSet.getString("CPF");
                String email = resultSet.getString("EMAIL");
                String address = resultSet.getString("ADDRESS");
                String phone = resultSet.getString("PHONE");
                String userId = resultSet.getString("USER_ID");

                Attendant attendant = new Attendant(id,name,cpf,email,address,phone,userId);
                attendants.add(attendant);

            }

            DatabaseDao.disconnect(connection);
            System.out.println("LIST OF ATTEDANTS CREATED SUCCESSFULLY");

            return attendants;

        } catch (Exception e) {
            System.out.println("ERROR WHEN TRYING TO LIST ATTEDANTS");
            System.out.println(e.getMessage());

            //RETURN AN EMPTY LIST
            return Collections.emptyList();
        }

    }
    public void deleteAttendantById(String attendantId){

        String sql = "DELETE ATTENDANT WHERE ID = ?";

        try {
            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, attendantId);

            preparedStatement.execute();

            DatabaseDao.disconnect(connection);

            System.out.println("Deleted successfully");

        }catch (SQLException e){

            System.out.println("ERROR WHEN TRYING TO DELETE!");
            System.out.println(e.getMessage());
        }
    }
    public void updateAttedant(Attendant attendant){
        String sql = " UPDATE ATTENDANT SET ADDRESS = ?, PHONE = ? WHERE ID = ?";

        try {
            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, attendant.getAddress());
            preparedStatement.setString(2, attendant.getPhone());
            preparedStatement.setString(3, attendant.getId());

            preparedStatement.execute();

            DatabaseDao.disconnect(connection);

            System.out.println("UPDATE ATTENDANT");

        } catch (Exception e) {
            System.out.println("ERRO UPDATE ATTENDANT");
            System.out.println(e.getMessage());
        }
    }
}
