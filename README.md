FreshMart — Online Grocery Web Application
FreshMart is a Java-based online grocery shopping web application developed as a Dynamic Web Project using JSP, Java Servlets, JDBC, MySQL, Bootstrap and Apache Tomcat.
The application provides separate buyer and seller flows. Buyers can browse products, search products, manage a shopping cart and place orders. Sellers can add products and manage their listed products.
Project type: Eclipse Dynamic Web Project
Architecture: JSP + Servlet + JDBC
Application Server: Apache Tomcat 9
Database: MySQL
Frontend: JSP, HTML, CSS, Bootstrap 5
JDBC Driver: MySQL Connector/J 9.4.0 (configured separately in Eclipse)

✨ Features
👤 User & Authentication
- Buyer and Seller registration
- Login using username/password
- Role-based redirection after login
- HTTP session-based user handling
- Logout/navigation flow through the JSP layer
🛒 Buyer
- Browse available grocery products
- Search products by name/description
- View product price and quantity
- Add products to cart
- Remove products from cart
- Review cart
- Proceed to checkout
- Place an order
- Product stock is updated after checkout
- Cart is cleared after successful order placement
- Order-success confirmation page
🏪 Seller
- Seller registration/login
- Seller dashboard
- Add new products
- View products listed by the seller
- Remove/deactivate products
⚙️ Backend
- Java Servlet request handling
- JDBC-based MySQL persistence
- Prepared statements for database queries
- Session-based role handling
- Product inventory/quantity updates
- Cart and order persistence
- Soft-delete style product deactivation using is_active
🧰 Technology Stack
Layer	Technology
Frontend	JSP, HTML5, CSS3
UI	Bootstrap 5, Bootstrap Icons
Backend	Java Servlets
Database Access	JDBC
Database	MySQL
JDBC Driver	MySQL Connector/J 9.4.0
Server	Apache Tomcat 9
IDE	Eclipse IDE for Enterprise Java
Project Type	Eclipse Dynamic Web Project


🏗️ Architecture
The application follows a simple MVC-style separation:
                    ┌─────────────────────┐
                    │      Browser        │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │     JSP Views       │
                    │  HTML/CSS/Bootstrap │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │   Java Servlets     │
                    │    Controllers      │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │ JDBC / Model Layer  │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │       MySQL         │
                    └─────────────────────┘
📁 Project Structure
OnlineGroceryApp/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── onlinegrocery/
│       │           ├── controller/
│       │           │   ├── AddProductServlet.java
│       │           │   ├── AddToCartServlet.java
│       │           │   ├── CheckoutServlet.java
│       │           │   ├── DeleteProductServlet.java
│       │           │   ├── LoginControllerServlet.java
│       │           │   ├── RegistrationControllerServlet.java
│       │           │   └── RemoveFromCartServlet.java
│       │           │
│       │           └── model/
│       │               ├── CartModel.java
│       │               ├── Product.java
│       │               ├── ProductModel.java
│       │               └── usermodel.java
│       │
│       └── webapp/
│           ├── css/
│           │   └── welcome.css
│           │
│           ├── jsp/
│           │   ├── addProducts.jsp
│           │   ├── buyerHome.jsp
│           │   ├── cart.jsp
│           │   ├── checkout.jsp
│           │   ├── login.jsp
│           │   ├── navbar.jsp
│           │   ├── orderSuccess.jsp
│           │   ├── registration.jsp
│           │   └── sellerHome.jsp
│           │
│           ├── index.jsp
│           ├── META-INF/
│           └── WEB-INF/
│               └── web.xml
│
├── .classpath
├── .project
├── .settings/
├── .gitignore
└── README.md
Generated files
The Eclipse-generated build/ directory and compiled .class files are not part of the source code and should not be committed to GitHub.
🔄 Application Flow
Buyer Flow
Registration
     ↓
Login
     ↓
Buyer Home
     ↓
Search / Browse Products
     ↓
Add to Cart
     ↓
Cart
     ↓
Checkout
     ↓
Create Order
     ↓
Update Product Quantity
     ↓
Clear Cart
     ↓
Order Success
Seller Flow
Registration
     ↓
Login
     ↓
Seller Home
     ↓
Add Product
     ↓
View Seller Products
     ↓
Deactivate Product
🧩 Main Backend Components
Component	Responsibility
LoginControllerServlet	Authenticates users and redirects according to role
RegistrationControllerServlet	Handles buyer/seller registration
AddProductServlet	Adds products for sellers
DeleteProductServlet	Deactivates seller products
AddToCartServlet	Adds products to buyer cart
RemoveFromCartServlet	Removes products from cart
CheckoutServlet	Processes checkout, creates order and updates stock
ProductModel	Product-related database operations
CartModel	Cart-related database operations
usermodel	User/database connection and user operations
Product	Product model/entity


🖥️ JSP Pages
The following JSP pages are present in the project source and form the main application UI:
JSP	Purpose
index.jsp	Application landing page
login.jsp	User login
registration.jsp	Buyer/Seller registration
buyerHome.jsp	Buyer product listing and search
cart.jsp	Shopping cart
checkout.jsp	Checkout form
orderSuccess.jsp	Successful order confirmation
sellerHome.jsp	Seller dashboard/product management
addProducts.jsp	Add new product
navbar.jsp	Role-aware navigation


