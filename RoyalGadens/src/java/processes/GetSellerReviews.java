/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package processes;

import DBConfig.DBConfig;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import mvc.Property;
import mvc.Reviews;
import mvc.User;

/**
 *
 * @author Ishan Darshana
 */
public class GetSellerReviews {

    public static List<Reviews> getSellerReviews(String seller) {
        PreparedStatement pst;
        Reviews r = null;
        List<Reviews> list = new ArrayList<Reviews>();
        List<User> userList = new ArrayList<User>();
        try {

            pst = new DBConfig().getConnection().prepareStatement("SELECT * FROM reviews WHERE sellers_idsellers=?");
            pst.setInt(1, Integer.parseInt(seller));
            ResultSet rs = pst.executeQuery();

            if (rs.isBeforeFirst()) {
                while (rs.next()) {
                    r = new Reviews();
                    r.setReview(rs.getString("review"));
                    r.setDate(rs.getString("date"));
                    r.setStars(rs.getInt("stars"));
                    r.setSeller(rs.getInt("sellers_idsellers"));

                    String nic = rs.getString("users_nic");
                    r.setBuyer(nic);

                    userList = GetUsers.getUsersByNIC(nic);
                    pst = new DBConfig().getConnection().prepareStatement("SELECT * FROM users WHERE nic=?");
                    pst.setString(1, nic);
                    ResultSet rs02 = pst.executeQuery();
                    rs02.first();

                    r.setImage(rs02.getString("image"));
                    r.setUsername(rs02.getString("username"));

                    list.add(r);
                }
            } else {
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
