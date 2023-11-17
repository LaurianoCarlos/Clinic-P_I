package br.com.clinic.model;

import java.util.Date;

public class Consultation {
    private String id;
    private Date Date;
    private String idAnimal;
    private String idClient;
    private String idVeterinarian;

    private String clientName;
    private String animalName;
    private String veterinarianName;

    private String status;

    public Consultation(String id, Date date) {
        this.id = id;
        this.Date = date;
    }
    public Consultation(String id, Date date, String idClient) {
        this.id = id;
        this.Date = date;
        this.idClient = idClient;
    }
    public Consultation(String veterinarianName,String id, Date date) {
        this.veterinarianName = veterinarianName;
        this.id = id;
        this.Date = date;

    }

    public Consultation(Date date, String idAnimal, String idClient, String idVeterinarian) {
        this.Date = date;
        this.idAnimal = idAnimal;
        this.idClient = idClient;
        this.idVeterinarian = idVeterinarian;
    }
    public Consultation(Date date, String idAnimal, String idClient, String idVeterinarian, String status) {
        this.Date = date;
        this.idAnimal = idAnimal;
        this.idClient = idClient;
        this.idVeterinarian = idVeterinarian;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getDate() {
        return Date;
    }

    public void setDate(Date date) {
        Date = date;
    }

    public String getIdAnimal() {
        return idAnimal;
    }

    public void setIdAnimal(String idAnimal) {
        this.idAnimal = idAnimal;
    }

    public String getIdClient() {
        return idClient;
    }

    public void setIdClient(String idClient) {
        this.idClient = idClient;
    }

    public String getIdVeterinarian() {
        return idVeterinarian;
    }

    public void setIdVeterinarian(String idVeterinarian) {
        this.idVeterinarian = idVeterinarian;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getAnimalName() {
        return animalName;
    }

    public void setAnimalName(String animalName) {
        this.animalName = animalName;
    }

    public String getVeterinarianName() {
        return veterinarianName;
    }

    public void setVeterinarianName(String veterinarianName) {
        this.veterinarianName = veterinarianName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

