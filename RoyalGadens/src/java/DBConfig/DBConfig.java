/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConfig;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Ishan Darshana
 */
public class DBConfig {

    private Connection conn;

    public Connection getConnection() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/royalgd", "root", "Srilanka123!@#");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }

}
