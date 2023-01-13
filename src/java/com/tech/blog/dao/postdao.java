
package com.tech.blog.dao;

import com.tech.blog.entities.catagory;
import com.tech.blog.entities.posts;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class postdao 
{
    Connection con;

    public postdao(Connection con) {
        this.con = con;
    }
    public ArrayList<catagory> getCategories()
    {
        ArrayList<catagory> list= new ArrayList<>();
        try
        {
           String q="select *from catagory";
           Statement st=con.createStatement();
           ResultSet set=st.executeQuery(q);
           while(set.next())
           {
               catagory on=new catagory(set.getInt("cid"),set.getString("name"),set.getString("description"));
               list.add(on);
           }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
    public boolean savepost(posts p)
    {
        boolean f=false;
        try
        {
            String q="insert into posts(cid, ptitle, pcontent, pcode,ppic,userid) values (?,?,?,?,?,?);";
            PreparedStatement pt=con.prepareStatement(q);
            pt.setInt(1, p.getCid());
            pt.setString(2, p.getPtitle());
            pt.setString(3, p.getPcontent());
            pt.setString(4, p.getPcode());
            pt.setString(5, p.getPpic());
            pt.setInt(6, p.getUserid());
            pt.executeUpdate();
            f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    public ArrayList<posts> getallpost()
    {
       ArrayList<posts> list=new ArrayList<>();
       try
        {
           String q="select *from posts";
           Statement st=con.createStatement();
           ResultSet set=st.executeQuery(q);
           while(set.next())
           {
               posts obj=new posts(set.getInt("pid"), set.getInt("cid"), set.getString("ptitle"), set.getString("pcontent"), set.getString("pcode"), set.getString("ppic"), set.getTimestamp("pdate"), set.getInt("userid"));
               list.add(obj);
           }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
        
    }
    public ArrayList<posts> getpostbycid(int x)
    {
      ArrayList<posts> list=new ArrayList<>();
       try
        {
           String q="select *from posts where cid=?";
           PreparedStatement st=con.prepareStatement(q);
           st.setInt(1, x);
           ResultSet set=st.executeQuery();
           while(set.next())
           {
               posts obj=new posts(set.getInt("pid"), set.getInt("cid"), set.getString("ptitle"), set.getString("pcontent"), set.getString("pcode"), set.getString("ppic"), set.getTimestamp("pdate"), set.getInt("userid"));
               list.add(obj);
           }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
    public posts getpostbypid(int x)
    {
      posts ob=null;
       try
        {
           String q="select *from posts where pid=?";
           PreparedStatement st=con.prepareStatement(q);
           st.setInt(1, x);
           ResultSet set=st.executeQuery();
           while(set.next())
           {
               ob=new posts(set.getInt("pid"), set.getInt("cid"), set.getString("ptitle"), set.getString("pcontent"), set.getString("pcode"), set.getString("ppic"), set.getTimestamp("pdate"), set.getInt("userid"));
           }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return ob;
    }
}
