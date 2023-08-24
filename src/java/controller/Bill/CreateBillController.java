/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Bill;

import Dao.DAOAccount;
import Dao.DAOBill;
import Dao.DAOHouse;
import Model.Account;
import Model.Bill;
import Model.House;
import Model.House_Details;
import Model.House_Directions;
import Model.House_Images;
import Model.InforOwner;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author kienb
 */
public class CreateBillController extends HttpServlet {

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
            out.println("<title>Servlet CreateBillController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateBillController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        int houseId = Integer.parseInt(request.getParameter("id"));
        DAOHouse h = new DAOHouse();
        DAOAccount a = new DAOAccount();
        List<House_Images> lsHI = h.getListHouseImageByHouseId(houseId);
        String firstImg = "./assets/images/";
        String lsImg = "";
        if (lsHI.size() != 1) {
            for (int i = 0; i < lsHI.size(); i++) {
                if (i != lsHI.size() - 1) {
                    if (i == 0) {
                        firstImg += lsHI.get(i).getImage();
                        System.out.println("img: " + firstImg);
                    }
                    lsImg += lsHI.get(i).getImage().concat(",");
                } else {
                    lsImg += lsHI.get(i).getImage();
                }
            }
        }else{
            firstImg += lsHI.get(0).getImage();
        }
        InforOwner io = h.getInforOfOwner(houseId);
        House hs = h.getHouseById(houseId);
        House_Details hd = h.getHouseDetailById(houseId);
        House_Directions hdi = h.getHouseDirectionById(houseId);
        request.setAttribute("fhouse", hs);
        request.setAttribute("fhousedetail", hd);
        request.setAttribute("fhousedirection", hdi);
        request.setAttribute("finforowner", io);
        request.setAttribute("firstImg", firstImg);
        request.getRequestDispatcher("CreateBill.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id =  request.getParameter("houseID");
            Account account  = (Account) request.getSession().getAttribute("acc");
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            Bill bill = new Bill();
            bill.setHouseID(Integer.parseInt(id));
            bill.setRent(account.getId());
            bill.setStartDate(new SimpleDateFormat("yyyy-MM-dd").parse(startDate));
            bill.setEndDate(new SimpleDateFormat("yyyy-MM-dd").parse(endDate));
            DAOBill dAOBill  = new DAOBill();
            dAOBill.insertBill(bill);
            
        } catch (ParseException ex) {
            Logger.getLogger(CreateBillController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
