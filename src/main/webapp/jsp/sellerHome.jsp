<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.onlinegrocery.model.*" %>
<jsp:include page="navbar.jsp"/>

<%
String sellerUserName = (String)session.getAttribute("username");
List<Product> products = ProductModel.getProductsBySeller(sellerUserName);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container mt-5">
<h2>Welcome, <%= sellerUserName %></h2>
<a href="addProducts.jsp" class="btn btn-success mb-3">Add New Product</a>

<table class="table table-bordered table-striped">
<thead class="table-dark">
<tr>
  <th>ID</th>
  <th>Product Name</th>
  <th>Description</th>
  <th>Quantity</th>
  <th>Price</th>
  <th>Actions</th>
</tr>
</thead>
<tbody>
<% for(Product p : products) { %>
<tr>
<td><%= p.getId() %></td>
<td><%= p.getName() %></td>
<td><%= p.getDescription() %></td>
<td><%= p.getQuantity() %></td>
<td><%= p.getPrice() %></td>
<td>
    <form action="${pageContext.request.contextPath}/DeleteProductServlet" method="post" style="display:inline;">
        <input type="hidden" name="productId" value="<%= p.getId() %>"/>
        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
    </form>
</td>
</tr>
<% } %>
</tbody>
</table>
</div>
</body>
</html>
