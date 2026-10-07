package com.onlinegrocery.model;

import java.sql.*;

public class usermodel {
    private static Connection conn;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // load driver once
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/onlinegroceryapp",
                "username",
                "password"
            );
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            System.out.println("DB Connection Error: " + ex);
        }
    }
    public static Connection getConnection() {
    	return conn;
    }

    public static boolean registerUser(String username, String email, String password, String role) {
        try {
            // Check if username or email already exists
            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM users WHERE username=? OR email=?"
            );
            ps.setString(1, username);
            ps.setString(2, email);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return false; // user/email already exists
            }

            // Insert new user
            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO users(username,email,password,role) VALUES(?,?,?,?)"
            );
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, role);

            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public static String validateLogin(String username, String password) {
        String role = null;
        try {
            PreparedStatement ps = conn.prepareStatement(
                "SELECT role FROM users WHERE username=? AND password=?"
            );
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                role = rs.getString("role");
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Error validating login: " + ex);
        }
        return role;
    }
}
