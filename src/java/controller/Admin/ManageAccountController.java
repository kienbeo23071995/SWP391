/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Admin;

import Dao.DAOAccount;
import Model.Account;
import Ulti.Constants;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class ManageAccountController extends HttpServlet {

    private int recordsPerPage = 6;
    int status = -1;
    String textSearch = "";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageAccountController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageAccountController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DAOAccount DAcc = new DAOAccount();

        //start with first page
        int page = 1;
        //check current page of user
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(
                    request.getParameter("page"));
        }

        //check text search is null or not
        if (textSearch == null) {
            textSearch = "";
        }

        //get all user depend on text search and status
        ArrayList<Account> list = DAcc.getAllAccount((page - 1) * recordsPerPage,
                recordsPerPage, textSearch, status);

        //caculate all record
        int noOfRecords = DAcc.getTotalAccount(textSearch, status);

        //caculate total page
        int noOfPages = (int) Math.ceil((double) noOfRecords
                / recordsPerPage);

        
        //get message if exist
        String msg = (String) request.getSession().getAttribute("msg");
        if (msg != null) {
            request.setAttribute("msg", msg);
        }
        
        //box data to send to client
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("noOfRecords", noOfRecords);
        request.setAttribute("list", list);
        request.setAttribute("status", status);
        request.setAttribute("textSearch", textSearch);

        //redirect to jsp manage account
        request.getRequestDispatcher("ManageAccountAdmin.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DAOAccount DAcc = new DAOAccount();
        int accountID;
        //get action request by client
        String action = request.getParameter("action");
        switch (action) {

            //case search
            case "search":
                //set value search is send from client
                textSearch = request.getParameter("textSearch");
                status = Integer.parseInt(request.getParameter("status"));
                doGet(request, response);
                break;

            //case change status of account
            case "deactive":
                //get value id is send from client
                accountID = Integer.parseInt(request.getParameter("accountID"));
                DAcc.updateStatusAccount(accountID, Constants.Deactive);
                request.getSession().setAttribute("msg", "Cập nhật trạng thái của tài khoản có ID " + accountID + " thành công!");
                doGet(request, response);
                break;
            case "active":
                //get value id is send from client
                accountID = Integer.parseInt(request.getParameter("accountID"));
                DAcc.updateStatusAccount(accountID, Constants.Active);
                request.getSession().setAttribute("msg", "Cập nhật trạng thái của tài khoản có ID " + accountID + " thành công!");
                doGet(request, response);
                break;
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
