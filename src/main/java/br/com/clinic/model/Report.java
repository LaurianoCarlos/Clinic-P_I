package br.com.clinic.model;

import java.sql.Timestamp;

public class Report {
    private String diagnosis;
    private String idConsultation;
    private String idAnimal;
    private String id;
    private Timestamp dateConsultation;
    private String veterinarianName;
    private String animalName;


    public Report(String diagnosis, String idConsultation, String idAnimal) {
        this.diagnosis = diagnosis;
        this.idConsultation = idConsultation;
        this.idAnimal = idAnimal;
    }

    public Report (String id, Timestamp dateConsultation, String veterinarianName, String animalName, String diagnosis) {
        this.id = id;
        this.dateConsultation = dateConsultation;
        this.veterinarianName = veterinarianName;
        this.animalName = animalName;
        this.diagnosis = diagnosis;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getIdConsultation() {
        return idConsultation;
    }

    public void setIdConsultation(String idConsultation) {
        this.idConsultation = idConsultation;
    }

    public String getIdAnimal() {
        return idAnimal;
    }

    public void setIdAnimal(String idAnimal) {
        this.idAnimal = idAnimal;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Timestamp getDateConsultation() {
        return dateConsultation;
    }

    public void setDateConsultation(Timestamp dateConsultation) {
        this.dateConsultation = dateConsultation;
    }

    public String getVeterinarianName() {
        return veterinarianName;
    }

    public void setVeterinarianName(String veterinarianName) {
        this.veterinarianName = veterinarianName;
    }

    public String getAnimalName() {
        return animalName;
    }

    public void setAnimalName(String animalName) {
        this.animalName = animalName;
    }
}
