package br.com.clinic.dao;

import br.com.clinic.model.Client;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ClientDao {

    public void createClient(Client client){

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

        } catch (SQLException e) {
            throw new RuntimeException(e);
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
            System.out.println("ERRO AO CADASTRAR!");
            e.printStackTrace();

            //RETORNA UMA LISTA VAZIA
            return Collections.emptyList();
        }

    }
}
