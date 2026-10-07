package com.onlinegrocery.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.onlinegrocery.model.usermodel;

public class RegistrationControllerServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String role=request.getParameter("role");
		
		if(!isStrongPassword(password)) {
			request.setAttribute("message","Password must contain at least 8 characters, a digit, an uppercase, a lowercase, and a special symbol!");
		    request.getRequestDispatcher("/jsp/registration.jsp").forward(request,response);
		    return;
		}
	    
		
		boolean success=usermodel.registerUser(username,email,password,role);
		
		if(success) {
			request.setAttribute("message", "Registration successful! Please login.");
			request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
		}else {
			request.setAttribute("message", "Registration failed. Username or Email may already exist.");
            request.getRequestDispatcher("/jsp/registration.jsp").forward(request, response);	
		}
		
	}
	private boolean isStrongPassword(String password) {
		return password.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!]).{8,}$");
	}

}
