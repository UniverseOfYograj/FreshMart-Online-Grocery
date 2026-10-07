<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="navbar.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - FreshMart</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="css/welcome.css">
</head>
<body>

<div class="container mt-5" style="max-width: 500px;">
    <div class="card shadow p-4">
        <h2 class="text-center mb-4">Login</h2>

        <% String error = (String) request.getAttribute("error"); 
           if(error != null) { %>
            <div class="alert alert-danger text-center"><%= error %></div>
        <% } %>

        <form action="${pageContext.request.contextPath}/LoginControllerServlet" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username or Email</label>
                <input type="text" name="username" class="form-control" id="username" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="password" required>
            </div>

            <button type="submit" class="btn btn-success w-100">
                <i class="bi bi-box-arrow-in-right"></i> Login
            </button>
        </form>
        <p class="text-center mt-3">Don't have an account? <a href="${pageContext.request.contextPath}/jsp/registration.jsp">Register</a></p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
