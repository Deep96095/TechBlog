
package com.tech.blog.entities;

import java.sql.Timestamp;

public class posts 
{
    private int pid;
    private int cid;
    private String ptitle;
    private String pcontent;
    private String pcode;
    private String ppic;
    private Timestamp date;
    private int userid;

    public posts() {
    }

    public posts(int cid, String ptitle, String pcontent, String pcode, String ppic, int userid) {
        this.cid = cid;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.pcode = pcode;
        this.ppic = ppic;
        this.userid = userid;
    }

    public posts(int pid, int cid, String ptitle, String pcontent, String pcode, String ppic, Timestamp date,int userid) {
        this.pid = pid;
        this.cid = cid;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.pcode = pcode;
        this.ppic = ppic;
        this.date = date;
        this.userid = userid;
    }

    public posts(int cid, String ptitle, String pcontent, String pcode, String ppic, Timestamp date,int userid) {
        this.cid = cid;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.pcode = pcode;
        this.ppic = ppic;
        this.date = date;
        this.userid=userid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public String getPcode() {
        return pcode;
    }

    public void setPcode(String pcode) {
        this.pcode = pcode;
    }

    public String getPpic() {
        return ppic;
    }

    public void setPpic(String ppic) {
        this.ppic = ppic;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
    
}
