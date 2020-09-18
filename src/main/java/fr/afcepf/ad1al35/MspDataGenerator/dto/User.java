package fr.afcepf.ad1al35.MspDataGenerator.dto;

import java.time.LocalDate;
import java.util.List;

public class User {

    private String firstName;
    private String lastName;
    private String username;
    private String password;
    private String email;
    private String country;
    private String birthDate;
    private String telephone;
    private List<Bookmark> bookmarks;

    public User() {
    }

    public User(String firstName, String lastName, String username, String password, String email, String country, String birthDate, String telephone, List<Bookmark> bookmarks) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.password = password;
        this.email = email;
        this.country = country;
        this.birthDate = birthDate;
        this.telephone = telephone;
        this.bookmarks = bookmarks;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public List<Bookmark> getBookmarks() {
        return bookmarks;
    }

    public void setBookmarks(List<Bookmark> bookmarks) {
        this.bookmarks = bookmarks;
    }
}
