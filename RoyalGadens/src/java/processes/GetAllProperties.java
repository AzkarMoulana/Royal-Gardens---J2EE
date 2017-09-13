/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Ishan Darshana
 */
package processes;

import DBConfig.DBConfig;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Cookie;
import mvc.Property;
import mvc.User;

public class GetAllProperties {

    public static List<Property> getRecords(int start, int total) {
        List<Property> list = new ArrayList<Property>();
        try {

            PreparedStatement ps = new DBConfig().getConnection().prepareStatement("SELECT * FROM property LIMIT " + (start - 1) + "," + total);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Property e = new Property();
                e.setName(rs.getString("name"));
                e.setIdplot(rs.getInt("idplot"));
                e.setImages(rs.getString("images"));
                e.setPrice(rs.getDouble("price"));
                e.setCity(rs.getString("city"));
                e.setDescription(rs.getString("description"));
                e.setBedRoom(rs.getInt("bedroom"));
                e.setLivingRoom(rs.getInt("livingroom"));
                e.setParking(rs.getInt("parking"));
                e.setKichen(rs.getInt("kichen"));
                e.setBuyer(rs.getInt("buyers_idbuyers"));
                list.add(e);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static List<Property> getHotProperties(int count) {
        List<Property> list = new ArrayList<Property>();
        try {

            PreparedStatement ps = new DBConfig().getConnection().prepareStatement("SELECT * FROM property ORDER BY price DESC LIMIT " + count + "");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Property e = new Property();
                e.setBuyer(rs.getInt("buyers_idbuyers"));
                e.setImages(rs.getString("images"));
                e.setPrice(rs.getDouble("price"));
                e.setName(rs.getString("name"));
                e.setIdplot(rs.getInt("idplot"));
                e.setBedRoom(rs.getInt("bedroom"));
                e.setLivingRoom(rs.getInt("livingroom"));
                e.setParking(rs.getInt("parking"));
                e.setKichen(rs.getInt("kichen"));
                list.add(e);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static List<Property> getPropertyByID(int id) {
        List<Property> list = new ArrayList<Property>();
        try {

            PreparedStatement ps = new DBConfig().getConnection().prepareStatement("SELECT * FROM property WHERE idplot=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Property e = new Property();
                e.setName(rs.getString("name"));
                e.setImages(rs.getString("images"));
                e.setPrice(rs.getDouble("price"));
                e.setCity(rs.getString("city"));
                e.setDescription(rs.getString("description"));
                e.setBedRoom(rs.getInt("bedroom"));
                e.setLivingRoom(rs.getInt("livingroom"));
                e.setParking(rs.getInt("parking"));
                e.setKichen(rs.getInt("kichen"));
                e.setBuyer(rs.getInt("buyers_idbuyers"));
                e.setSeller(rs.getInt("sellers_idsellers"));

                PreparedStatement ps02 = new DBConfig().getConnection().prepareStatement("SELECT users_nic FROM sellers WHERE idsellers=?");
                ps02.setInt(1, rs.getInt("sellers_idsellers"));
                ResultSet rs02 = ps02.executeQuery();
                rs02.first();

                PreparedStatement ps03 = new DBConfig().getConnection().prepareStatement("SELECT name,contact FROM users WHERE nic=?");
                ps03.setString(1, rs02.getString("users_nic"));
                ResultSet rs03 = ps03.executeQuery();
                rs03.first();

                e.setSellerName(rs03.getString("name"));
                e.setContact(rs03.getString("contact"));

                list.add(e);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static List<Property> getProperties(String userIdentity) {
        List<Property> list = new ArrayList<Property>();
        int sellerID;
        try {

            if (userIdentity.length() < 8) { // to confirm this is exaclty a id number,nic==10 length
                sellerID = Integer.parseInt(userIdentity);
            } else {
                PreparedStatement ps = new DBConfig().getConnection().prepareStatement("SELECT idsellers FROM sellers WHERE users_nic=?");
                ps.setString(1, userIdentity);
                ResultSet rs = ps.executeQuery();
                rs.first();
                sellerID = rs.getInt("idsellers");

            }

            PreparedStatement ps02 = new DBConfig().getConnection().prepareStatement("SELECT * FROM property WHERE sellers_idsellers=?");
            ps02.setInt(1, sellerID);
            ResultSet rs02 = ps02.executeQuery();

            while (rs02.next()) {

                Property e = new Property();
                e.setSeller(sellerID);
                e.setName(rs02.getString("name"));
                e.setImages(rs02.getString("images"));
                e.setPrice(rs02.getDouble("price"));
                e.setBedRoom(rs02.getInt("bedroom"));
                e.setLivingRoom(rs02.getInt("livingroom"));
                e.setParking(rs02.getInt("parking"));
                e.setKichen(rs02.getInt("kichen"));
                e.setIdplot(rs02.getInt("idplot"));
                list.add(e);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Property> getReservedProperties(String nic) {
        List<Property> list = new ArrayList<Property>();
        PreparedStatement ps = null;
        try {

            ps = new DBConfig().getConnection().prepareStatement("SELECT idbuyers FROM buyers WHERE users_nic=?");

            ps.setString(1, nic);
            ResultSet rs = ps.executeQuery();
            int idbuyers = 0;
            if (rs.next()) {

                idbuyers = rs.getInt("idbuyers");
            }

            ps = new DBConfig().getConnection().prepareStatement("SELECT * FROM property WHERE buyers_idbuyers=?");
            ps.setInt(1, idbuyers);
            ResultSet rs02 = ps.executeQuery();
            while (rs02.next()) {
                Property e = new Property();
                e.setIdplot(rs02.getInt("idplot"));
                e.setName(rs02.getString("name"));
                e.setImages(rs02.getString("images"));
                e.setPrice(rs02.getDouble("price"));
                e.setBedRoom(rs02.getInt("bedroom"));
                e.setLivingRoom(rs02.getInt("livingroom"));
                e.setParking(rs02.getInt("parking"));
                e.setKichen(rs02.getInt("kichen"));
                list.add(e);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Property> getAllReservedProperties(int start, int total, String nic) {
        List<Property> list = new ArrayList<Property>();
        PreparedStatement ps = null;
        try {

            ps = new DBConfig().getConnection().prepareStatement("SELECT idbuyers FROM buyers WHERE users_nic=?");

            ps.setString(1, nic);
            ResultSet rs = ps.executeQuery();
            rs.first();
            int idbuyers = rs.getInt("idbuyers");

            ps = new DBConfig().getConnection().prepareStatement("SELECT * FROM property WHERE buyers_idbuyers=? LIMIT ?,?");
            ps.setInt(1, idbuyers);
            ps.setInt(2, start - 1);
            ps.setInt(3, total);
            ResultSet rs02 = ps.executeQuery();
            while (rs02.next()) {
                Property e = new Property();
                e.setIdplot(rs02.getInt("idplot"));
                e.setName(rs02.getString("name"));
                e.setImages(rs02.getString("images"));
                e.setPrice(rs02.getDouble("price"));
                e.setBedRoom(rs02.getInt("bedroom"));
                e.setLivingRoom(rs02.getInt("livingroom"));
                e.setParking(rs02.getInt("parking"));
                e.setKichen(rs02.getInt("kichen"));
                list.add(e);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static List<Property> getAllReservedPropertiesByFiltering(int start, int total, String nic, String keyword, String city,
            String landSize, String price) {

        List<Property> list = new ArrayList<Property>();
        PreparedStatement ps = null;
        int firstValue = 0;
        int secondValue = 0;
        int idbuyers;
        try {

            if (city.equals("city")) {
                city = null;
            }
            if (landSize.equals("land-size")) {
                landSize = null;
            }

            if (price.equals("price")) {
                price = null;
            } else {

                if (price.equals("RS150,000 - RS200,000")) {
                    firstValue = 150000;
                    secondValue = 200000;

                } else if (price.equals("RS200,000 - RS250,000")) {
                    firstValue = 200000;
                    secondValue = 250000;

                } else if (price.equals("RS250,000 - RS300,000")) {
                    firstValue = 250000;
                    secondValue = 300000;

                }

            }

            if (nic.equals("nic-not-need")) {

                idbuyers = 0;

            } else {
                ps = new DBConfig().getConnection().prepareStatement("SELECT idbuyers FROM buyers WHERE users_nic=?");

                ps.setString(1, nic);
                ResultSet rs = ps.executeQuery();
                rs.first();
                idbuyers = rs.getInt("idbuyers");

            }

            if (!keyword.equals("")) {

                ps = new DBConfig().getConnection().prepareStatement("SELECT * FROM property WHERE (buyers_idbuyers=? OR ?=0) AND name LIKE '%" + keyword + "%' LIMIT ?,?");
                ps.setInt(1, idbuyers);
                ps.setInt(2, idbuyers);
                ps.setInt(3, start - 1);
                ps.setInt(4, total);

            } else {
                ps = new DBConfig().getConnection().prepareStatement("SELECT * FROM property WHERE (buyers_idbuyers=? OR ?=0) AND "
                        + "(city=? OR ? IS NULL) AND (landsize=? OR ? IS NULL) AND (price BETWEEN ? AND ? OR ? IS NULL) LIMIT ?,?");
                ps.setInt(1, idbuyers);
                ps.setInt(2, idbuyers);
                ps.setString(3, city);
                ps.setString(4, city);
                ps.setString(5, landSize);
                ps.setString(6, landSize);
                ps.setInt(7, firstValue);
                ps.setInt(8, secondValue);
                ps.setString(9, price);
                ps.setInt(10, start - 1);
                ps.setInt(11, total);
            }

            ResultSet rs02 = ps.executeQuery();
            while (rs02.next()) {
                Property e = new Property();
                e.setIdplot(rs02.getInt("idplot"));
                e.setName(rs02.getString("name"));
                e.setImages(rs02.getString("images"));
                e.setPrice(rs02.getDouble("price"));
                e.setBedRoom(rs02.getInt("bedroom"));
                e.setLivingRoom(rs02.getInt("livingroom"));
                e.setParking(rs02.getInt("parking"));
                e.setKichen(rs02.getInt("kichen"));
                list.add(e);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static List<Property> getRecommendedProperties(String keyword) {
        List<Property> list = new ArrayList<Property>();
        try {

            PreparedStatement ps = new DBConfig().getConnection().prepareStatement("SELECT * FROM property WHERE name LIKE '%" + keyword + "%'");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Property e = new Property();
                e.setName(rs.getString("name"));
                e.setImages(rs.getString("images"));
                e.setPrice(rs.getDouble("price"));
                e.setCity(rs.getString("city"));
                e.setDescription(rs.getString("description"));
                e.setBedRoom(rs.getInt("bedroom"));
                e.setLivingRoom(rs.getInt("livingroom"));
                e.setParking(rs.getInt("parking"));
                e.setKichen(rs.getInt("kichen"));
                e.setIdplot(rs.getInt("idplot"));
                e.setBuyer(rs.getInt("buyers_idbuyers"));
                list.add(e);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

}
