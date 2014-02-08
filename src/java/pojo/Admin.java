/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.io.Serializable;

/**
 *
 * @author Pankaj Chaudhary
 */
public class Admin implements Serializable{
    String username;
    String password;
    String emailid;
    String phoneno;
    int level;
public Admin() {
    }
    public Admin(String username, String password, String emailid, String phoneno, int level) {
        this.username = username;
        this.password = password;
        this.emailid = emailid;
        this.phoneno = phoneno;
        this.level = level;
    }

    public String getEmailid() {
        return emailid;
    }

    public int getLevel() {
        return level;
    }

    public String getPassword() {
        return password;
    }

    public String getPhoneno() {
        return phoneno;
    }

    public String getUsername() {
        return username;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Admin{" + "username=" + username + ", password=" + password + ", emailid=" + emailid + ", phoneno=" + phoneno + ", level=" + level + '}';
    }
    
}
