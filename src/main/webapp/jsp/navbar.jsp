<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String role = (String) session.getAttribute("role"); 
    String username = (String) session.getAttribute("username");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-success sticky-top shadow">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
      <i class="bi bi-basket-fill"></i> FreshMart
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

        <% if (role == null) { %>
          <!-- Public Navbar -->
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jsp/about.jsp">About Us</a></li>
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jsp/contact.jsp">Contact</a></li>
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jsp/explore.jsp">Explore</a></li>

        <% } else if ("buyer".equals(role)) { %>
          <!-- Buyer Navbar -->
          <li class="nav-item d-flex align-items-center text-white me-3">
            Welcome, <b><%= username %></b>
          </li>
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jsp/buyerHome.jsp">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jsp/cart.jsp">Cart <i class="bi bi-cart-fill"></i></a></li>
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jsp/profile.jsp"><i class="bi bi-person-circle"></i> Profile</a></li>
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jsp/logout.jsp">Logout</a></li>

        <% } else if ("seller".equals(role)) { %>
          <!-- Seller Navbar -->
          <li class="nav-item d-flex align-items-center text-white me-3">
            Welcome, <b><%= username %></b>
          </li>
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jsp/sellerHome.jsp">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jsp/myProducts.jsp">My Products <i class="bi bi-box-seam"></i></a></li>
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jsp/addProduct.jsp">Add Product <i class="bi bi-plus-circle"></i></a></li>
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jsp/sellerOrders.jsp">Orders <i class="bi bi-card-checklist"></i></a></li>
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jsp/profile.jsp"><i class="bi bi-person-circle"></i> Profile</a></li>
          <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/jsp/logout.jsp">Logout</a></li>
        <% } else if(role.equals("admin")) { %>
          <!-- Admin Navbar -->
          <h3>Welcome! <%=username %></h3>
          <li class="nav-item"><a class="nav-link" href="adminDashboard.jsp">Dashboard</a></li>
          <li class="nav-item"><a class="nav-link" href="manageUsers.jsp">Users</a></li>
          <li class="nav-item"><a class="nav-link" href="manageProducts.jsp">Products</a></li>
          <li class="nav-item"><a class="nav-link" href="manageOrders.jsp">Orders</a></li>
          <li class="nav-item"><a class="nav-link" href="reports.jsp">Reports</a></li>
          <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
        <% } %>

      </ul>
    </div>
  </div>
</nav>
