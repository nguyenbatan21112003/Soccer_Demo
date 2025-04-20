/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAO;
import dto.FieldDTO;
import dto.ReviewDTO;
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
@WebServlet(name = "HomeController", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        String keyword = request.getParameter("location");

            if (keyword == null) {
                keyword = "";
            }
        
        if (action == null) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
             DAO dao = new DAO();

            // Nhận tham số trang từ request
            int page = 1;
            int pageSize = 6; // Số lượng FieldDTO mỗi trang
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            List<FieldDTO> list = dao.getFieldsByPage(page, pageSize,keyword);
            int totalFields = dao.getTotalFields(keyword);
            int totalPages = (int) Math.ceil((double) totalFields / pageSize);

            request.setAttribute("list", list);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else if (action == null || action.equals("list")) {

            DAO dao = new DAO();

            // Nhận tham số trang từ request
            int page = 1;
            int pageSize = 6; // Số lượng FieldDTO mỗi trang
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            List<FieldDTO> list = dao.getFieldsByPage(page, pageSize,keyword);
            int totalFields = dao.getTotalFields(keyword);
            int totalPages = (int) Math.ceil((double) totalFields / pageSize);

            request.setAttribute("list", list);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else if (action.equals("search")) {
            
            DAO dao = new DAO();
            //paging
            int page = 1;
            int pageSize = 6; // Số lượng FieldDTO mỗi trang
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            
            int totalFields = dao.getTotalFields(keyword);
            int totalPages = (int) Math.ceil((double) totalFields / pageSize);
            List<FieldDTO> list = dao.getFieldsByPage(page, pageSize,keyword);
            request.setAttribute("list", list);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            
            //paging
            
            
           
            request.setAttribute("keyword", keyword);
            request.setAttribute("list", list);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else if (action.equals("details")) {

            String id = request.getParameter("id");
            DAO dao = new DAO();
            FieldDTO c = dao.getDetail(id);
            List<ReviewDTO> list = dao.getAllReview(id);
            request.setAttribute("detail", c);
            request.setAttribute("reviewlist", list);
            request.getRequestDispatcher("details.jsp").forward(request, response);

        } else if (action.equals("login")) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            DAO dao = new DAO();
            UserDTO user = dao.login(username, password);
            if (user != null) {

                HttpSession session = request.getSession(true);

                session.setAttribute("usersession", user);
                if (user.getRole().equals("Customer")) {
                    response.sendRedirect("home?action=list");
                } else {
                    response.sendRedirect("admin");
                }
            } else {
                request.setAttribute("error", "Username or password is incorrect");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } else if (action.equals("logout")) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            request.setAttribute("error", "Logout Successfully!");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } else if (action.equals("signup")) {

            String username = request.getParameter("user");
            String fullname = request.getParameter("fullname");
            String password = request.getParameter("pass");
            String address = request.getParameter("address");
            String email = request.getParameter("email");

            DAO dao = new DAO();
            int userid = dao.getMaxId() + 1;
            boolean success = dao.signup(userid, username, fullname, email, password, address);

            if (success) {
                request.setAttribute("error", "Đăng ký thành công! Vui lòng đăng nhập.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Đăng ký thất bại! Vui lòng thử lại.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
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
