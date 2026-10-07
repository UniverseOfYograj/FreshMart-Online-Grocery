# 🛒 FreshMart — Online Grocery Web Application

> A Java-based online grocery shopping web application built with **JSP, Java Servlets, JDBC, MySQL and Apache Tomcat**.

FreshMart provides separate **Buyer** and **Seller** workflows, including authentication, product browsing, cart management, checkout, order creation and inventory updates.

---

## 🚀 Features

### 👤 Authentication
- Buyer and Seller registration
- Login and logout flow
- Role-based navigation and redirection
- Session-based user handling

### 🛍️ Buyer
- Browse available grocery products
- Search products
- View product price and stock
- Add products to cart
- Remove products from cart
- Review cart
- Checkout and place orders
- Automatic stock quantity update
- Cart clearing after successful checkout
- Order-success confirmation

### 🏪 Seller
- Seller registration and login
- Seller dashboard
- Add new products
- View seller products
- Deactivate listed products

### ⚙️ Backend
- Java Servlet-based request handling
- JDBC + MySQL database integration
- Prepared SQL statements
- Session-based role handling
- Product inventory management
- Cart and order persistence

---

## 🧰 Tech Stack

| Category | Technology |
|---|---|
| Language | Java |
| Frontend | JSP, HTML5, CSS3 |
| UI | Bootstrap 5, Bootstrap Icons |
| Backend | Java Servlets |
| Database | MySQL |
| Database Access | JDBC |
| JDBC Driver | MySQL Connector/J 9.4.0 |
| Server | Apache Tomcat 9 |
| IDE | Eclipse IDE for Enterprise Java |
| Project Type | Eclipse Dynamic Web Project |

---

## 🏗️ Application Architecture

The application follows a simple MVC-style web architecture:

**Browser → JSP Views → Java Servlets → JDBC / Model Layer → MySQL**

### Request flow

1. The user interacts with a JSP page.
2. The request is sent to a Java Servlet.
3. The Servlet validates the request and calls the model/database layer.
4. JDBC communicates with MySQL.
5. The result is returned to the JSP view.

---

## 🔄 Application Workflow

### Buyer Workflow

**Registration → Login → Buyer Home → Browse/Search Products → Add to Cart → Cart → Checkout → Create Order → Update Stock → Clear Cart → Order Success**

### Seller Workflow

**Registration → Login → Seller Home → Add Product → View Products → Deactivate Product**

---

## 📁 Project Structure

The important source structure is:

```text
OnlineGroceryApp/
│
├── README.md
├── .gitignore
├── .classpath
├── .project
│
├── .settings/
│
└── src/
    └── main/
        ├── java/
        │   └── com/onlinegrocery/
        │       ├── controller/
        │       │   ├── AddProductServlet.java
        │       │   ├── AddToCartServlet.java
        │       │   ├── CheckoutServlet.java
        │       │   ├── DeleteProductServlet.java
        │       │   ├── LoginControllerServlet.java
        │       │   ├── RegistrationControllerServlet.java
        │       │   └── RemoveFromCartServlet.java
        │       │
        │       └── model/
        │           ├── CartModel.java
        │           ├── Product.java
        │           ├── ProductModel.java
        │           └── usermodel.java
        │
        └── webapp/
            ├── index.jsp
            ├── css/
            │   └── welcome.css
            │
            ├── jsp/
            │   ├── addProducts.jsp
            │   ├── buyerHome.jsp
            │   ├── cart.jsp
            │   ├── checkout.jsp
            │   ├── login.jsp
            │   ├── navbar.jsp
            │   ├── orderSuccess.jsp
            │   ├── registration.jsp
            │   └── sellerHome.jsp
            │
            ├── META-INF/
            │   └── MANIFEST.MF
            │
            └── WEB-INF/
                └── web.xml
```

> The Eclipse-generated `build/` directory and compiled `.class` files are intentionally excluded from Git.

---

## 🧩 Main Components

| Component | Responsibility |
|---|---|
| `LoginControllerServlet` | Authenticates users and redirects according to role |
| `RegistrationControllerServlet` | Handles Buyer/Seller registration |
| `AddProductServlet` | Adds products for sellers |
| `DeleteProductServlet` | Deactivates seller products |
| `AddToCartServlet` | Adds products to the buyer cart |
| `RemoveFromCartServlet` | Removes products from the cart |
| `CheckoutServlet` | Processes checkout, creates orders and updates stock |
| `ProductModel` | Product-related database operations |
| `CartModel` | Cart-related database operations |
| `usermodel` | User operations and JDBC connection |
| `Product` | Product model/entity |

---

## 🖥️ JSP Pages

