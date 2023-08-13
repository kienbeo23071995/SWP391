/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Account;

import Dao.DAOAccount;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.regex.Pattern;

/**
 *
 * @author kienb
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class Controller_Change_Information extends HttpServlet {

    private static final String DEFAULT_FILENAME = "default.file";

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
            out.println("<title>Servlet Controller_Change_Information</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controller_Change_Information at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        request.setAttribute("fullname", a.getFullname());
        request.setAttribute("address", a.getAddress());
        request.setAttribute("phone", a.getPhone_Number().trim());
        request.setAttribute("gender", a.getGender());
        request.setAttribute("email", a.getEmail());
        request.getRequestDispatcher("user_profile.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        String fullName, address, phone, picture, email, password;
        Boolean gender;
        fullName = request.getParameter("fullname");
        address = request.getParameter("address");
        phone = request.getParameter("phone");
        gender = request.getParameter("gender").equals("1");
        picture = a.getProfile_Picture();
        email = a.getEmail();
        password = a.getPassword();
        Pattern f = Pattern.compile("[a-zA-Z\\s]+");
        int length = getServletContext().getRealPath("/").length();
        String uploadPath = new StringBuilder(getServletContext().getRealPath("/")).delete(length - 10,length - 4).toString() + "assets" + File.separator + "images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        for (Part part : request.getParts()) {
            picture = getFileName(part);
            if (!picture.equals(DEFAULT_FILENAME) && !picture.trim().isEmpty()) {
                part.write(uploadPath + File.separator + picture);
                break;
            }
        }
        if (picture.equals(DEFAULT_FILENAME) || picture.trim().isEmpty()) {
            picture = a.getProfile_Picture();
        }
        DAOAccount change = new DAOAccount();
        DAOAccount account = new DAOAccount();
        if (f.matcher(fullName).find()) {
            Pattern p = Pattern.compile("^[0-9]+$");
            if (p.matcher(phone).find()) {
                change.changeInformation(fullName, address, phone, gender, picture, email);
                session.removeAttribute("acc");
                Account acc = account.Login(email, password);
                session.setAttribute("acc", acc);
                response.sendRedirect("homeController");
            } else {
                request.setAttribute("alertP", "Invalid phone number!");
                request.getRequestDispatcher("user_profile.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("alertF", "Full name must start with letter!");
            request.getRequestDispatcher("user_profile.jsp").forward(request, response);
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
    // test 

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return DEFAULT_FILENAME;
    }
}
