package br.com.clinic.model;

public class Veterinarian {

    private String id;
    private String name;
    private String crmv;
    private String cpf;
    private String address;
    private String email;
    private String phone;
    private String userId;

    public Veterinarian(String address, String phone, String id) {
        this.address = address;
        this.phone = phone;
        this.id = id;
    }

    public Veterinarian(String name, String crmv, String cpf, String address, String email, String phone, String userId) {
        this.name = name;
        this.crmv = crmv;
        this.cpf = cpf;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.userId = userId;
    }

    public Veterinarian(String id, String name, String crmv, String cpf, String address, String email, String phone, String userId) {
        this.id = id;
        this.name = name;
        this.crmv = crmv;
        this.cpf = cpf;
        this.address = address;
        this.email = email;
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

    public String getCrmv() {
        return crmv;
    }

    public void setCrmv(String crmv) {
        this.crmv = crmv;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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