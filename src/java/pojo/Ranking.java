/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pojo;

import java.io.Serializable;

/**
 *
 * @author letmestart
 */
public class Ranking implements Serializable {
    
    String userid;
    String contestid;
    
    double Ascore;
    long Atime;
    int Apanalty;
    
    double Bscore;
    long Btime;
    int Bpanalty;
    
    double Cscore;
    long Ctime;
    int Cpanalty;
    
    double Dscore;
    long Dtime;
    int Dpanalty;
    
    double Escore;
    long Etime;
    int Epanalty;
    
    double Fscore;
    long Ftime;
    int Fpanalty;
   
    double Gscore;
    long Gtime;
    int Gpanalty;
    
    double Hscore;
    long Htime;
    int Hpanalty;
    
    double Iscore;
    long Itime;
    int Ipanalty;
    
    double Jscore;
    long Jtime;
    int Jpanalty;
    
    double score;
    long time;
    int panalty;

    public Ranking() {
        
        this.userid = "nouser";
        this.contestid = "nocontest";
        this.Ascore = 0;
        this.Atime = 0;
        this.Apanalty = 0;
        this.Bscore = 0;
        this.Btime = 0;
        this.Bpanalty = 0;
        this.Cscore = 0;
        this.Ctime = 0;
        this.Cpanalty = 0;
        this.Dscore = 0;
        this.Dtime = 0;
        this.Dpanalty = 0;
        this.Escore = 0;
        this.Etime = 0;
        this.Epanalty = 0;
        this.Fscore = 0;
        this.Ftime = 0;
        this.Fpanalty = 0;
        this.Gscore = 0;
        this.Gtime = 0;
        this.Gpanalty = 0;
        this.Hscore = 0;
        this.Htime = 0;
        this.Hpanalty = 0;
        this.Iscore = 0;
        this.Itime = 0;
        this.Ipanalty = 0;
        this.Jscore = 0;
        this.Jtime = 0;
        this.Jpanalty = 0;
        this.score = 0;
        this.time = 0;
        this.panalty = 0;
    }

