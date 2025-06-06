/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import sun.security.pkcs11.Secmod;

/**
 *
 * @author Hoa Doan
 */
public class DBUtils {
//    Do not change this code
    private static final String DB_NAME = "FootballFieldBooking1";
    private static final String DB_USER_NAME = "sa";
    private static final String DB_PASSWORD = "12345";

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=" + DB_NAME;
        conn = DriverManager.getConnection(url, DB_USER_NAME, DB_PASSWORD);
        return conn;
    }
    
    public static void main(String[] args) {
    try (Connection conn = DBUtils.getConnection()) {
        if (conn != null) {
            System.out.println("✅ Kết nối thành công đến database: " + DB_NAME);
        } else {
            System.out.println("❌ Kết nối thất bại!");
        }
    } catch (ClassNotFoundException | SQLException e) {
        System.out.println("❌ Lỗi kết nối: " + e.getMessage());
        e.printStackTrace();
    }
}

}
