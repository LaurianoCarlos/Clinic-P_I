package br.com.clinic.dao;

import br.com.clinic.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    public int createUser(User user) throws SQLException {
        String sql = "INSERT INTO USERS (EMAIL, PASSWORD, USER_TYPE) VALUES (?, ?, ?)";

        int generatedId = -1; // Initialize the user ID with -1 (indicating error)

        try {
            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getUserType());

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected == 1) {
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                if (resultSet.next()) {
                    generatedId = resultSet.getInt(1); //Gets the generated ID
                }
            }

            DatabaseDao.disconnect(connection);

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return generatedId;     //Returns the ID of the created user
    }
    public void deleteUserById(String userId){

        String sql = "DELETE USERS WHERE ID = ?";

        try {
            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, userId);

            preparedStatement.execute();

            DatabaseDao.disconnect(connection);

            System.out.println("Deleted successfully");
        }catch (SQLException e){
            e.printStackTrace();
            System.out.println("ERROR WHEN TRYING TO DELETE!");
        }
    }

    public User verifyCredentials(User user) {
        String sql = "SELECT * FROM USERS WHERE EMAIL = ?";

        try {
            Connection connection = DatabaseDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getEmail());
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String password = resultSet.getString("PASSWORD");
                String userType = resultSet.getString("USER_TYPE");
                String id = resultSet.getString("ID");

                if (password.equals(user.getPassword())) {
                    User authenticatedUser = new User(id,user.getEmail(),password,userType);
                    System.out.println("id: " + id);
                    System.out.println("usertype: " + userType);
                    DatabaseDao.disconnect(connection);
                    System.out.println("AUTHTENTICATED_USER CREATED LOGIN");
                    return authenticatedUser;
                } else {
                    System.out.println("Senha incorreta");
                }
            } else {
                System.out.println("Usuário não encontrado");
            }

            DatabaseDao.disconnect(connection);
        } catch (Exception e) {
            System.out.println("ERRO LOGIN: " + e.getMessage());
        }

        System.out.println("ERRO LOGIN NULL: ");
        return null; // Retorna null apenas se a autenticação falhar
    }


}
