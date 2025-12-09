package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

    // ====== CONFIG DATABASE ======
    private static final String URL = "jdbc:mysql://localhost:3306/ocs?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"; // sua ten db
    private static final String USER = "root"; // sua tai khoan
    private static final String PASSWORD = "123456"; // pass

    // ====== LOAD JDBC DRIVER ======
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
        } catch (ClassNotFoundException e) {
            System.out.println("❌ Không tìm thấy MySQL JDBC Driver!");
            e.printStackTrace();
        }
    }

    // ====== GET CONNECTION ======
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // ====== TEST CONNECT (optional) ======
    public static void main(String[] args) {
        try (Connection conn = DBConnect.getConnection()) {
            if (conn != null) {
                System.out.println("✅ Kết nối MySQL thành công!");
            }
        } catch (Exception e) {
            System.out.println("❌ Kết nối thất bại!");
            e.printStackTrace();
        }
    }
}
