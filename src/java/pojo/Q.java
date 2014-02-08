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
 * @author letmestart
 */
public class Q implements Serializable{
    
    String codefilename;
    String username;
    String langdB;
    String ext;
    String path;
    String status;
    Double timelimit;
    String access;
    Timestamp submittime;
    int rid;
    int pid;
    String contestid;
    int memory;
    String problemid;
    int testfiles;
    public Q() {
    }

    public Q(String codefilename, String username, String langdB, String ext, String path, String status, Double timelimit, String access, Timestamp submittime, int rid, int pid, String contestid, int memory, String problemid, int testfiles) {
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
        this.testfiles = testfiles;
    }

    public String getAccess() {
        return access;
    }

    public String getCodefilename() {
        return codefilename;
    }

    public String getContestid() {
        return contestid;
    }

    public String getExt() {
        return ext;
    }

    public String getLangdB() {
        return langdB;
    }

    public int getMemory() {
        return memory;
    }

    public String getPath() {
        return path;
    }

    public int getPid() {
        return pid;
    }

    public String getProblemid() {
        return problemid;
    }

    public int getRid() {
        return rid;
    }

    public String getStatus() {
        return status;
    }

    public Timestamp getSubmittime() {
        return submittime;
    }

    public int getTestfiles() {
        return testfiles;
    }

    public Double getTimelimit() {
        return timelimit;
    }

    public String getUsername() {
        return username;
    }

    public void setAccess(String access) {
        this.access = access;
    }

    public void setCodefilename(String codefilename) {
        this.codefilename = codefilename;
    }

    public void setContestid(String contestid) {
        this.contestid = contestid;
    }

    public void setExt(String ext) {
        this.ext = ext;
    }

    public void setLangdB(String langdB) {
        this.langdB = langdB;
    }

    public void setMemory(int memory) {
        this.memory = memory;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public void setProblemid(String problemid) {
        this.problemid = problemid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setSubmittime(Timestamp submittime) {
        this.submittime = submittime;
    }

    public void setTestfiles(int testfiles) {
        this.testfiles = testfiles;
    }

    public void setTimelimit(Double timelimit) {
        this.timelimit = timelimit;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Q{" + "codefilename=" + codefilename + ", username=" + username + ", langdB=" + langdB + ", ext=" + ext + ", path=" + path + ", status=" + status + ", timelimit=" + timelimit + ", access=" + access + ", submittime=" + submittime + ", rid=" + rid + ", pid=" + pid + ", contestid=" + contestid + ", memory=" + memory + ", problemid=" + problemid + ", testfiles=" + testfiles + '}';
    }

    
}
