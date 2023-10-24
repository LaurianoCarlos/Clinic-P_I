package br.com.clinic.model;

import java.util.Date;

public class Consultation {

    private String id;
    private Date Date;
    private String idAnimal;
    private String idClient;
    private String idVeterinarian;

    public Consultation(Date date, String idAnimal, String idClient, String idVeterinarian) {
        this.Date = date;
        this.idAnimal = idAnimal;
        this.idClient = idClient;
        this.idVeterinarian = idVeterinarian;
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
}
