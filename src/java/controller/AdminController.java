/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAO;
import dto.BookDTO;
import dto.FieldDTO;
import dto.RevenuaDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bacda
 */
@WebServlet(name = "AdminController", urlPatterns = {"/admin"})
public class AdminController extends HttpServlet {

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
        String action = request.getParameter("action");
        if (action == null) {
            DAO dao = new DAO();
            List<FieldDTO> list = dao.getAllField();
            request.setAttribute("list", list);
            request.getRequestDispatcher("adminHome.jsp").forward(request, response);
        } else if (action.equals("add")) {
            DAO dao = new DAO();
            int id = dao.getMaxFieldId()+1;
            String fieldName = request.getParameter("fieldName");
            String description = request.getParameter("description");
            String location = request.getParameter("location");
            String price = request.getParameter("price");
            String imageURL = request.getParameter("imageURL");
            String amenities = request.getParameter("amenities");
            DAO.create(id, fieldName, description, location, price, imageURL, amenities);
            
            List<FieldDTO> list = dao.getAllField();
            request.setAttribute("list", list);
            request.getRequestDispatcher("adminHome.jsp").forward(request, response);

        } else if (action.equals("delete")) {
            String id = request.getParameter("fieldID");
            DAO.delete(id);
            DAO dao = new DAO();
            List<FieldDTO> list = dao.getAllField();
            request.setAttribute("list", list);
            request.getRequestDispatcher("adminHome.jsp").forward(request, response);

        } else if(action.equals("addPage")){
            request.getRequestDispatcher("addField.jsp").forward(request, response);
        } else if(action.equals("bookingListPage")){
            DAO dao = new DAO();
            List<BookDTO> list = dao.getAllBooking();
            request.setAttribute("allBooking", list);
            request.getRequestDispatcher("bookinglistAdmin.jsp").forward(request, response);
        } else if (action.equals("Accept")){
            String id = request.getParameter("id");
            DAO dao = new DAO();
            dao.confirm(id);
            request.setAttribute("msg", "Da xac nhan thanh cong");
            request.getRequestDispatcher("admin?action=bookingListPage").forward(request, response);
        
        } else if (action.equals("Reject")){
            String id = request.getParameter("id");
            DAO dao = new DAO();
            dao.reject(id);
            request.setAttribute("msg", "Da tu choi thanh cong");
            request.getRequestDispatcher("admin?action=bookingListPage").forward(request, response);
        } else if(action.equals("revenuaReport")){
            DAO dao = new DAO();
            List<RevenuaDTO> list = dao.revenua();
            request.setAttribute("list", list);
            request.getRequestDispatcher("revenua.jsp").forward(request, response);
        } else if(action.equals("updatePage")){
            String id = request.getParameter("fieldID");
            DAO dao = new DAO();
            FieldDTO field = dao.getDetail(id);
            request.setAttribute("detail", field);
            request.getRequestDispatcher("updatePage.jsp").forward(request, response);
        } else if (action.equals("update")){
            String id = request.getParameter("fieldID");
            String name = request.getParameter("fieldName");
            String des = request.getParameter("description");
            String lo = request.getParameter("location");
            String pri = request.getParameter("price");
            String img = request.getParameter("imageURL");
            String amen = request.getParameter("amenities");
            
            DAO dao = new DAO();
            dao.update(id, name, des, lo, pri, img, amen);
           
            List<FieldDTO> list = dao.getAllField();
            request.setAttribute("list", list);
            request.getRequestDispatcher("adminHome.jsp").forward(request, response);
            
        } else if(action.equals("userlist")){
            DAO dao = new DAO();
            List<UserDTO> list = dao.getListUser();
            request.setAttribute("list", list);
            request.getRequestDispatcher("userList.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
