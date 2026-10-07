<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="../jsp/navbar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<body>
<div class="container mt-5">
<h2>Add New Product</h2>
<form action="<%= request.getContextPath() %>/AddProductServlet" method="post">
<div class="mb-3">
<label>Product Name</label>
<input type="text" name="name" class="form-control" required>
</div>

<div class="mb-3">
<label>Description</label>
<input type="text" name="description" class="form-control">
</div>
 <div class="mb-3">
            <label>Quantity</label>
            <input type="number" name="quantity" class="form-control" required min="1">
        </div>
        <div class="mb-3">
            <label>Price</label>
            <input type="number" name="price" step="0.01" class="form-control" required min="0">
        </div>
       
   <button type="submit" class="btn btn-success">Add Product</button>
</form>
</body>
</html>