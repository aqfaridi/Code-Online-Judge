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
 * @author letmestart/joney_000
 */
public class Submissions implements Serializable{
    
   String codefilename;
    String username;
    String langdB;
    String ext;
    String path;
    String status;
    int timelimit;
    String access;
    Timestamp submittime;
    int rid;
    int pid;
    String contestid;
    int memory;
    String problemid;
    
    public Submissions() {
    }

    public Submissions(String codefilename, String username, String langdB, String ext, String path, String status, int timelimit, String access, Timestamp submittime, int rid, int pid, String contestid, int memory, String problemid) {
        this.codefilename = codefilename;
        this.username = username;
        this.langdB = langdB;
        this.ext = ext;
        this.path = path;
        this.status = status;
        this.timelimit = timelimit;
        this.access = access;
        this.submittime = submittime;
        this.rid = rid;
        this.pid = pid;
        this.contestid = contestid;
        this.memory = memory;
        this.problemid = problemid;
    }

    public String getCodefilename() {
        return codefilename;
    }

    public void setCodefilename(String codefilename) {
        this.codefilename = codefilename;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getLangdB() {
        return langdB;
    }

    public void setLangdB(String langdB) {
        this.langdB = langdB;
    }

    public String getExt() {
        return ext;
    }

    public void setExt(String ext) {
        this.ext = ext;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTimelimit() {
        return timelimit;
    }

    public void setTimelimit(int timelimit) {
        this.timelimit = timelimit;
    }

    public String getAccess() {
        return access;
    }

    public void setAccess(String access) {
        this.access = access;
    }

    public Timestamp getSubmittime() {
        return submittime;
    }

    public void setSubmittime(Timestamp submittime) {
        this.submittime = submittime;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getContestid() {
        return contestid;
    }

    public void setContestid(String contestid) {
        this.contestid = contestid;
    }

    public int getMemory() {
        return memory;
    }

    public void setMemory(int memory) {
        this.memory = memory;
    }

    public String getProblemid() {
        return problemid;
    }

    public void setProblemid(String problemid) {
        this.problemid = problemid;
    }

    @Override
    public String toString() {
        return "Q{" + "codefilename=" + codefilename + ", username=" + username + ", langdB=" + langdB + ", ext=" + ext + ", path=" + path + ", status=" + status + ", timelimit=" + timelimit + ", access=" + access + ", submittime=" + submittime + ", rid=" + rid + ", pid=" + pid + ", contestid=" + contestid + ", memory=" + memory + ", problemid=" + problemid + '}';
    }
    
}
