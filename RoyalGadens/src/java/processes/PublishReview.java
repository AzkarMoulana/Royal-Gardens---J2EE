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

@WebServlet(name = "PublishReview", urlPatterns = {"/PublishReview"})
public class PublishReview extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int seller = Integer.parseInt(request.getParameter("seller")); //get seller id
        String buyer = request.getParameter("buyer"); //get seller nic
        int starCount = Integer.parseInt(request.getParameter("rating"));
        String story = request.getParameter("story");
        PreparedStatement pst;

        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        try {

            pst = new DBConfig().getConnection().prepareStatement("SELECT users_nic FROM reviews WHERE users_nic=? AND sellers_idsellers=?");
            pst.setString(1, buyer);
            pst.setInt(2, seller);
            ResultSet rs = pst.executeQuery();

            if (rs.isBeforeFirst()) {
                response.sendRedirect("profile.jsp?review-status=not-published&id=" + seller + "");
            } else {

                pst = new DBConfig().getConnection().prepareStatement("INSERT INTO reviews (review,date,stars,sellers_idsellers,users_nic)VALUES (?,?,?,?,?)");
                pst.setString(1, story);
                pst.setDate(2, sqlDate);
                pst.setInt(3, starCount);
                pst.setInt(4, seller);
                pst.setString(5, buyer);
                pst.executeUpdate();
                response.sendRedirect("profile.jsp?review-status=published&id=" + seller + "");
            }

        } catch (SQLException ex) {
            Logger.getLogger(PublishReview.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
