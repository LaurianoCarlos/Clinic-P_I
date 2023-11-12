package br.com.clinic.dao;

import br.com.clinic.model.Consultation;
import br.com.clinic.model.Report;
import br.com.clinic.model.User;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

public class ReportDao {

    public boolean createReport(Report report){

        String sql = "INSERT INTO REPORT (DIAGNOSIS , IDCONSULTATION,IDANIMAL) VALUES (?, ?, ?)";

        try {
            Connection connection = DatabaseDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);


            preparedStatement.setString(1, report.getDiagnosis());
            preparedStatement.setString(2, report.getIdConsultation());
            preparedStatement.setString(3, report.getIdAnimal());


            preparedStatement.execute();

            DatabaseDao.disconnect(connection);
            System.out.println("SUCCESS IN CREATING REPORT");

            return true;

        } catch (SQLException e) {
            System.out.println("ERRO CREATE REPORT" +  e.getMessage());

            return false;
        }
    }
    public List<Report> getReportsById(String idAnimal) {
        List<Report> reports = new ArrayList<>();

        String sql = "SELECT R.id, C.date AS consultation_date, V.name AS veterinarian_name, A.name AS animal_name, R.diagnosis" +
                " FROM Report R" +
                " JOIN Consultation C ON R.idConsultation = C.id" +
                " JOIN Veterinarian V ON C.id_Veterinarian = V.id" +
                " JOIN Animal A ON R.idAnimal = A.id" +
                " WHERE A.id = ?";

        try {
            Connection connection = DatabaseDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, idAnimal);


            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String id = resultSet.getString("ID");
                Timestamp consultationDate = resultSet.getTimestamp("CONSULTATION_DATE");
                String veterinarianName = resultSet.getString("VETERINARIAN_NAME");
                String 	animalName = resultSet.getString("ANIMAL_NAME");
                String diagnosis = resultSet.getString("DIAGNOSIS");

                reports.add(new Report(id,consultationDate,veterinarianName,animalName,diagnosis));

            }

            System.out.println("LIST OF CONSULTATIONS CREATED");

            DatabaseDao.disconnect(connection);

            return reports;

        } catch (Exception e) {
            System.out.println("ERROR WHEN GETTING CONSULTATIONS OF THE DAY: " + e.getMessage());
            //RETURN AN EMPTY LIST
            return Collections.emptyList();
        }
    }
}
