package br.com.clinic.dao;

import br.com.clinic.enums.StatusConsultation;
import br.com.clinic.model.Consultation;

import java.sql.*;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;

public class ConsultationDao {

    public boolean createConsultation(Consultation consultation, String status){

        String sql = "INSERT INTO CONSULTATION (DATE, ID_ANIMAL, ID_CLIENT, ID_VETERINARIAN, STATUS) VALUES (?, ?, ?, ?, ?)";
        try {
            Connection connection = DatabaseDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            Timestamp sqlDate = new Timestamp(consultation.getDate().getTime());

            preparedStatement.setTimestamp(1, sqlDate);
            preparedStatement.setString(2, consultation.getIdAnimal());
            preparedStatement.setString(3, consultation.getIdClient());
            preparedStatement.setString(4, consultation.getIdVeterinarian());
            preparedStatement.setString(5, status);

            preparedStatement.execute();

            DatabaseDao.disconnect(connection);
            System.out.println("SUCCESS IN CREATING CONSULTATION");

            return true;

        } catch (SQLException e) {
            System.out.println("ERRO CREATE CONSULTATION" +  e.getMessage());

            return false;
        }
    }
    public List<Consultation> getConsultationsForDay(String day) {
        List<Consultation> consultations = new ArrayList<>();

        String sql = "SELECT C.id, C.date, C.id_Animal, C.id_Client, C.id_Veterinarian, C.status, CL.name AS client_name, AN.name AS animal_name, V.name AS veterinarian_name " +
                "FROM Consultation C " +
                "INNER JOIN Client CL ON C.id_Client = CL.id " +
                "INNER JOIN Animal AN ON C.id_Animal = AN.id " +
                "INNER JOIN Veterinarian V ON C.id_Veterinarian = V.id " +
                "WHERE date >= ? AND date < ? AND C.status = 'AGENDADA'";

        try {
            Connection connection = DatabaseDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date date = dateFormat.parse(day);
            Date sqlDate = new Date(date.getTime());

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(sqlDate);

            Date startOfDay = new Date(calendar.getTimeInMillis());
            calendar.add(Calendar.DAY_OF_MONTH, 1);
            Date endOfDay = new Date(calendar.getTimeInMillis());

            preparedStatement.setTimestamp(1, new Timestamp(startOfDay.getTime()));
            preparedStatement.setTimestamp(2, new Timestamp(endOfDay.getTime()));

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String id = resultSet.getString("ID");
                Timestamp consultationDate = resultSet.getTimestamp("DATE");
                String idAnimal = resultSet.getString("ID_ANIMAL");
                String idClient = resultSet.getString("ID_CLIENT");
                String idVeterinarian = resultSet.getString("ID_VETERINARIAN");
                String status = resultSet.getString("STATUS");
                String clientName = resultSet.getString("CLIENT_NAME");
                String animalName = resultSet.getString("ANIMAL_NAME");
                String veterinarianName = resultSet.getString("VETERINARIAN_NAME");

                Consultation consultation = new Consultation(consultationDate, idAnimal, idClient, idVeterinarian, status);
                consultation.setId(id);
                consultation.setClientName(clientName);
                consultation.setAnimalName(animalName);
                consultation.setVeterinarianName(veterinarianName);

                consultations.add(consultation);
            }

            System.out.println("LIST OF CONSULTATIONS CREATED");

            DatabaseDao.disconnect(connection);
            return consultations;

        } catch (Exception e) {
            System.out.println("ERROR WHEN GETTING CONSULTATIONS OF THE DAY: " + e.getMessage());
            return null;
        }
    }
    public boolean createConsultationsForMonth(int year, int month, String idVeterinarian) {
        Calendar calendar = new GregorianCalendar(year, month - 1, 1, 8, 0, 0);
        Calendar endDate = new GregorianCalendar(year, month - 1, calendar.getActualMaximum(Calendar.DAY_OF_MONTH), 18, 0, 0);

        while (calendar.before(endDate)) {
            if (calendar.get(Calendar.HOUR_OF_DAY) >= 8 && calendar.get(Calendar.HOUR_OF_DAY) < 18) {
                Consultation consultation = new Consultation(calendar.getTime(), null, null, idVeterinarian, String.valueOf(StatusConsultation.ABERTA));

                //createConsultation to create the query in the database
                if (!createConsultation(consultation, String.valueOf(StatusConsultation.ABERTA))) {
                    System.out.println("Error creating query for date: " + calendar.getTime());
                    return false;
                }
            }

            calendar.add(Calendar.HOUR, 1);
        }

        return true;
    }

    public boolean scheduleConsultation(String idConsulta, String idAnimal, String idCliente) {
        String sql = "UPDATE Consultation SET ID_ANIMAL = ?, ID_CLIENT = ?, STATUS = ? WHERE ID = ?";

        try {
            Connection connection = DatabaseDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, idAnimal);
            preparedStatement.setString(2, idCliente);
            preparedStatement.setString(3, String.valueOf(StatusConsultation.AGENDADA));
            preparedStatement.setString(4, idConsulta);

            preparedStatement.executeUpdate();


            System.out.println("CONSULTATION SCHEDULED SUCCESSFULLY");

            DatabaseDao.disconnect(connection);

            return true;

        } catch (Exception e) {
            System.out.println("No queries found with the specified ID " + e.getMessage());
            return false;
        }
    }
    public List<Consultation> getOpenConsultationsByDate(String data) {
        String sql = "SELECT ID, DATE, STATUS FROM CONSULTATION " +
                "WHERE DATE >= ? AND DATE < ? AND STATUS = 'ABERTA'";

        try {

            Connection connection = DatabaseDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            //start of day (00:00:00) end of day (23:59:59) for the query
            //subject to change
            Timestamp startOfDay = Timestamp.valueOf(data + " 00:00:00");
            Timestamp endOfDay = Timestamp.valueOf(data + " 23:59:59");

            preparedStatement.setTimestamp(1, startOfDay);
            preparedStatement.setTimestamp(2, endOfDay);

            List<Consultation> consultationList = new ArrayList<>();

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String id = resultSet.getString("ID");
                Timestamp date = resultSet.getTimestamp("DATE");
                Consultation listConsultDay = new Consultation(id,date);
                consultationList.add(listConsultDay);
            }


            System.out.println("LIST OF CREATED QUERIES");
            DatabaseDao.disconnect(connection);
            return consultationList;

        } catch (Exception e) {
            System.out.println("ERROR WHEN CREATING QUERIES" + e.getMessage());

            return Collections.emptyList();
        }
    }
    public void deleteConsultationById(String clientId){

        String sql = "UPDATE CONSULTATION SET ID_ANIMAL = NULL, ID_CLIENT = NULL , STATUS = 'ABERTA' WHERE ID = ?";

        try {
            Connection connection = DatabaseDao.getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, clientId);

            preparedStatement.execute();

            DatabaseDao.disconnect(connection);

            System.out.println("DELETED CONSULT SUCESSFULLY  successfully");
            DatabaseDao.disconnect(connection);

        }catch (Exception e){

            System.out.println("ERROR WHEN TRYING TO DELETE!" + e.getMessage());
        }
    }
    public List<Consultation> findAllConsultationByAnimalId(String animalId) {
        String SQL = "SELECT * FROM CONSULTATION WHERE ID_ANIMAL = ?";

        try {
            Connection connection = DatabaseDao.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, animalId);

            ResultSet resultSet = preparedStatement.executeQuery();
            List<Consultation> consultations = new ArrayList<>();

            while (resultSet.next()) {
                String id = resultSet.getString("ID");
                Timestamp date = resultSet.getTimestamp("DATE");
                String idClient = resultSet.getString("ID_CLIENT");

                Consultation consultation = new Consultation(id, date, idClient);
                consultations.add(consultation);
            }

            DatabaseDao.disconnect(connection);
            return consultations;
        } catch (Exception e) {

            System.out.println("ERROR WHEN SEARCHING AN ANIMAL" + e.getMessage());
            return Collections.emptyList();
        }
    }
}
