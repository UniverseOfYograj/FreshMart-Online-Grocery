<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="navbar.jsp"/>
<%@ page import="java.sql.*, com.onlinegrocery.model.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout - FreshMart</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="text-primary mb-4"><i class="bi bi-credit-card"></i> Checkout</h2>

    <%
        String buyer = (String) session.getAttribute("username");
        ResultSet rs = CartModel.getCartItems(buyer);
        double grandTotal = 0;
        boolean hasItems = false;
    %>

    <table class="table table-bordered table-hover">
        <thead class="table-primary">
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>Price (₹)</th>
                <th>Total (₹)</th>
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
            </tr>
            <%
                    }
                }
                if (!hasItems) {
            %>
            <tr>
                <td colspan="4" class="text-center text-muted">Your cart is empty.</td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <% if (hasItems) { %>
    <div class="text-end mt-3">
        <h4 class="text-success">Grand Total: ₹<%= grandTotal %></h4>
        <form action="${pageContext.request.contextPath}/CheckoutServlet" method="post">
            <button type="submit" class="btn btn-success btn-lg mt-2">
                <i class="bi bi-bag-check"></i> Place Order
            </button>
        </form>
    </div>
    <% } %>
</div>

</body>
</html>
