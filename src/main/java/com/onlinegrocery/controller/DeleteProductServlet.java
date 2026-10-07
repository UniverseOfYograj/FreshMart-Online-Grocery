package com.onlinegrocery.controller;

import com.onlinegrocery.model.ProductModel;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


public class DeleteProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        boolean deleted = ProductModel.softDeleteProduct(productId);
        response.sendRedirect(request.getContextPath() + "/jsp/sellerHome.jsp");
        
    }
}
