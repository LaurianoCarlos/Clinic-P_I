package br.com.clinic.dao;

import br.com.clinic.model.Client;
import br.com.clinic.model.Veterinarian;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ClientDao {

    public boolean createClient(Client client){

        String sql = "INSERT INTO CLIENT (NAME,EMAIL,CPF,ADDRESS,PHONE,USER_ID) VALUES (?,?,?,?,?,?)";

        try {
            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, client.getName());
            preparedStatement.setString(2, client.getEmail());
            preparedStatement.setString(3, client.getCpf());
            preparedStatement.setString(4, client.getAddress());
            preparedStatement.setString(5, client.getPhone());
            preparedStatement.setString(6, Integer.toString(client.getUserId()));

            preparedStatement.execute();

            DatabaseDao.disconnect(connection);

            return true;

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return  false;
        }
    }
    public List<Client> findAllClients() {

        String SQL = "SELECT * FROM CLIENT";

        try {

            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Client> clients = new ArrayList<>();

            while (resultSet.next()) {

                String id = resultSet.getString("ID");
                String name = resultSet.getString("NAME");
                String email = resultSet.getString("EMAIL");
                String cpf = resultSet.getString("CPF");
                String address = resultSet.getString("ADDRESS");
                String phone = resultSet.getString("PHONE");
                int userId = resultSet.getInt("USER_ID");

                Client client = new Client(id,name,email,cpf,address,phone,userId);

                clients.add(client);

            }

            DatabaseDao.disconnect(connection);

            return clients;

        } catch (Exception e) {
            System.out.println("ERROR WHEN TRYING TO REGISTER!");
            e.printStackTrace();

            //RETORNA UMA LISTA VAZIA
            return Collections.emptyList();
        }

    }
    public void deleteClientById(String clientId) {
        try {
            Connection connection = DatabaseDao.getConnection();


            String deleteReportAndConsultation = "DELETE FROM Report WHERE idConsultation IN (SELECT id FROM Consultation WHERE id_Client = ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteReportAndConsultation)) {
                preparedStatement.setString(1, clientId);
                preparedStatement.execute();
            }

            String deleteConsultation = "DELETE FROM Consultation WHERE id_Client = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteConsultation)) {
                preparedStatement.setString(1, clientId);
                preparedStatement.execute();
            }

            String deleteAnimal = "DELETE FROM Animal WHERE CLIENT_ID = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteAnimal)) {
                preparedStatement.setString(1, clientId);
                preparedStatement.execute();
            }

            DatabaseDao.disconnect(connection);

            System.out.println("Deleted successfully");
        } catch (Exception e) {

            System.out.println("ERROR WHEN TRYING TO DELETE!" + e.getMessage());
        }
    }

    public void updateClient(Client client){
        String sql = " UPDATE CLIENT SET ADDRESS = ?, PHONE = ? WHERE ID = ?";

        try {
            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, client.getAddress());
            preparedStatement.setString(2, client.getPhone());
            preparedStatement.setString(3, client.getId());

            preparedStatement.execute();

            DatabaseDao.disconnect(connection);

        } catch (Exception e) {
            System.out.println("ERRO UPDATE CLIENT");
            System.out.println(e.getMessage());
        }
    }
    public Client getClientByUserID(String clientUserId){

        String sql = "SELECT * FROM CLIENT WHERE USER_ID = ?";

        try {
            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, clientUserId);

            ResultSet resultSet = preparedStatement.executeQuery();

            Client client = null;

            while (resultSet.next()) {
                String id = resultSet.getString("ID");
                String name = resultSet.getString("NAME");
                String email = resultSet.getString("EMAIL");
                String cpf = resultSet.getString("CPF");
                String address = resultSet.getString("ADDRESS");
                String phone = resultSet.getString("PHONE");
                int userId = resultSet.getInt("USER_ID");

                client = new Client(id, name, email, cpf, address, phone, userId);
            }
            DatabaseDao.disconnect(connection);
            System.out.println("CREATE successfully");

            return client;

        }catch (SQLException e){

            System.out.println("ERROR");
            System.out.println(e.getMessage());
        }
        return null;
    }
}
