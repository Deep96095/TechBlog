
package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class likedao 
{
    Connection con=null;
    public likedao(Connection con) 
    {
        this.con=con;
    }
    public boolean insertlike(int pid,int uid)
    {
        boolean f=false;
        try
        {
           String q="Insert into liked(pid,uid) values(?,?);";
           PreparedStatement p=con.prepareStatement(q);
           p.setInt(1, pid);
           p.setInt(2, uid);
           p.executeUpdate();
           f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    public int likecount(int pid)
    {
        int count=0;
        try
        {
           String q="select count(*) from liked where pid=?;";
           PreparedStatement p=con.prepareStatement(q);
           p.setInt(1, pid);
           ResultSet set=p.executeQuery();
           if(set.next())
           {
               count=set.getInt(1);
           }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return count;
    }
    public boolean likedornot(int pid,int uid)
    {
        boolean f=false;
        try
        {
           String q="select *from liked where pid=? and uid=?;";
           PreparedStatement p=con.prepareStatement(q);
           p.setInt(1, pid);
           p.setInt(2, uid);
           ResultSet set=p.executeQuery();
           if(set.next())
           {
               f=true;
           }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
}
