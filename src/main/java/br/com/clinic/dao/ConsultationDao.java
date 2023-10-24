package br.com.clinic.dao;

import br.com.clinic.model.Consultation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ConsultationDao {

    public boolean createConsultation(Consultation consultation){

        String sql = "INSERT INTO CONSULTATION (DATE, ID_ANIMAL, ID_CLIENT, ID_VETERINARIAN) VALUES (?, ?, ?, ?)";

        try {
            Connection connection = DatabaseDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            Date sqlDate = new Date(consultation.getDate().getTime());

            preparedStatement.setDate(1, sqlDate);
            preparedStatement.setString(2, consultation.getIdAnimal());
            preparedStatement.setString(3, consultation.getIdClient());
            preparedStatement.setString(4, consultation.getIdVeterinarian());

            preparedStatement.execute();

            DatabaseDao.disconnect(connection);
            System.out.println("SUCCESS IN CREATING CONSULTATION");

            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("ERRO CREATE CONSULTATION");

            return false;
        }
    }
}
