package br.com.clinic.model;

public class Attendant {
    private String id;
    private String name;
    private String cpf;
    private String email;
    private String address;
    private String phone;
    private String userId;

    public Attendant(String address, String phone, String id) {
        this.address = address;
        this.phone = phone;
        this.id = id;
    }


    public Attendant(String name, String cpf, String email, String address, String phone, String userId) {
        this.name = name;
        this.cpf = cpf;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.userId = userId;
    }

    public Attendant(String id, String name, String cpf, String email, String address, String phone, String userId) {
        this.id = id;
        this.name = name;
        this.cpf = cpf;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.userId = userId;
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

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
