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

        int generatedId = -1; // Inicialize o ID do usuário como -1 (indicando erro)

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            PreparedStatement preparedStatement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getUserType());

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected == 1) {
                ResultSet resultSet = preparedStatement.getGeneratedKeys();
                if (resultSet.next()) {
                    generatedId = resultSet.getInt(1); //Obtém o ID gerado
                }
            }

            connection.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return generatedId; //Retorna o ID do usuário criado
    }
}
