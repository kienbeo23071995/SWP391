/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.House;

import controller.*;
import Dao.DAOHouse;
import Model.Account;
import Model.Districts;
import Model.House_Category;
import Model.House_Directions;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author dell
 */
public class Controller_Post_House extends HttpServlet {
   
   /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controller_Post_House</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controller_Post_House at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        DAOHouse h = new DAOHouse();
        //get all information need to create house
        List<Districts> lsD = h.getListDistricts();
        List<House_Category> lsC = h.getListCategory();
        List<House_Directions> lsDR = h.getListDirections();
        
        //send data to client
        request.setAttribute("lsD", lsD);
        request.setAttribute("lsC", lsC);
        request.setAttribute("lsDR", lsDR);
        
        request.getRequestDispatcher("posthouse.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        //get current account login
        HttpSession session = request.getSession();
        Account a = (Account)session.getAttribute("acc");
        
        int district = Integer.parseInt(request.getParameter("district"));
        String address = request.getParameter("address");
        int category = Integer.parseInt(request.getParameter("category"));
        String title = request.getParameter("title");
        String description = request.getParameter("description").replaceAll("\r\n", "<br/>");
        Float price = Float.parseFloat(request.getParameter("price"));
        int houseOwnerId = a.getId();
        int nBedroom = Integer.parseInt(request.getParameter("bedroom"));
        int nBathroom = Integer.parseInt(request.getParameter("bathroom"));
        int area = Integer.parseInt(request.getParameter("area"));
        int houseDirectionId = Integer.parseInt(request.getParameter("direction"));
        String[] images = request.getParameterValues("image");
        
        //insert house to database
        DAOHouse h = new DAOHouse();
        h.insertHouse(houseOwnerId, category, price, district, address, description, title);
        
        //insert house detail to database
        int houseId = h.getHouseId();
        h.insertHouseDetail(houseId,nBedroom,nBathroom,area,0,houseDirectionId);
        
        //insert image to databse
        for (String img : images) {
            h.insertImages(houseId, img);
        }
        response.sendRedirect("homeController");
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    } // </editor-fold>

}
