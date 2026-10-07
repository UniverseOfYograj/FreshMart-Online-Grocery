package com.onlinegrocery.controller;
import com.onlinegrocery.model.*;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginControllerServlet extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        
        try {
        	String role=usermodel.validateLogin(username, password);
        	
        	if(role!=null) {
        		HttpSession session=request.getSession();
        		session.setAttribute("username", username);
        		session.setAttribute("role",role);
        		
        		switch(role) {
        		case "buyer":
        			response.sendRedirect("jsp/buyerHome.jsp");
        			break;
        		case "seller":
        			response.sendRedirect("jsp/sellerHome.jsp");
        			break;
        		case "admin":
        			response.sendRedirect("jsp/adminDashboard.jsp");
        			break;
        		}
        	}else {
        		request.setAttribute("error", "Invalid username or password!");
        		RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
        		rd.forward(request, response);
        	}
        	
        }catch(Exception ex) {
        	System.out.println(ex);
        	response.sendRedirect("showdberror.html");
        }
}
}
