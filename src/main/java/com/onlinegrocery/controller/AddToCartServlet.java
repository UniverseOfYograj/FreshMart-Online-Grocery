package com.onlinegrocery.controller;
import com.onlinegrocery.model.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class AddToCartServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String buyer=(String) session.getAttribute("username");
		int productId=Integer.parseInt(request.getParameter("productId"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		
		boolean success=CartModel.addToCart(buyer,productId,quantity);
		
		if(success) {
			System.out.println("Success!");
			response.sendRedirect(request.getContextPath() + "/jsp/cart.jsp");
		}else {
			request.setAttribute("message", "unable to add to cart");
			request.getRequestDispatcher("jsp/buyerHome.jsp").forward(request, response);
		}
	}

}
