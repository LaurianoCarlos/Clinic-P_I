package br.com.clinic.dao;

import br.com.clinic.model.Animal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class AnimalDao {

    public void createAnimal(Animal animal){

        String sql = "INSERT INTO ANIMAL (NAME,SPECIE,SIZE,CLIENT_ID) VALUES (?,?,?,?)";

        try {
            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, animal.getName());
            preparedStatement.setString(2, animal.getSpecie());
            preparedStatement.setString(3, animal.getSize());
            preparedStatement.setString(4, animal.getIdClient());

            preparedStatement.execute();

            DatabaseDao.disconnect(connection);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Animal> findAllAnimals(String clientId) {

        String SQL = "SELECT ID, NAME, SPECIE, SIZE FROM ANIMAL WHERE CLIENT_ID = ?";

        try (Connection connection = DatabaseDao.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SQL)) {

            preparedStatement.setString(1, clientId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                List<Animal> animals = new ArrayList<>();

                while (resultSet.next()) {
                    String id = resultSet.getString("ID");
                    String name = resultSet.getString("NAME");
                    String specie = resultSet.getString("SPECIE");
                    String size = resultSet.getString("SIZE");

                    Animal animal = new Animal(id, name, specie, size, clientId);
                    animals.add(animal);
                }

                return animals;
            }
        } catch (Exception e) {
            System.out.println("ERRO LIST ANIMALS!");
            e.printStackTrace();

            // RETORNA UMA LISTA VAZIA
            return Collections.emptyList();
        }
    }
    public void deleteAnimalById(String animalId) {
        try {
            Connection connection = DatabaseDao.getConnection();

            String deleteReport = "DELETE FROM Report WHERE idConsultation IN (SELECT id FROM Consultation WHERE id_Animal = ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteReport)) {
                preparedStatement.setString(1, animalId);
                preparedStatement.execute();
            }


            String deleteAnimal = "DELETE FROM Animal WHERE id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(deleteAnimal)) {
                preparedStatement.setString(1, animalId);
                preparedStatement.execute();
            }

            DatabaseDao.disconnect(connection);

            System.out.println("Deleted successfully");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("ERROR WHEN TRYING TO DELETE!");
        }
    }

    public void deleteAnimalsByClientId(String clientId) {
        String sql = "DELETE FROM ANIMAL WHERE CLIENT_ID = ?";

        try {
            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, clientId);

            preparedStatement.executeUpdate();

            DatabaseDao.disconnect(connection);


            System.out.println("Animals deleted successfully");

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("ERROR WHEN TRYING TO DELETE ANIMALS!");
        }
    }

}
