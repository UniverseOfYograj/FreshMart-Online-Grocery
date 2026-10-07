<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="navbar.jsp" />
<%@ page import="java.sql.*, com.onlinegrocery.model.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart - FreshMart</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-success mb-4"><i class="bi bi-cart-fill"></i> Your Shopping Cart</h2>

    <%
        String buyer = (String) session.getAttribute("username");
        ResultSet rs = CartModel.getCartItems(buyer);
        double grandTotal = 0;
        boolean hasItems = false;
    %>

    <table class="table table-bordered table-hover">
        <thead class="table-success">
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>Price (₹)</th>
                <th>Total (₹)</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (rs != null) {
                    while (rs.next()) {
                        hasItems = true;
                        grandTotal += rs.getDouble("total");
            %>
            <tr>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getInt("quantity") %></td>
                <td><%= rs.getDouble("price") %></td>
                <td><%= rs.getDouble("total") %></td>
                <td>
                    <form action="<%=request.getContextPath() %>/RemoveFromCartServlet" method="post" style="display:inline;">
                        <input type="hidden" name="productId" value="<%= rs.getInt("product_id") %>"/>
                        <button class="btn btn-danger btn-sm">
                            <i class="bi bi-trash"></i> Remove
                        </button>
                    </form>
                </td>
            </tr>
            <%
                    }
                }
                if (!hasItems) {
            %>
            <tr>
                <td colspan="5" class="text-center text-muted">🛒 Your cart is empty!</td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <% if (hasItems) { %>
    <div class="text-end mt-3">
        <h4 class="text-success">Grand Total: ₹<%= grandTotal %></h4>
        <a href="checkout.jsp" class="btn btn-primary btn-lg mt-2">
            <i class="bi bi-credit-card"></i> Proceed to Checkout
        </a>
    </div>
    <% } %>
</div>

</body>
</html>
