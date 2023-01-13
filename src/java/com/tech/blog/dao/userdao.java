
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

public class userdao
{
    private Connection con;

    public userdao(Connection con) 
    {
        this.con = con;
    }
    //methode to insert data to data base
    public boolean saveUser(User user)
    {
        boolean f=false;
        try
        {
            String query="insert into user(name,email,password,gender) values (?,?,?,?);";
            PreparedStatement pstmt=this.con.prepareStatement(query);
            pstmt.setString(1,user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.executeUpdate();
            f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    public User getUserByEmailAndPassword(String email,String pass)
    {
        User ob=null;
        try
        {
            String query="select * from user where email=? and password=?;";
            PreparedStatement pstmt=this.con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2,pass);
            ResultSet set=pstmt.executeQuery();
            if(set.next())
            {
                ob=new User();
                ob.setName(set.getString("name"));
                ob.setEmail(set.getString("email"));
                ob.setPassword(set.getString("password"));
                ob.setGender(set.getString("gender"));
                ob.setId(set.getInt("id"));
                ob.setDatetime(set.getTimestamp("regdate"));
                ob.setProfile(set.getString("profile"));     
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return ob;
    }
    public boolean updateUser(User user)
    {
        boolean f=false;
        try
        {
            String query="update user set email=? , password=? , profile=? where id=?";
            PreparedStatement pstmt=this.con.prepareStatement(query);
            pstmt.setString(1,user.getEmail());
            pstmt.setString(2,user.getPassword());
            pstmt.setString(3, user.getProfile());
            pstmt.setInt(4,user.getId());
            pstmt.executeUpdate();
            f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    public User getUserByuserid(int x)
    {
        User ob=null;
        try
        {
            String query="select * from user where id=?;";
            PreparedStatement pstmt=this.con.prepareStatement(query);
            pstmt.setInt(1, x);
            ResultSet set=pstmt.executeQuery();
            if(set.next())
            {
                ob=new User();
                ob.setName(set.getString("name"));
                ob.setEmail(set.getString("email"));
                ob.setPassword(set.getString("password"));
                ob.setGender(set.getString("gender"));
                ob.setId(set.getInt("id"));
                ob.setDatetime(set.getTimestamp("regdate"));
                ob.setProfile(set.getString("profile"));     
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return ob;
    }
}
