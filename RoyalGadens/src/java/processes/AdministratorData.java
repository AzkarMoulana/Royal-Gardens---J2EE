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
import mvc.Issues;
import mvc.PublishedFee;
import mvc.ReservedFee;

/**
 *
 * @author Ishan Darshana
 */
public class AdministratorData {

    public static int getUserCount() {
        int count = 0;
        try {
            PreparedStatement pst = new DBConfig().getConnection().prepareStatement("SELECT COUNT(*) AS rowcount FROM users");
            ResultSet r = pst.executeQuery();
            r.next();
            count = r.getInt("rowcount");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public static int getSellerCount() {
        int count = 0;
        try {
            PreparedStatement pst = new DBConfig().getConnection().prepareStatement("SELECT COUNT(*) AS rowcount FROM sellers");
            ResultSet r = pst.executeQuery();
            r.next();
            count = r.getInt("rowcount");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public static int getBuyerCount() {
        int count = 0;
        try {
            PreparedStatement pst = new DBConfig().getConnection().prepareStatement("SELECT COUNT(*) AS rowcount FROM buyers");
            ResultSet r = pst.executeQuery();
            r.next();
            count = r.getInt("rowcount");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public static int getTotalPublishedFee() {
        int count = 0;
        try {
            PreparedStatement pst = new DBConfig().getConnection().prepareStatement("SELECT SUM(fee) AS totalfee FROM totalpublishedfee");
            ResultSet r = pst.executeQuery();
            r.next();
            count = r.getInt("totalfee");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public static List<PublishedFee> getSellerTransactions() {
        List<PublishedFee> list = new ArrayList<PublishedFee>();
        try {
            PreparedStatement pst = new DBConfig().getConnection().prepareStatement("SELECT * FROM totalpublishedfee");
            ResultSet r = pst.executeQuery();

            while (r.next()) {
                PublishedFee pf = new PublishedFee();
                pf.setFee(r.getInt("fee"));
                pf.setDate(r.getString("date"));
                pf.setSeller(r.getInt("sellers_idsellers"));
                list.add(pf);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static List<ReservedFee> getBuyerTransactions() {
        List<ReservedFee> list = new ArrayList<ReservedFee>();
        try {
            PreparedStatement pst = new DBConfig().getConnection().prepareStatement("SELECT * FROM totalreservedfee");
            ResultSet r = pst.executeQuery();

            while (r.next()) {
                ReservedFee rf = new ReservedFee();
                rf.setFee(r.getInt("payment"));
                rf.setDate(r.getString("date"));
                rf.setBuyer(r.getInt("buyers_idbuyers"));
                list.add(rf);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static List<Issues> getIssues() {
        List<Issues> list = new ArrayList<Issues>();
        PreparedStatement pst;
        try {
            pst = new DBConfig().getConnection().prepareStatement("SELECT * FROM issues");
            ResultSet r = pst.executeQuery();

            while (r.next()) {
                Issues i = new Issues();
                i.setFaultName(r.getString("faultName"));
                i.setDate(r.getString("date"));
                i.setUrl(r.getString("url"));
                String nic = r.getString("users_nic");
                i.setNic(nic);

                pst = new DBConfig().getConnection().prepareStatement("SELECT image FROM users WHERE nic=?");
                pst.setString(1, nic);
                ResultSet rs02 = pst.executeQuery();
                rs02.first();
                i.setImage(rs02.getString("image"));
                list.add(i);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