    public Ranking(String userid, String contestid, double Ascore, long Atime, int Apanalty, double Bscore, long Btime, int Bpanalty, double Cscore, long Ctime, int Cpanalty, double Dscore, long Dtime, int Dpanalty, double Escore, long Etime, int Epanalty, double Fscore, long Ftime, int Fpanalty, double Gscore, long Gtime, int Gpanalty, double Hscore, long Htime, int Hpanalty, double Iscore, long Itime, int Ipanalty, double Jscore, long Jtime, int Jpanalty, double score, long time, int panalty) {
        this.userid = userid;
        this.contestid = contestid;
        this.Ascore = Ascore;
        this.Atime = Atime;
        this.Apanalty = Apanalty;
        this.Bscore = Bscore;
        this.Btime = Btime;
        this.Bpanalty = Bpanalty;
        this.Cscore = Cscore;
        this.Ctime = Ctime;
        this.Cpanalty = Cpanalty;
        this.Dscore = Dscore;
        this.Dtime = Dtime;
        this.Dpanalty = Dpanalty;
        this.Escore = Escore;
        this.Etime = Etime;
        this.Epanalty = Epanalty;
        this.Fscore = Fscore;
        this.Ftime = Ftime;
        this.Fpanalty = Fpanalty;
        this.Gscore = Gscore;
        this.Gtime = Gtime;
        this.Gpanalty = Gpanalty;
        this.Hscore = Hscore;
        this.Htime = Htime;
        this.Hpanalty = Hpanalty;
        this.Iscore = Iscore;
        this.Itime = Itime;
        this.Ipanalty = Ipanalty;
        this.Jscore = Jscore;
        this.Jtime = Jtime;
        this.Jpanalty = Jpanalty;
        this.score = score;
        this.time = time;
        this.panalty = panalty;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getContestid() {
        return contestid;
    }

    public void setContestid(String contestid) {
        this.contestid = contestid;
    }

    public double getAscore() {
        return Ascore;
    }

    public void setAscore(double Ascore) {
        this.Ascore = Ascore;
    }

    public long getAtime() {
        return Atime;
    }

    public void setAtime(long Atime) {
        this.Atime = Atime;
    }

    public int getApanalty() {
        return Apanalty;
    }

    public void setApanalty(int Apanalty) {
        this.Apanalty = Apanalty;
    }

    public double getBscore() {
        return Bscore;
    }

    public void setBscore(double Bscore) {
        this.Bscore = Bscore;
    }

    public long getBtime() {
        return Btime;
    }

    public void setBtime(long Btime) {
        this.Btime = Btime;
    }

    public int getBpanalty() {
        return Bpanalty;
    }

    public void setBpanalty(int Bpanalty) {
        this.Bpanalty = Bpanalty;
    }

    public double getCscore() {
        return Cscore;
    }

    public void setCscore(double Cscore) {
        this.Cscore = Cscore;
    }

    public long getCtime() {
        return Ctime;
    }

    public void setCtime(long Ctime) {
        this.Ctime = Ctime;
    }

    public int getCpanalty() {
        return Cpanalty;
    }

    public void setCpanalty(int Cpanalty) {
        this.Cpanalty = Cpanalty;
    }

    public double getDscore() {
        return Dscore;
    }

    public void setDscore(double Dscore) {
        this.Dscore = Dscore;
    }

    public long getDtime() {
        return Dtime;
    }

    public void setDtime(long Dtime) {
        this.Dtime = Dtime;
    }

    public int getDpanalty() {
        return Dpanalty;
    }

    public void setDpanalty(int Dpanalty) {
        this.Dpanalty = Dpanalty;
    }

    public double getEscore() {
        return Escore;
    }

    public void setEscore(double Escore) {
        this.Escore = Escore;
    }

    public long getEtime() {
        return Etime;
    }

    public void setEtime(long Etime) {
        this.Etime = Etime;
    }

    public int getEpanalty() {
        return Epanalty;
    }

    public void setEpanalty(int Epanalty) {
        this.Epanalty = Epanalty;
    }

    public double getFscore() {
        return Fscore;
    }

    public void setFscore(double Fscore) {
        this.Fscore = Fscore;
    }

    public long getFtime() {
        return Ftime;
    }

    public void setFtime(long Ftime) {
        this.Ftime = Ftime;
    }

    public int getFpanalty() {
        return Fpanalty;
    }

    public void setFpanalty(int Fpanalty) {
        this.Fpanalty = Fpanalty;
    }

    public double getGscore() {
        return Gscore;
    }

    public void setGscore(double Gscore) {
        this.Gscore = Gscore;
    }

    public long getGtime() {
        return Gtime;
    }

    public void setGtime(long Gtime) {
        this.Gtime = Gtime;
    }

    public int getGpanalty() {
        return Gpanalty;
    }

    public void setGpanalty(int Gpanalty) {
        this.Gpanalty = Gpanalty;
    }

    public double getHscore() {
        return Hscore;
    }

    public void setHscore(double Hscore) {
        this.Hscore = Hscore;
    }

    public long getHtime() {
        return Htime;
    }

    public void setHtime(long Htime) {
        this.Htime = Htime;
    }

    public int getHpanalty() {
        return Hpanalty;
    }

    public void setHpanalty(int Hpanalty) {
        this.Hpanalty = Hpanalty;
    }

    public double getIscore() {
        return Iscore;
    }

    public void setIscore(double Iscore) {
        this.Iscore = Iscore;
    }

    public long getItime() {
        return Itime;
    }

    public void setItime(long Itime) {
        this.Itime = Itime;
    }

    public int getIpanalty() {
        return Ipanalty;
    }

    public void setIpanalty(int Ipanalty) {
        this.Ipanalty = Ipanalty;
    }

    public double getJscore() {
        return Jscore;
    }

    public void setJscore(double Jscore) {
        this.Jscore = Jscore;
    }

    public long getJtime() {
        return Jtime;
    }

    public void setJtime(long Jtime) {
        this.Jtime = Jtime;
    }

    public int getJpanalty() {
        return Jpanalty;
    }

    public void setJpanalty(int Jpanalty) {
        this.Jpanalty = Jpanalty;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }

    public int getPanalty() {
        return panalty;
    }

    public void setPanalty(int panalty) {
        this.panalty = panalty;
    }

    @Override
    public String toString() {
        return "ranking{" + "userid=" + userid + ", contestid=" + contestid + ", Ascore=" + Ascore + ", Atime=" + Atime + ", Apanalty=" + Apanalty + ", Bscore=" + Bscore + ", Btime=" + Btime + ", Bpanalty=" + Bpanalty + ", Cscore=" + Cscore + ", Ctime=" + Ctime + ", Cpanalty=" + Cpanalty + ", Dscore=" + Dscore + ", Dtime=" + Dtime + ", Dpanalty=" + Dpanalty + ", Escore=" + Escore + ", Etime=" + Etime + ", Epanalty=" + Epanalty + ", Fscore=" + Fscore + ", Ftime=" + Ftime + ", Fpanalty=" + Fpanalty + ", Gscore=" + Gscore + ", Gtime=" + Gtime + ", Gpanalty=" + Gpanalty + ", Hscore=" + Hscore + ", Htime=" + Htime + ", Hpanalty=" + Hpanalty + ", Iscore=" + Iscore + ", Itime=" + Itime + ", Ipanalty=" + Ipanalty + ", Jscore=" + Jscore + ", Jtime=" + Jtime + ", Jpanalty=" + Jpanalty + ", score=" + score + ", time=" + time + ", panalty=" + panalty + '}';
    }
   
    
}
