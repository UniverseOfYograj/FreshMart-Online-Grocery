package com.onlinegrocery.model;
import java.sql.*;
import java.util.*;

public class CartModel {
    
    private static Connection conn = usermodel.getConnection();

    // 🟢 Add item to cart
    public static boolean addToCart(String buyer, int productId, int quantity) {
        try {
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO cart(buyer, product_id, quantity) VALUES (?, ?, ?)"
            );
            ps.setString(1, buyer);
            ps.setInt(2, productId);
            ps.setInt(3, quantity);

            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException ex) {
            System.out.println("Error adding to cart: " + ex);
            return false;
        }
    }

    // 🟢 Get all cart items for a buyer
    public static ResultSet getCartItems(String buyer) {
        try {
            PreparedStatement ps = conn.prepareStatement(
                "SELECT p.id AS product_id, p.name, p.price, c.quantity, (p.price * c.quantity) AS total " +
                "FROM cart c JOIN products p ON c.product_id = p.id " +
                "WHERE c.buyer = ?"
            );
            ps.setString(1, buyer);
            return ps.executeQuery();
        } catch (SQLException ex) {
            System.out.println("Error fetching cart items: " + ex);
            return null;
        }
    }

    // 🟢 Remove product from cart
    public static boolean removeFromCart(String buyer, int productId) {
        try {
            PreparedStatement ps = conn.prepareStatement(
                "DELETE FROM cart WHERE buyer=? AND product_id=?"
            );
            ps.setString(1, buyer);
            ps.setInt(2, productId);

            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println("Error removing from cart: " + ex);
            return false;
        }
    }
}
