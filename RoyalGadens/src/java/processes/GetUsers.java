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
import mvc.User;

/**
 *
 * @author Ishan Darshana
 */
public class GetUsers {

    public static List<User> getUser(String email) {
        List<User> list = new ArrayList<User>();
        try {

            PreparedStatement ps = new DBConfig().getConnection().prepareStatement("SELECT * FROM users WHERE email=?");
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User e = new User();
                e.setName(rs.getString("name"));
                e.setImage(rs.getString("image"));
                e.setEmail(email);
                e.setContact(rs.getString("contact"));
                e.setLocation(rs.getString("location"));
                e.setNic(rs.getString("nic"));

                list.add(e);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<User> getUsersByNIC(String nic) {
        List<User> list = new ArrayList<User>();
        try {

            PreparedStatement ps = new DBConfig().getConnection().prepareStatement("SELECT * FROM users WHERE nic=?");
            ps.setString(1, nic);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User e = new User();
                e.setName(rs.getString("name"));
                e.setName(rs.getString("username"));
                e.setImage(rs.getString("image"));
                e.setEmail(rs.getString("email"));
                e.setContact(rs.getString("contact"));
                e.setLocation(rs.getString("location"));
                e.setNic(nic);

                list.add(e);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<User> getAllUsers() {
        List<User> list = new ArrayList<User>();
        try {

            PreparedStatement ps = new DBConfig().getConnection().prepareStatement("SELECT * FROM users");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User e = new User();
                e.setUsername(rs.getString("username"));
                e.setIp(rs.getString("ipaddress"));
                e.setLastVisited(rs.getString("lastvisited"));
                e.setStatus(rs.getString("status"));
                e.setImage(rs.getString("image"));
                list.add(e);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
