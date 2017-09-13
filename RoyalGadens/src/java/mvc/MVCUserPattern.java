/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mvc;

import DBConfig.DBConfig;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author Ishan Darshana
 */
@WebServlet(name = "MVCUserPattern", urlPatterns = {"/MVCUserPattern"})
public class MVCUserPattern extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        PreparedStatement ps;
        String nic = request.getParameter("nic");
        String email = request.getParameter("email");
        String username = request.getParameter("username");

        ps = new DBConfig().getConnection().prepareStatement("SELECT nic,email,username FROM users WHERE nic=? OR email=? OR username=?");
        ps.setString(1, nic);
        ps.setString(2, email);
        ps.setString(3, username);
        ResultSet rs = ps.executeQuery();

        if (rs.isBeforeFirst()) {
            response.sendRedirect("register.jsp?userexist=true");
        } else {
            User model = retriveUsersFromDB(request, response); //use to set user details using mvc model
            UserView view = new UserView(); // create a view to print details

            UserController controller = new UserController(model, view); // create a controler update/get users

            String sql = "INSERT INTO users (nic,name,username,password,email,contact,location,status) VALUES (?,?,?,?,?,?,?,?)";
            ps = new DBConfig().getConnection().prepareStatement(sql);
            ps.setString(1, controller.getNic());
            ps.setString(2, controller.getName());
            ps.setString(3, controller.getUsername());
            ps.setString(4, controller.getPassword());
            ps.setString(5, controller.getEmail());
            ps.setString(6, controller.getContact());
            ps.setString(7, controller.getLocation());
            ps.setString(8, controller.getStatus());
            ps.executeUpdate();
            response.sendRedirect("register.jsp");
        }

    }

    private static User retriveUsersFromDB(HttpServletRequest request, HttpServletResponse response) {

        User user = new User();
        user.setNic(request.getParameter("nic"));
        user.setName(request.getParameter("name"));
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password"));
        user.setEmail(request.getParameter("email"));
        user.setContact(request.getParameter("contact"));
        user.setLocation(request.getParameter("location"));
        user.setStatus("A");

        return user;

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
        } catch (Exception e) {
            e.printStackTrace();
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
            Logger.getLogger(MVCUserPattern.class.getName()).log(Level.SEVERE, null, ex);
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
