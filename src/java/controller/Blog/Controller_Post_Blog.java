/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Blog;

import Dao.DAOBlog;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author kienb
 */
public class Controller_Post_Blog extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controller_Post_Blog</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controller_Post_Blog at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("postblog.jsp").include(request, response);
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account a = (Account)session.getAttribute("acc");
        String title, image, content;
        int posterId = a.getId();
        title = request.getParameter("title");
        image = request.getParameter("imageblog");
        content = request.getParameter("content").replaceAll("\r\n", "<br/>");
        System.out.println(content);
        DAOBlog blog = new DAOBlog();
        blog.postBlog(posterId, title, content, image);
        response.sendRedirect("manageblogs?index=1");
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