| Page | Purpose |
|---|---|
| `index.jsp` | Application landing page |
| `login.jsp` | User login |
| `registration.jsp` | Buyer/Seller registration |
| `buyerHome.jsp` | Product browsing and search |
| `cart.jsp` | Shopping cart |
| `checkout.jsp` | Checkout |
| `orderSuccess.jsp` | Successful order confirmation |
| `sellerHome.jsp` | Seller dashboard |
| `addProducts.jsp` | Add product |
| `navbar.jsp` | Shared role-aware navigation |

---

## 🗄️ Database

The application uses MySQL with the database:

```text
onlinegroceryapp
```

The application works with these logical tables:

### `users`

Stores registered users.

**Fields used by the application:**
- `username`
- `email`
- `password`
- `role`

### `products`

Stores products listed by sellers.

**Fields used by the application:**
- `id`
- `name`
- `description`
- `quantity`
- `price`
- `seller_username`
- `is_active`

### `cart`

Stores products added to a buyer's cart.

**Fields used by the application:**
- `buyer`
- `product_id`
- `quantity`

### `orders`

Stores order records.

**Fields used by the application:**
- `buyer`
- `product_id`
- `quantity`
- `total`

> The current project source does not include a database export such as `schema.sql`. The MySQL database and required tables therefore need to be created separately.

---

## 🔌 MySQL Connector/J

The project was developed in Eclipse with **MySQL Connector/J 9.4.0 configured separately through the Eclipse Build Path**.

The JDBC driver is:

```text
mysql-connector-j-9.4.0.jar
```

### Add the driver in Eclipse

```text
Right-click Project
        ↓
Build Path
        ↓
Configure Build Path
        ↓
Libraries
        ↓
Add External JARs
        ↓
mysql-connector-j-9.4.0.jar
```

The application uses:

```java
com.mysql.cj.jdbc.Driver
```

and connects to:

```text
jdbc:mysql://localhost:3306/onlinegroceryapp
```

### What each component does

- **MySQL** → database server
- **MySQL Connector/J** → JDBC driver connecting Java to MySQL
- **Apache Tomcat** → Java web/application server

---

## ▶️ Run Locally

### Prerequisites

Install:

- JDK 21
- Eclipse IDE for Enterprise Java
- Apache Tomcat 9
- MySQL Server
- MySQL Connector/J 9.4.0

### 1. Clone the repository

```bash
git clone https://github.com/UniverseOfYograj/FreshMart-Online-Grocery.git
```

### 2. Import into Eclipse

Open Eclipse and import the project as an existing Eclipse project.

### 3. Configure Tomcat

Add Apache Tomcat 9 to Eclipse:

```text
Window
→ Preferences
→ Server
→ Runtime Environments
→ Add
→ Apache Tomcat v9.0
```

Then run:

```text
Right-click Project
→ Run As
→ Run on Server
```

### 4. Configure MySQL

Create the database:

```sql
CREATE DATABASE onlinegroceryapp;
```

Create the required tables using the fields documented in the **Database** section.

### 5. Configure local database credentials

Use your own local MySQL username and password.

**Never commit real database credentials to GitHub.**

---

## 🔐 Security Notes

This repository is intended as a **portfolio/learning project**, not a production deployment.

Before production use, the application should be improved with:

- BCrypt/Argon2 password hashing
- Externalized database configuration
- Environment variables or secure secrets management
- Proper authentication and authorization filters
- CSRF protection
- Stronger input validation
- XSS protection
- Database transactions for checkout
- Connection pooling
- Better error handling

> Real database passwords, API keys or other secrets should never be committed to the repository.

---

## 📌 Current Project Status

### Implemented

- [x] Buyer registration
- [x] Seller registration
- [x] Login
- [x] Role-based navigation
- [x] Product browsing
- [x] Product search
- [x] Seller product creation
- [x] Product deactivation
- [x] Shopping cart
- [x] Cart item removal
- [x] Checkout
- [x] Order creation
- [x] Inventory quantity update
- [x] Cart clearing after checkout
- [x] Order-success page
- [x] Tomcat deployment configuration

### Possible Future Improvements

- [ ] Password hashing
- [ ] Proper external configuration management
- [ ] Order history
- [ ] Seller order management
- [ ] Product categories and images
- [ ] Pagination and filtering
- [ ] Automated tests
- [ ] Connection pooling
- [ ] Spring Boot + Spring Data JPA migration
- [ ] REST APIs
- [ ] React frontend
- [ ] Docker
- [ ] CI/CD

---

## 💼 Portfolio Value

This project demonstrates practical experience with:

- Java web development
- Java Servlets
- JSP
- JDBC
- MySQL
- HTTP sessions
- Role-based workflows
- CRUD operations
- Shopping cart implementation
- Checkout and order processing
- Inventory management
- Apache Tomcat deployment

It also provides a foundation for migrating the application to a modern **Spring Boot + REST API + React** architecture.

---

## 👨‍💻 Author

**Yograj Tripathi**

Java • Spring Boot • React.js • MySQL • DSA • Backend Development

---

## 📄 License

This project is intended for educational, portfolio and demonstration purposes.
