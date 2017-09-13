/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package processes;

import DBConfig.DBConfig;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Ishan Darshana
 */
public class GetUserID {

    public static String getUserID(String nic) {
       
        PreparedStatement pst;
        String idsellers = null;
        try {

            pst = new DBConfig().getConnection().prepareStatement("SELECT idsellers FROM sellers WHERE users_nic=?");
            pst.setString(1, nic);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                idsellers = rs.getString("idsellers");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return idsellers;

    }

}
