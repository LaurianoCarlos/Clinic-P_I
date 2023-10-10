package br.com.clinic.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseDao {
    private static final String URL = "jdbc:h2:~/test";
    private static final String USER = "sa";
    private static final String PASSWORD = "sa";

    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to database", e);
        }
    }

    public static void disconnect(Connection connection) {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error disconnecting from database", e);
        }
    }
}
