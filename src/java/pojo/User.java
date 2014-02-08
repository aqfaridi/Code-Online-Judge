/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pojo;

import java.io.Serializable;

/**
 *
 * @author kg
 */
public class User implements Serializable{
    String username;
    String password;
    String fullname;
    String emailid;
    boolean valid;
    String institute;
    String phoneno;
    String address;
    String city;
    String country;
    String website;
    String aboutme;
    String dateofbirth;
    String ipaddress;
    String dpimage;
    String authcode;
    double rating;
    double contribution;
    String dlang;

      public User() {
    }

    public User(String username, String password, String fullname, String emailid, boolean valid, String institute, String phoneno, String address, String city, String country, String website, String aboutme, String dateofbirth, String ipaddress, String dpimage, String authcode, double rating, double contribution, String dlang) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.emailid = emailid;
        this.valid = valid;
        this.institute = institute;
        this.phoneno = phoneno;
        this.address = address;
        this.city = city;
        this.country = country;
        this.website = website;
        this.aboutme = aboutme;
        this.dateofbirth = dateofbirth;
        this.ipaddress = ipaddress;
        this.dpimage = dpimage;
        this.authcode = authcode;
        this.rating = rating;
        this.contribution = contribution;
        this.dlang = dlang;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getFullname() {
        return fullname;
    }

    public String getEmailid() {
        return emailid;
    }

    public boolean isValid() {
        return valid;
    }

    public String getInstitute() {
        return institute;
    }

    public String getPhoneno() {
        return phoneno;
    }

    public String getAddress() {
        return address;
    }

    public String getCity() {
        return city;
    }

    public String getCountry() {
        return country;
    }

    public String getWebsite() {
        return website;
    }

    public String getAboutme() {
        return aboutme;
    }

    public String getDateofbirth() {
        return dateofbirth;
    }

    public String getIpaddress() {
        return ipaddress;
    }

    public String getDpimage() {
        return dpimage;
    }

    public String getAuthcode() {
        return authcode;
    }

    public double getRating() {
        return rating;
    }

    public double getContribution() {
        return contribution;
    }

    public String getDlang() {
        return dlang;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

    public void setInstitute(String institute) {
        this.institute = institute;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public void setAboutme(String aboutme) {
        this.aboutme = aboutme;
    }

    public void setDateofbirth(String dateofbirth) {
        this.dateofbirth = dateofbirth;
    }

    public void setIpaddress(String ipaddress) {
        this.ipaddress = ipaddress;
    }

    public void setDpimage(String dpimage) {
        this.dpimage = dpimage;
    }

    public void setAuthcode(String authcode) {
        this.authcode = authcode;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public void setContribution(double contribution) {
        this.contribution = contribution;
    }

    public void setDlang(String dlang) {
        this.dlang = dlang;
    }

    @Override
    public String toString() {
        return "User{" + "username=" + username + ", password=" + password + ", fullname=" + fullname + ", emailid=" + emailid + ", valid=" + valid + ", institute=" + institute + ", phoneno=" + phoneno + ", address=" + address + ", city=" + city + ", country=" + country + ", website=" + website + ", aboutme=" + aboutme + ", dateofbirth=" + dateofbirth + ", ipaddress=" + ipaddress + ", dpimage=" + dpimage + ", authcode=" + authcode + ", rating=" + rating + ", contribution=" + contribution + ", dlang=" + dlang + '}';
    }

    
}
