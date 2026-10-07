package com.onlinegrocery.model;
import java.sql.*;
import java.util.*;

public class ProductModel {
	private static Connection conn=usermodel.getConnection();
	
	public static List<Product>getAllProducts(){
		List<Product>products=new ArrayList<>();
		try {
			PreparedStatement ps=conn.prepareStatement(
					"SELECT * FROM products WHERE is_active = TRUE"
					);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				products.add(new Product(
				rs.getInt("id"),
				rs.getString("name"),
				rs.getString("description"),
				rs.getInt("quantity"),
				rs.getDouble("price"),
				rs.getString("seller_username")));
			}
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return products;
	}
	
	public static List<Product>getProductsBySeller(String sellerusername){
		List<Product>products=new ArrayList<>();
		try {
			PreparedStatement ps=conn.prepareStatement(
					 "SELECT * FROM products WHERE seller_username=? AND is_active = TRUE"
					);
			ps.setString(1, sellerusername);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				products.add(new Product(
						rs.getInt("id"),
						rs.getString("name"),
						rs.getString("description"),
						rs.getInt("quantity"),
						rs.getDouble("price"),
						rs.getString("seller_username")
						));
			}
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return products;
	}
	
	public static boolean addProduct(Product p) {
		try {
			PreparedStatement ps=conn.prepareStatement(
					"insert into products(name,description,quantity,price,seller_username)values(?,?,?,?,?)"
					);
			ps.setString(1, p.getName());
			 ps.setString(2, p.getDescription());
	            ps.setInt(3, p.getQuantity());
	            ps.setDouble(4, p.getPrice());
	            ps.setString(5, p.getSellerUsername());
	            System.out.println("Error in adding data!");	
	            return ps.executeUpdate()>0;
		}catch(SQLException ex) {
			System.out.println(ex);
			return false;
		}
	}
	
	public static boolean softDeleteProduct(int productId) {
		try {
			PreparedStatement ps=conn.prepareStatement(
					 "UPDATE products SET is_active = FALSE WHERE id = ?"
					);
			ps.setInt(1, productId);
			
			return ps.executeUpdate()>0;
		}catch(SQLException ex) {
			System.out.println("Deletion failed");
			System.out.println(ex);
			return false;
		}
	}
	
	public static List<Product> searchProducts(String keyword) {
	    List<Product> products = new ArrayList<>();

	    String query = "SELECT * FROM products WHERE name LIKE ? OR description LIKE ?";

	    try {
	        PreparedStatement ps = conn.prepareStatement(query);
	        ps.setString(1, "%" + keyword + "%");
	        ps.setString(2, "%" + keyword + "%");

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Product p = new Product();
	            p.setId(rs.getInt("id"));
	            p.setName(rs.getString("name"));
	            p.setDescription(rs.getString("description"));
	            p.setPrice(rs.getDouble("price"));
	            p.setQuantity(rs.getInt("quantity"));
//	            p.setSellerEmail(rs.getString("seller_email"));
	            products.add(p);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return products;
	}

	

}
