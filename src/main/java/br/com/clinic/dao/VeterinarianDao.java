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
    public void deleteVeterinarianById(String veterinarianId){

        String sql = "DELETE VETERINARIAN WHERE ID = ?";

        try {
            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, veterinarianId);

            preparedStatement.execute();

            DatabaseDao.disconnect(connection);

            System.out.println("Deleted successfully");

        }catch (SQLException e){

            System.out.println("ERROR WHEN TRYING TO DELETE!");
            System.out.println(e.getMessage());
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
}