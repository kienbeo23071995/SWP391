/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kienb
 */
public class DAO {
    public Connection conn=null;
     public DAO(String url,String userName,String pass){
         try {
            //goi driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //conect
            conn=DriverManager.getConnection(url,userName,pass);
            System.out.println("Connected");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
    }
     public DAO(){
        this("jdbc:sqlserver://localhost:1433;databaseName=SWP391_HouseRentalSystem",
                "sa","123456");
    }
    public ResultSet getData(String sql){
        ResultSet rs=null;
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            rs=state.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    } 
}