These pages are connected to the corresponding Servlet endpoints defined in web.xml.
🗄️ Database
The application uses a MySQL database named:
onlinegroceryapp
The source code works with the following logical entities/tables:
users
Stores application users.
username
email
password
role
Roles used by the application include:
buyer
seller
products
Stores products listed by sellers.
id
name
description
quantity
price
seller_username
is_active
cart
Stores products added to a buyer's cart.
buyer
product_id
quantity
orders
Stores order records created during checkout.
buyer
product_id
quantity
total
Note: The current source archive does not contain a .sql database export. The database/tables therefore need to be created separately before running the application.

🔌 MySQL Connector/J Configuration
This project was developed in Eclipse with MySQL Connector/J 9.4.0 configured separately from the project source.
The JDBC driver JAR is therefore intentionally not required to be committed inside:
src/main/webapp/WEB-INF/lib/
Eclipse configuration
After downloading MySQL Connector/J, add the JAR to the project:
Right Click Project
        ↓
Build Path
        ↓
Configure Build Path
        ↓
Libraries
        ↓
Classpath
        ↓
Add External JARs...
        ↓
mysql-connector-j-9.4.0.jar
The application uses the MySQL JDBC driver:
com.mysql.cj.jdbc.Driver
and a MySQL JDBC URL similar to:
jdbc:mysql://localhost:3306/onlinegroceryapp
Important
The JDBC driver itself is not the database.
MySQL Server
    = Database Server

MySQL Connector/J
    = Java JDBC Driver

Apache Tomcat
    = Java Web/Application Server
🚀 Running the Project Locally
Prerequisites
Install:
- JDK 21
- Eclipse IDE for Enterprise Java and Web Developers
- Apache Tomcat 9
- MySQL Server
- MySQL Connector/J 9.4.0
1. Clone the repository
git clone <YOUR_GITHUB_REPOSITORY_URL>
Open the project in Eclipse as an existing Eclipse project.
2. Configure Tomcat
In Eclipse:
Window
→ Preferences
→ Server
→ Runtime Environments
→ Add
→ Apache Tomcat v9.0
Select your local Tomcat 9 installation.
Then:
Right Click Project
→ Run As
→ Run on Server
3. Create the MySQL database
Open MySQL Workbench, MySQL CLI or another MySQL client and create:
CREATE DATABASE onlinegroceryapp;
Create the required tables based on the fields used by the application.
4. Configure MySQL Connector/J
Add:
mysql-connector-j-9.4.0.jar
to the Eclipse project's classpath as described above.
5. Configure local database credentials
The database connection should use your local credentials.
Do not commit real passwords or private database credentials to GitHub.
For example, keep local configuration outside the public repository and use your local values for:
Database URL
Database username
Database password
6. Start Tomcat
Run the project on Tomcat.
The application uses:
index.jsp
as its configured welcome page through:
<welcome-file-list>
    <welcome-file>index.jsp</welcome-file>
</welcome-file-list>
🔐 Security Before Public GitHub Upload
Before making the repository public, remove the hard-coded database credentials from the Java source.
Do not commit:
username = root
password = <real-password>
or any other actual database password.
Also avoid committing:
- .env
- local database configuration
- IDE machine-specific secrets
- generated build output
The included .gitignore helps prevent common generated/local files from being committed.
If a real password has already been committed to any public Git repository, change/rotate that password even after removing it from the latest source.

📌 Current Project Scope
The attached source archive contains the core working application flow:
- [x] JSP frontend
- [x] Java Servlet backend
- [x] JDBC/MySQL integration
- [x] Buyer registration
- [x] Seller registration
- [x] Login
- [x] Role-based navigation/redirection
- [x] Product browsing
- [x] Product search
- [x] Seller product creation
- [x] Seller product management
- [x] Shopping cart
- [x] Remove from cart
- [x] Checkout
- [x] Order creation
- [x] Inventory quantity update
- [x] Cart clearing after successful checkout
- [x] Order success page
- [x] Tomcat deployment configuration
The project is best presented as a completed academic/portfolio Java web application, rather than as a production-ready e-commerce platform.
⚠️ Production-Level Improvements
The current application is functional but can be strengthened considerably for production use.
Recommended improvements:
- Hash passwords using BCrypt or Argon2
- Move DB configuration outside Java source
- Add proper authentication/authorization filters
- Validate product ownership on seller operations
- Add stock validation before checkout
- Use database transactions for checkout
- Use a connection pool instead of a manually managed shared JDBC connection
- Add CSRF protection
- Improve input validation and XSS protection
- Add order history
- Add seller order management
- Add product categories/images
- Add pagination and filtering
- Add automated unit/integration tests
- Migrate to Spring Boot + Spring Data JPA for a modern backend
- Add REST APIs and a React frontend
- Add Docker and CI/CD
These are future production improvements, not requirements for the current portfolio project to demonstrate its implemented functionality.
🎯 Portfolio Value
This project demonstrates hands-on experience with:
- Java web development
- Servlets
- JSP
- JDBC
- MySQL
- HTTP sessions
- Role-based application flows
- CRUD operations
- Shopping cart implementation
- Checkout/order processing
- Inventory updates
- SQL/database integration
- Apache Tomcat deployment
- Eclipse Dynamic Web Projects
It also provides a strong base for a future Spring Boot implementation.
👨‍💻 Author
Yograj Tripathi
Java | Spring Boot | React.js | MySQL | DSA | Backend Development
📄 License
This project is intended for educational, portfolio and demonstration purposes.