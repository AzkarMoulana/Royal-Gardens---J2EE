/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package processes;

import DBConfig.DBConfig;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import mvc.User;
import mvc.UserController;
import mvc.UserView;

/**
 *
 * @author Ishan Darshana
 */
@WebServlet(name = "UpdateUser", urlPatterns = {"/UpdateUser"})
@MultipartConfig
public class UpdateUser extends HttpServlet {

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

        try {
            User model = new User();
            UserView view = new UserView();
            UserController controller = new UserController(model, view);
            HttpSession session = request.getSession();
            String isPWChanged = null;
            controller.setImage(getImageName(request, response));
            controller.setName(request.getParameter("fullname"));
            controller.setContact(request.getParameter("contact"));
            controller.setLocation(request.getParameter("location"));
            controller.setPassword(session.getAttribute("password").toString());

            System.out.println(controller.getContact());
            String sql = "UPDATE users SET image=?,name=?,contact=?,location=?,password=? WHERE nic=?";
            PreparedStatement ps = new DBConfig().getConnection().prepareStatement(sql);

            ps.setString(1, controller.getImage());
            ps.setString(2, controller.getName());
            ps.setString(3, controller.getContact());
            ps.setString(4, controller.getLocation());
            ps.setString(6, session.getAttribute("nic").toString());

            if (request.getParameter("password").equals(session.getAttribute("password"))) {
                controller.setPassword(request.getParameter("newpassword"));
                ps.setString(5, controller.getPassword());
                isPWChanged = "yes";

            } else {
                ps.setString(5, controller.getPassword());
            }
            ps.executeUpdate();
            response.sendRedirect("profile.jsp?msg=success&pw=" + isPWChanged + "");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private static String getFileName(final Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    static String getImageName(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        // Create path components to save the file
        final String path = request.getServletContext().getRealPath("/") + "images/uploads/users";
        final Part filePart = request.getPart("file");
        final String fileName = getFileName(filePart);

        OutputStream out = null;
        InputStream filecontent = null;

        try {
            out = new FileOutputStream(new File(path + File.separator + fileName));
            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }

        } catch (FileNotFoundException fne) {
            fne.printStackTrace();
        }

        return fileName;

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
