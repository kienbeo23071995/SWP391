/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import context.DBContext;
import Model.Districts;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kienb
 */
public class DAODistrict extends DBContext {

    public List<Districts> getListDistricts() {
        try {
            String stmSql = "SELECT *\n"
                    + "  FROM [SWP391_HouseRentalSystem].[dbo].[Districts]";
            List<Districts> lsB = new ArrayList<>();
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(stmSql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lsB.add(new Districts(rs.getInt(1), rs.getString(2)));
            }
            return lsB;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
}
