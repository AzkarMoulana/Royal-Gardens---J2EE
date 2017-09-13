/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package processes;

import DBConfig.DBConfig;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ishan Darshana
 */
@WebServlet(name = "userLogin", urlPatterns = {"/userLogin"})
public class userLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        

        String sql = "SELECT email,password,nic FROM users WHERE email=? AND password=?";
        PreparedStatement ps = new DBConfig().getConnection().prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        
        
        if (!rs.isBeforeFirst()) {
            response.sendRedirect("register.jsp?msg=invalid");
        } else {
            rs.first();
            String nic = rs.getString("nic");
            
            PreparedStatement pst = new DBConfig().getConnection().prepareStatement("UPDATE users SET lastvisited=?,ipaddress=? WHERE nic=?");
            pst.setDate(1, new java.sql.Date(new java.util.Date().getTime()));
            pst.setString(2,request.getRemoteAddr());
            pst.setString(3,nic);
            pst.executeUpdate();
            


            //create a session to identifed user log out or not
            HttpSession session = request.getSession();
            session.setAttribute("nic", nic);
            session.setAttribute("email", rs.getString("email"));
            session.setAttribute("password", rs.getString("password"));

            if (request.getParameter("remember-me") != null && request.getParameter("remember-me").equals("on")) {
                session.setMaxInactiveInterval(3600 * 24);
            }

            response.sendRedirect("index.jsp");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(userLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(userLogin.class.getName()).log(Level.SEVERE, null, ex);
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
