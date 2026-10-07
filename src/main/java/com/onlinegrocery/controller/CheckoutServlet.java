package com.onlinegrocery.controller;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.onlinegrocery.model.*;


public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String buyer = (String) session.getAttribute("username");

        try (Connection conn = usermodel.getConnection()) {
            // Get cart items
            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM cart WHERE buyer=?");
            ps.setString(1, buyer);
            ResultSet rs = ps.executeQuery();

            boolean hasItems = false;
            while (rs.next()) {
                hasItems = true;
                int productId = rs.getInt("product_id");
                int qty = rs.getInt("quantity");
                double total = rs.getDouble("total");

                // Insert into orders table
                PreparedStatement orderStmt = conn.prepareStatement(
                    "INSERT INTO orders(buyer, product_id, quantity, total) VALUES (?, ?, ?, ?)");
                orderStmt.setString(1, buyer);
                orderStmt.setInt(2, productId);
                orderStmt.setInt(3, qty);
                orderStmt.setDouble(4, total);
                orderStmt.executeUpdate();

                // Update product stock
                PreparedStatement updateStock = conn.prepareStatement(
                    "UPDATE products SET quantity = quantity - ? WHERE id=?");
                updateStock.setInt(1, qty);
                updateStock.setInt(2, productId);
                updateStock.executeUpdate();
            }

            if (hasItems) {
                // Clear cart after checkout
                PreparedStatement clearCart = conn.prepareStatement(
                    "DELETE FROM cart WHERE buyer=?");
                clearCart.setString(1, buyer);
                clearCart.executeUpdate();

                response.sendRedirect(request.getContextPath()+"/jsp/orderSuccess.jsp");
            } else {
                request.setAttribute("message", "Your cart is empty!");
                request.getRequestDispatcher("/jsp/checkout.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Something went wrong during checkout.");
            request.getRequestDispatcher("/jsp/checkout.jsp").forward(request, response);
        }
    }
}
