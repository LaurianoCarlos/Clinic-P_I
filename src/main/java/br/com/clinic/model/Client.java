package br.com.clinic.model;

public class Client  {

    private String id;
    private String name;
    private String email;
    private String cpf;
    private String address;
    private String phone;

    private int userId;

    public Client() {

    }

    public Client(String name, String email, String cpf, String address, String phone, int userId) {
        this.name = name;
        this.email = email;
        this.cpf = cpf;
        this.address = address;
        this.phone = phone;
        this.userId = userId;
    }

    public Client(String id, String name, String email, String cpf, String address, String phone, int userId) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.cpf = cpf;
        this.address = address;
        this.phone = phone;
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
