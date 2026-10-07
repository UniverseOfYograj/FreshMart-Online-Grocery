<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="navbar.jsp"/>
<%@ page import="com.onlinegrocery.model.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buyer Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">

    <h2 class="mb-4">Available Products</h2>

    <!-- 🔍 Search Bar -->
    <form action="<%= request.getContextPath() %>/jsp/buyerHome.jsp" method="get" class="d-flex mb-4" role="search">
        <input type="text" name="search" placeholder="Search products..." 
               class="form-control me-2" style="max-width: 300px;" 
               value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <!-- 📦 Product Listing Table -->
    <table class="table table-bordered table-striped">
        <thead class="table-success">
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Available Quantity</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            String searchQuery = request.getParameter("search");
            List<Product> products;

            if (searchQuery != null && !searchQuery.isEmpty()) {
                products = ProductModel.searchProducts(searchQuery);  // You’ll create this method
            } else {
                products = ProductModel.getAllProducts();
            }

            if (products != null && !products.isEmpty()) {
                for (Product p : products) {
        %>
            <tr>
                <td><%= p.getName() %></td>
                <td><%= p.getDescription() %></td>
                <td><%= p.getQuantity() %></td>
                <td><%= p.getPrice() %></td>
                <td>
                    <% if(p.getQuantity() > 0) { %>
                        <form action="<%= request.getContextPath() %>/AddToCartServlet" method="post" class="d-flex align-items-center">
                            <input type="hidden" name="productId" value="<%= p.getId() %>"/>
                            <input type="number" name="quantity" min="1" max="<%= p.getQuantity() %>" value="1" 
                                   class="form-control form-control-sm me-2" style="width:70px;"/>
                            <button class="btn btn-success btn-sm">Add to Cart</button>
                        </form>
                    <% } else { %>
                        <span class="text-danger">Out of Stock</span>
                    <% } %>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5" class="text-center text-muted">No products found.</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

</div>
</body>
</html>
