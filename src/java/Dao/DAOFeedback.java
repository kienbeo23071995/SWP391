/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import context.DBContext;
import Model.Feedback;
import Model.House;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author kienb
 */
public class DAOFeedback {

    public List<Feedback> getFeedbackByHouseId(int id) {
        String sql = "Select * from Feedback where House_ID = ? order by Id desc";
        List<Feedback> list = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getInt(1));
                feedback.setContent(rs.getString(6));
                feedback.setHouse_ID(id);
                feedback.setFeedback_Date(rs.getDate(5));
                feedback.setReceiver_ID(rs.getInt(3));
                feedback.setSender_ID(rs.getInt(2));
                feedback.setReceiver(new DAOAccount().getAccountById(rs.getInt(3)));
                feedback.setSender(new DAOAccount().getAccountById(rs.getInt(2)));
                list.add(feedback);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public void insertFeedBack(House h, int id, String content) {
        try {
            String stmSql = "INSERT INTO [dbo].[Feedback]\n"
                    + "           ([Sender_ID]\n"
                    + "           ,[Receiver_ID]\n"
                    + "           ,[House_ID]\n"
                    + "           ,[Feedback_Date]\n"
                    + "           ,[Content])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,CONVERT(date,GETDATE()),?)";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(stmSql);
            ps.setInt(1, id);
            ps.setInt(2, h.getHouse_Owner_ID());
            ps.setInt(3, h.getId());
            ps.setString(4, content);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void deleteFeedback(int id) {
        try {
            String stmSql = "DELETE FROM [dbo].[Feedback]\n"
                    + "      WHERE Id = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(stmSql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void UpdateFeedBack(int id, String content) {
        try {
            String stmSql = "UPDATE [dbo].[Feedback]\n"
                    + "   SET [Content] = ?\n"
                    + " WHERE Id = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(stmSql);
            ps.setString(1, content);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
