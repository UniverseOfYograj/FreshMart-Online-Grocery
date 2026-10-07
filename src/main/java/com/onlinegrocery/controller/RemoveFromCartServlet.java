package com.onlinegrocery.controller;

import com.onlinegrocery.model.CartModel;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


public class RemoveFromCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String buyer = (String) session.getAttribute("username");
        int productId = Integer.parseInt(request.getParameter("productId"));

        boolean success = CartModel.removeFromCart(buyer, productId);

        if (success) {
        	System.out.println("Suceess!");
        	response.sendRedirect(request.getContextPath() + "/jsp/cart.jsp");
        } else {
        	System.out.println("Failure!");
            request.setAttribute("message", "Unable to remove item from cart.");
            request.getRequestDispatcher("/jsp/cart.jsp").forward(request, response);
        }
    }
}
