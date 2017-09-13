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

/**
 *
 * @author Ishan Darshana
 */
public class CheckOwnProperties {

    public static boolean getPropertyByID(int id, String sessionNIC) {

        boolean isMyOwnProperty = false;
        try {

            PreparedStatement ps = new DBConfig().getConnection().prepareStatement("SELECT sellers_idsellers FROM property WHERE idplot=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            rs.next();

            if (!rs.isBeforeFirst()) {

                PreparedStatement ps02 = new DBConfig().getConnection().prepareStatement("SELECT users_nic FROM sellers WHERE idsellers=?");
                ps02.setInt(1, rs.getInt("sellers_idsellers"));
                ResultSet rs02 = ps02.executeQuery();
                rs02.first();

                if (!rs02.isBeforeFirst()) {
                    if (sessionNIC.equals(rs02.getString("users_nic"))) {
                        isMyOwnProperty = true;
                    }

                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isMyOwnProperty;
    }

}
