

package pojo;

import java.io.Serializable;

/**
 *
 * @author kg
 */
public class Problems implements Serializable{
    
        String contestcode;
        String problemcode;
        String problemname;
        String timelimit;
        String problemsetter;
        String problemtester;
        int testfiles;
        String problemdescription;
        int success;
        int total;
        float difficulty;
    public Problems() {
        
    }

    public Problems(String contestcode, String problemcode, String problemname, String timelimit, String problemsetter, String problemtester, int testfiles, String problemdescription, int success, int total, float difficulty) {
        this.contestcode = contestcode;
        this.problemcode = problemcode;
        this.problemname = problemname;
        this.timelimit = timelimit;
        this.problemsetter = problemsetter;
        this.problemtester = problemtester;
        this.testfiles = testfiles;
        this.problemdescription = problemdescription;
        this.success = success;
        this.total = total;
        this.difficulty = difficulty;
    }

    public String getContestcode() {
        return contestcode;
    }

    public float getDifficulty() {
        return difficulty;
    }

    public String getProblemcode() {
        return problemcode;
    }

    public String getProblemdescription() {
        return problemdescription;
    }

    public String getProblemname() {
        return problemname;
    }

    public String getProblemsetter() {
        return problemsetter;
    }

    public String getProblemtester() {
        return problemtester;
    }

    public int getSuccess() {
        return success;
    }

    public int getTestfiles() {
        return testfiles;
    }

    public String getTimelimit() {
        return timelimit;
    }

    public int getTotal() {
        return total;
    }

    public void setContestcode(String contestcode) {
        this.contestcode = contestcode;
    }

    public void setDifficulty(float difficulty) {
        this.difficulty = difficulty;
    }

    public void setProblemcode(String problemcode) {
        this.problemcode = problemcode;
    }

    public void setProblemdescription(String problemdescription) {
        this.problemdescription = problemdescription;
    }

    public void setProblemname(String problemname) {
        this.problemname = problemname;
    }

    public void setProblemsetter(String problemsetter) {
        this.problemsetter = problemsetter;
    }

    public void setProblemtester(String problemtester) {
        this.problemtester = problemtester;
    }

    public void setSuccess(int success) {
        this.success = success;
    }

    public void setTestfiles(int testfiles) {
        this.testfiles = testfiles;
    }

    public void setTimelimit(String timelimit) {
        this.timelimit = timelimit;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Problems{" + "contestcode=" + contestcode + ", problemcode=" + problemcode + ", problemname=" + problemname + ", timelimit=" + timelimit + ", problemsetter=" + problemsetter + ", problemtester=" + problemtester + ", testfiles=" + testfiles + ", problemdescription=" + problemdescription + ", success=" + success + ", total=" + total + ", difficulty=" + difficulty + '}';
    }


}
