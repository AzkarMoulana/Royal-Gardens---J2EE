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
public class ReserveProperty {

    public static void reserveProperty(int idplot, String nic) {

        try {
            PreparedStatement ps00;
            java.util.Date utilDate = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            int buyerID = 0;

            ps00 = new DBConfig().getConnection().prepareStatement("SELECT price FROM property WHERE idplot=?");
            ps00.setInt(1, idplot);
            ResultSet rs01 = ps00.executeQuery();
            rs01.first();
            //to get price of a property

            while (buyerID == 0) { // create while loop to avoid dublicate select query
                ps00 = new DBConfig().getConnection().prepareStatement("SELECT idbuyers,users_nic FROM buyers WHERE users_nic=?");
                ps00.setString(1, nic);
                ResultSet rs00 = ps00.executeQuery();
                if (!rs00.isBeforeFirst()) { //if empty result set

                    ps00 = new DBConfig().getConnection().prepareStatement("INSERT INTO buyers (users_nic) VALUES (?)");
                    ps00.setString(1, nic);
                    ps00.executeUpdate();

                } else {
                    rs00.first();
                    buyerID = rs00.getInt("idbuyers");
                }
            }

            ps00 = new DBConfig().getConnection().prepareStatement("INSERT INTO totalreservedfee (payment,date,buyers_idbuyers) VALUES (?,?,?)");
            ps00.setDouble(1, (rs01.getDouble("price") * 30) / 100);
            ps00.setDate(2, sqlDate);
            ps00.setInt(3, buyerID);
            ps00.executeUpdate();

            ps00 = new DBConfig().getConnection().prepareStatement("UPDATE property SET buyers_idbuyers=? WHERE idplot=?");
            ps00.setInt(1, buyerID);
            ps00.setInt(2, idplot);
            ps00.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
