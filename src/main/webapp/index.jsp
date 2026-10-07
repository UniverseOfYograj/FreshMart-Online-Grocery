<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="jsp/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
<link rel="stylesheet" type="text/css" href="css/welcome.css">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- Optional JS for collapse functionality -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


</head>
<body>

<div class="container text-center welcome-container">
    <h1 class="welcome-title">Welcome to FreshMart Grocery</h1>
    
    <div class="row justify-content-center mt-4">
        <div class="col-md-3 mb-3">
            <a href="<%= request.getContextPath() %>/jsp/login.jsp" class="btn btn-success btn-lg w-100"><i class="bi bi-box-arrow-in-right"></i> Login</a>
        </div>
        <div class="col-md-3 mb-3">
            <a href="<%= request.getContextPath() %>/jsp/registration.jsp" class="btn btn-primary btn-lg w-100"><i class="bi bi-pencil-square"></i> Register</a>
        </div>
    </div>

    <div class="grocery-icons mt-5">
        <i class="bi bi-cart-fill"></i>
        <i class="bi bi-basket-fill"></i>
        <i class="bi bi-egg-fried"></i>
        <i class="bi bi-leaf"></i>
        <i class="bi bi-bag-fill"></i>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</body>
</html>
