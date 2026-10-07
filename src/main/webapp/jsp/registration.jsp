<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="navbar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register- FreshMart Grocery</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="css/welcome.css">
</head>
<body>

  <div class="card p-4">
    <h3 class="text-center mb-4 text-success">Create Your FreshMart Account</h3>

    <form action="${pageContext.request.contextPath}/RegistrationControllerServlet" method="post">
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" class="form-control" name="username" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" name="email" required>
        </div>
        
         <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" class="form-control" name="password" required>
        </div>
        
        <div class="mb-3">
            <label class="form-label">Role</label>
            <select class="form-select" name="role" required>
                <option value="">Select Role</option>
                <option value="buyer">Buyer</option>
                <option value="seller">Seller</option>
            </select>
        </div>
        
        <button type="submit" class="btn btn-success w-100">Register</button>
        
         <div class="text-center mt-3">
            Already have an account? <a href="${pageContext.request.contextPath}/jsp/login.jsp">Login here</a>

        </div>
        
        <% if(request.getAttribute("message")!=null){%>
        <div class="alert alert-info mt-3 text-center">
        <%= request.getAttribute("message") %>
        </div>
        <%} %>
        
  </form>
</div>
</body>
</html>