/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;
import java.sql.Timestamp;
import java.io.Serializable;

/**
 *
 * @author Pankaj Chaudhary
 */
public class Comment implements Serializable{
    int id;
    String username;
    String commentProblem;
    String problemcode;
    String contestcode;
    Timestamp submittime;
    int valid;
    
    public Comment()
    {
    }

    public Comment(String username, String commentProblem, String problemcode, String contestcode, Timestamp submittime, int valid) {
       // this.id = id;
        this.username = username;
        this.commentProblem = commentProblem;
        this.problemcode = problemcode;
        this.contestcode = contestcode;
        this.submittime = submittime;
        this.valid = valid;
    }

    public String getCommentProblem() {
        return commentProblem;
    }

    public String getContestcode() {
        return contestcode;
    }

    public int getId() {
        return id;
    }

    public String getProblemcode() {
        return problemcode;
    }

    public Timestamp getSubmittime() {
        return submittime;
    }

    public String getUsername() {
        return username;
    }

    public int getValid() {
        return valid;
    }

    public void setCommentProblem(String commentProblem) {
        this.commentProblem = commentProblem;
    }

    public void setContestcode(String contestcode) {
        this.contestcode = contestcode;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setProblemcode(String problemcode) {
        this.problemcode = problemcode;
    }

    public void setSubmittime(Timestamp submittime) {
        this.submittime = submittime;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setValid(int valid) {
        this.valid = valid;
    }

    @Override
    public String toString() {
        return "Comment{" + "id=" + id + ", username=" + username + ", commentProblem=" + commentProblem + ", problemcode=" + problemcode + ", contestcode=" + contestcode + ", submittime=" + submittime + ", valid=" + valid + '}';
    }

   
   
    
 }
