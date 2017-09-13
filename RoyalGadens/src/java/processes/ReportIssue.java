/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package processes;

import DBConfig.DBConfig;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
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
@WebServlet(name = "ReportIssue", urlPatterns = {"/ReportIssue"})
public class ReportIssue extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            String problem = request.getParameter("faultname");
            String url = request.getParameter("url");
            String description = request.getParameter("description");

            PreparedStatement pst;
            pst = new DBConfig().getConnection().prepareStatement("INSERT INTO issues (faultName,description,date,url,users_nic) VALUES(?,?,?,?,?)");
            pst.setString(1, problem);
            pst.setString(2, description);
            pst.setDate(3, new java.sql.Date(new java.util.Date().getTime()));
            pst.setString(4, url);
            pst.setString(5, session.getAttribute("nic").toString());
            pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
