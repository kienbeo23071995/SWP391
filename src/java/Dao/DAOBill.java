/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Model.Bill;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

/**
 *
 * @author kienb
 */
public class DAOBill extends DBContext {

    public void insertBill(Bill bill) {
        try {
            String stmSql = "INSERT INTO [dbo].[Bill]\n"
                    + "           ([house_id]\n"
                    + "           ,[tenant]\n"
                    + "           ,[startDate]\n"
                    + "           ,[endDate]\n"
                    + "           ,[createdDate]\n"
                    + "           ,[updatedDate])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,GETDATE(),GETDATE())";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(stmSql);
            ps.setInt(1, bill.getHouseID());
            ps.setInt(2, bill.getRent());
            ps.setDate(3, new Date(bill.getStartDate().getTime()));
            ps.setDate(4, new Date(bill.getEndDate().getTime()));
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Have error!");
        }
    }
}
