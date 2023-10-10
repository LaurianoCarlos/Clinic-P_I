package br.com.clinic.dao;

import br.com.clinic.model.User;

import java.sql.Connection;
import java.sql.DriverManager;
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

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return generatedId;     //Returns the ID of the created user
    }
}
