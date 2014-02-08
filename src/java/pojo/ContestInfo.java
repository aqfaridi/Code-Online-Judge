/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pojo;
import java.io.Serializable;
import java.sql.Timestamp;
/**
 *
 * @author kg
 */
public class ContestInfo implements Serializable{
    
    String contestCode;
    String contestName;
    Timestamp startTime,endTime;
    String poster;
    String nop;
    String description;
    
    public ContestInfo(){
   
    }

    public ContestInfo(String contestCode, String contestName, Timestamp startTime, Timestamp endTime, String poster, String nop, String description) {
        this.contestCode = contestCode;
        this.contestName = contestName;
        this.startTime = startTime;
        this.endTime = endTime;
        this.poster = poster;
        this.nop = nop;
        this.description = description;
    }

    public String getContestCode() {
        return contestCode;
    }

    public String getContestName() {
        return contestName;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public String getPoster() {
        return poster;
    }

    public String getNop() {
        return nop;
    }

    public String getDescription() {
        return description;
    }

    public void setContestCode(String contestCode) {
        this.contestCode = contestCode;
    }

    public void setContestName(String contestName) {
        this.contestName = contestName;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public void setNop(String nop) {
        this.nop = nop;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "ContestInfo{" + "contestCode=" + contestCode + ", contestName=" + contestName + ", startTime=" + startTime + ", endTime=" + endTime + ", poster=" + poster + ", nop=" + nop + ", description=" + description + '}';
    }

   
}
