package br.com.clinic.model;

public class Animal {
    private String id;
    private String name;
    private String specie;
    private String size;
    private String idClient;

    public Animal(String name, String specie, String size, String idClient) {
        this.name = name;
        this.specie = specie;
        this.size = size;
        this.idClient = idClient;
    }
    public Animal(String id, String name, String specie, String size, String idClient) {
        this.id = id;
        this.name = name;
        this.specie = specie;
        this.size = size;
        this.idClient = idClient;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpecie() {
        return specie;
    }

    public void setSpecie(String specie) {
        this.specie = specie;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getIdClient() {
        return idClient;
    }

    public void setIdClient(String idClient) {
        this.idClient = idClient;
    }
}
