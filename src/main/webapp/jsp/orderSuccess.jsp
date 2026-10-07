<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Successful - FreshMart</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container text-center mt-5">
    <h2 class="text-success mb-3"><i class="bi bi-check-circle"></i> Order Placed Successfully!</h2>
    <p>Your order has been confirmed. Thank you for shopping with FreshMart 🛒</p>
    <a href="${pageContext.request.contextPath}/jsp/buyerHome.jsp" class="btn btn-primary mt-3">Continue Shopping</a>
</div>
</body>
</html>
