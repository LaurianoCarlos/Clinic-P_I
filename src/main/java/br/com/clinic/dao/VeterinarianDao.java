package br.com.clinic.dao;

import br.com.clinic.model.Client;
import br.com.clinic.model.Veterinarian;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class VeterinarianDao {
    public boolean createVeterinarian(Veterinarian veterinarian){

        String sql = "INSERT INTO VETERINARIAN (NAME,CRMV,CPF,ADDRESS,EMAIL,PHONE,USER_ID) VALUES (?,?,?,?,?,?,?)";

        try {
            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, veterinarian.getName());
            preparedStatement.setString(2, veterinarian.getCrmv());
            preparedStatement.setString(3, veterinarian.getCpf());
            preparedStatement.setString(4, veterinarian.getAddress());
            preparedStatement.setString(5, veterinarian.getEmail());
            preparedStatement.setString(6, veterinarian.getPhone());
            preparedStatement.setString(7, veterinarian.getUserId());

            preparedStatement.execute();

            DatabaseDao.disconnect(connection);

            return true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("ERRO CREATE VETERINARIAN");

            return false;
        }
    }
    public List<Veterinarian> findAllVeterinarian() {

        String SQL = "SELECT * FROM VETERINARIAN";

        try {

            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Veterinarian> veterinarians = new ArrayList<>();

            while (resultSet.next()) {

                String id = resultSet.getString("ID");
                String name = resultSet.getString("NAME");
                String crmv = resultSet.getString("CRMV");
                String cpf = resultSet.getString("CPF");
                String address = resultSet.getString("ADDRESS");
                String email = resultSet.getString("EMAIL");
                String phone = resultSet.getString("PHONE");
                String userId = resultSet.getString("USER_ID");

                Veterinarian veterinarian = new Veterinarian(id,name,crmv,cpf,address,email,phone,userId);

                veterinarians.add(veterinarian);

            }

            DatabaseDao.disconnect(connection);
            System.out.println("LIST OF VETERINARIANS CREATED SUCCESSFULLY");

            return veterinarians;

        } catch (Exception e) {
            System.out.println("ERROR WHEN TRYING TO LIST VETERINARIANS");
            System.out.println(e.getMessage());

            //RETURN AN EMPTY LIST
            return Collections.emptyList();
        }

    }
    public void deleteVeterinarianById(String veterinarianId) {
        try {
            Connection connection = DatabaseDao.getConnection();

            String deleteReport = "DELETE FROM Report WHERE idConsultation IN (SELECT id FROM Consultation WHERE id_Veterinarian = ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteReport)) {
                preparedStatement.setString(1, veterinarianId);
                preparedStatement.execute();
            }

            String deleteConsultation = "DELETE FROM Consultation WHERE id_Veterinarian = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteConsultation)) {
                preparedStatement.setString(1, veterinarianId);
                preparedStatement.execute();
            }

            String deleteVeterinarian = "DELETE FROM Veterinarian WHERE id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteVeterinarian)) {
                preparedStatement.setString(1, veterinarianId);
                preparedStatement.execute();
            }
            
            String deleteUsers = "DELETE FROM Users WHERE id = (SELECT user_Id FROM Veterinarian WHERE id = ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteUsers)) {
                preparedStatement.setString(1, veterinarianId);
                preparedStatement.execute();
            }

            DatabaseDao.disconnect(connection);

            System.out.println("Deleted successfully");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("ERROR WHEN TRYING TO DELETE!");
        }
    }

    public void updateVeterinarian(Veterinarian veterinarian){
        String sql = " UPDATE VETERINARIAN SET ADDRESS = ?, PHONE = ? WHERE ID = ?";

        try {
            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, veterinarian.getAddress());
            preparedStatement.setString(2, veterinarian.getPhone());
            preparedStatement.setString(3, veterinarian.getId());

            preparedStatement.execute();

            DatabaseDao.disconnect(connection);

            System.out.println("UPDATE VETERINARIAN");

        } catch (Exception e) {
            System.out.println("ERRO UPDATE VETERINARIAN");
            System.out.println(e.getMessage());
        }
    }
    public Veterinarian getVeterinarianByUserID(String veterinarianuUserId){

        String sql = "SELECT * FROM VETERINARIAN WHERE USER_ID = ?";

        try {
            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, veterinarianuUserId);

            ResultSet resultSet = preparedStatement.executeQuery();

            Veterinarian veterinarian = null;

            while (resultSet.next()) {
                String id = resultSet.getString("ID");
                String name = resultSet.getString("NAME");
                String crmv = resultSet.getString("CRMV");
                String cpf = resultSet.getString("CPF");
                String address = resultSet.getString("ADDRESS");
                String email = resultSet.getString("EMAIL");
                String phone = resultSet.getString("PHONE");
                String userId = resultSet.getString("USER_ID");

                veterinarian = new Veterinarian(id, name, crmv, cpf, address, email, phone, userId);
            }
            DatabaseDao.disconnect(connection);
            System.out.println("CREATE successfully");

            return veterinarian;

        }catch (SQLException e){

            System.out.println("ERROR");
            System.out.println(e.getMessage());
        }
        return null;
    }
}