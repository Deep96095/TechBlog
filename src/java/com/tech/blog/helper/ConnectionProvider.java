
package com.tech.blog.helper;
import java.sql.*;
public class ConnectionProvider 
{
    private static Connection con;
    public static Connection getConnection()
    {
        try
        {
           if(con==null)
           {
                //driver class load
                Class.forName("com.mysql.cj.jdbc.Driver");
                //create a conection
                con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/techblog","root","admin1234");
           }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return con;
    }
}
