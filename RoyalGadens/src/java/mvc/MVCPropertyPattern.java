/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mvc;

import DBConfig.DBConfig;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Ishan Darshana
 */
@WebServlet(name = "MVCPropertyPattern", urlPatterns = {"/MVCPropertyPattern"})
@MultipartConfig

public class MVCPropertyPattern extends HttpServlet {

    static User model;
    static UserView view;
    static UserController controller;

    public void init() {
        model = new User();
        view = new UserView();
        controller = new UserController(model, view);

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        HttpSession session = request.getSession();
        String nic = session.getAttribute("nic").toString();

        String sql = "SELECT idsellers,users_nic FROM sellers WHERE users_nic=?";
        PreparedStatement ps = new DBConfig().getConnection().prepareStatement(sql);
        ps.setString(1, nic);
        ResultSet rs = ps.executeQuery();
        if (!rs.isBeforeFirst()) {
            String insert = "INSERT INTO sellers (level,users_nic) VALUES (?,?)";
            PreparedStatement pst = new DBConfig().getConnection().prepareStatement(insert);
            pst.setString(1, "1");
            pst.setString(2, nic);
            pst.executeUpdate();
        }

        ResultSet rs2 = ps.executeQuery();
        rs2.first();
        controller.setId(rs2.getInt("idsellers"));

        Property propertyModel = retrivePropertyFromDB(request, response);
        PropertyView propertyView = new PropertyView();
        PropertyController controller = new PropertyController(propertyModel, propertyView);

        String insert = "INSERT INTO property (name,address,description,images,price,landSize,house_size,city,bedroom,livingroom,parking,kichen,bath_rooms,sellers_idSellers) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pst = new DBConfig().getConnection().prepareStatement(insert);
        pst.setString(1, controller.getName());
        pst.setString(2, controller.getAddress());
        pst.setString(3, controller.getDescription());
        pst.setString(4, controller.getImages());
        pst.setDouble(5, controller.getPrice());
        pst.setDouble(6, controller.getLandSize());
        pst.setDouble(7, controller.getHouseSize());
        pst.setString(8, controller.getCity());
        pst.setInt(9, controller.getBedRoom());
        pst.setInt(10, controller.getLivingRoom());
        pst.setInt(11, controller.getParking());
        pst.setInt(12, controller.getKichen());
        pst.setInt(13, controller.getBathRooms());
        pst.setInt(14, controller.getSeller());
        pst.executeUpdate();

        String insertFee = "INSERT INTO totalpublishedfee (fee,date,sellers_idsellers) VALUES (?,?,?)";
        pst = new DBConfig().getConnection().prepareStatement(insertFee);

        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

        pst.setDouble(1, 5000);
        pst.setDate(2, sqlDate);
        pst.setInt(3, MVCPropertyPattern.controller.getId());

        pst.executeUpdate();

        response.sendRedirect("post-your-property.jsp?msg=success");
    }

    static String getImageName(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        // Create path components to save the file
        final String path = request.getServletContext().getRealPath("/") + "images/uploads";
        final Part filePart = request.getPart("file");
        final String fileName = getFileName(filePart);

        OutputStream out = null;
        InputStream filecontent = null;

        try {
            out = new FileOutputStream(new File(path + File.separator
                    + fileName));
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

    private static String getFileName(final Part part) {
//        final String partHeader = part.getHeader("content-disposition");
//        LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    private static Property retrivePropertyFromDB(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        Property property = new Property();
        property.setName(request.getParameter("title"));
        property.setAddress(request.getParameter("address"));
        property.setDescription(request.getParameter("description"));
        property.setImages(getImageName(request, response));
        property.setPrice(Double.parseDouble(request.getParameter("price")));
        property.setLandSize(Double.parseDouble(request.getParameter("landsize")));
        property.setHouseSize(Double.parseDouble(request.getParameter("housesize")));
        property.setCity(request.getParameter("location"));
        property.setBedRoom(Integer.parseInt(request.getParameter("beds")));
        property.setLivingRoom(Integer.parseInt(request.getParameter("livingrooms")));
        property.setParking(Integer.parseInt(request.getParameter("parkings")));
        property.setKichen(Integer.parseInt(request.getParameter("kitchen")));
        property.setBathRooms(Integer.parseInt(request.getParameter("baths")));
        property.setSeller(controller.getId());
        return property;

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
            Logger.getLogger(MVCPropertyPattern.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(MVCPropertyPattern.class.getName()).log(Level.SEVERE, null, ex);
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
