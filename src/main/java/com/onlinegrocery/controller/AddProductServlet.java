package com.onlinegrocery.controller;
import com.onlinegrocery.model.*;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AddProductServlet extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			 String name = request.getParameter("name");
		        String description = request.getParameter("description");
		        int quantity = Integer.parseInt(request.getParameter("quantity"));
		        double price = Double.parseDouble(request.getParameter("price"));
		        String sellerUsername = (String) request.getSession().getAttribute("username");

	
		        Product p = new Product();
		        p.setName(name);
		        p.setDescription(description);
		        p.setQuantity(quantity);
		        p.setPrice(price);
		        p.setSellerUsername(sellerUsername);
		        
		        boolean added = ProductModel.addProduct(p);
		        if(added) {
		        	RequestDispatcher rd = request.getRequestDispatcher("/jsp/sellerHome.jsp");
		        	rd.forward(request, response);

		        } else {
		            response.getWriter().println("Error adding product. Try again.");
		        }
		        
		}

}
