/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAO;
import dto.BookDTO;
import dto.TimeSlotDTO;
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
@WebServlet(name = "UserController", urlPatterns = {"/user"})
public class UserController extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        
        if (!action.equals("search") && !action.equals("bookingPage") && (session == null || session.getAttribute("usersession") == null)) {
            request.setAttribute("error", "Vui Lòng Đăng Nhập Trước ");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        if (action.equals("profile")) {
            String username = request.getParameter("userName");
            DAO dao = new DAO();
            UserDTO user = dao.getUserDetail(username);
            request.setAttribute("userDetail", user);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else if (action.equals("bookingPage")) {
            
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        } else if (action.equals("search")) {
            String userID = request.getParameter("userID");
            String fieldID = request.getParameter("fieldID");
            String time = request.getParameter("time");
            DAO dao = new DAO();
            List<TimeSlotDTO> list = dao.listTime(userID, fieldID, time);
            request.setAttribute("availableSlot", list);
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        } else if (action.equals("book")) {
            DAO dao = new DAO();
            int id = dao.getMaxSlotId();
            id += 1;
            int reviewid = dao.getMaxReviewId() + 1;
            String userID = request.getParameter("userID");
            String fieldID = request.getParameter("fieldID");
            String time = request.getParameter("time");
            String slotID = request.getParameter("slotID");
            boolean c = dao.book(id, userID, fieldID, slotID, time);
            boolean d = dao.createReview(reviewid, userID, fieldID, id);
            BookDTO book = dao.getBookingDetail(userID, slotID, fieldID, id);
            if (c) {
                request.setAttribute("bookDetail", book);
                request.setAttribute("msg", "Booking Successfully");
                request.getRequestDispatcher("bookingdetail.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("booking.jsp").forward(request, response);
            }
            
        } else if (action.equals("userBookingList")) {
            String id = request.getParameter("id");
            DAO dao = new DAO();
            List<BookDTO> list = dao.getAllUserBooking(id);
            request.setAttribute("allBooking", list);
            request.getRequestDispatcher("userBookingList.jsp").forward(request, response);
            
        } else if (action.equals("review")) {
            String id = request.getParameter("id");            
            DAO dao = new DAO();
            BookDTO book = dao.getBookingDetails(id);
            request.setAttribute("bookDetail", book);
            request.getRequestDispatcher("review.jsp").forward(request, response);
            
        } else if (action.equals("createreview")) {
            String id = request.getParameter("id");            
            String rate = request.getParameter("rating");            
            String content = request.getParameter("context");            
            DAO dao = new DAO();
            BookDTO book = dao.getBookingDetails(id);
            request.setAttribute("bookDetail", book);
            dao.reviewing(rate, content, id);
            request.setAttribute("a", "Danh gia thanh cong");
            request.getRequestDispatcher("user?action=review").forward(request, response);
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
