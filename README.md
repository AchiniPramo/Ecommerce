# 🌟 E-Commerce Web Application

Welcome to the **E-Commerce Web Application**, a feature-rich online shopping platform where customers can browse products, add items to their cart, and complete purchases seamlessly. This project showcases a professional e-commerce solution with a well-structured backend and an intuitive user interface.

---
## 🔑 User Roles and Permissions

👤 Customer
- Access URL:  http://localhost:8080/Ecommerce_Assignment_war_exploded
- Features:
- User authentication (signup, login, logout)
- Browse products by category, search by name, or sort by price
- Manage shopping cart and checkout
- View order history
- Update profile details and password

👨‍💼 Admin
- Access URL: http://localhost:8080/Ecommerce_Assignment_war_exploded/admin.jsp
- Features:
- Register customers and admins
- Manage products, categories, and orders
- Activate or deactivate customer accounts

## 🚀 Project Overview  

This application is a complete **E-Commerce system** built to demonstrate modern development practices, clean design, and scalable architecture.  

### **Key Features**  
- 👤 **User Authentication**: Secure login with hashed passwords.  
- 🛍️ **Product Listings**: View products categorized for easy browsing.  
- 🛒 **Shopping Cart**: Add, update, or remove products in the cart.  
- 💳 **Order Management**: Place orders and track order history.  
- ⚙️ **Admin Management**: Role-based access for managing products and categories.  

---

## 📸 Screenshots  

### **Login Form**  
![image-alt](https://github.com/AchiniPramo/Ecommerce/blob/e3fc43e883efa6522a30bbd1b0beaa8d48d49583/Login1.PNG)

### **Register Form**   
![image-alt](https://github.com/AchiniPramo/Ecommerce/blob/2d6789206c7ae5ef8f5ee76596f9292ad0f158a5/Register1.PNG)  

### **Adming Form**   
Admin can Product management(add,delete,update and view product), Category management(add,delete,update and view category), View orders and User managment(view all users and activate, deactivate users).

![image-alt](https://github.com/AchiniPramo/Ecommerce/blob/f7197fce7042b88617221419a7c10c60eed2654c/Capture4.PNG)

![image-alt](https://github.com/AchiniPramo/Ecommerce/blob/ecd604d971a94e7d51a4ff6c6fa6393855fecfc4/UserManagement1.PNG)

![image-alt](https://github.com/AchiniPramo/Ecommerce/blob/ecd604d971a94e7d51a4ff6c6fa6393855fecfc4/CategoryManagement.PNG)

### **Product List**  
![image-alt](https://github.com/AchiniPramo/Ecommerce/blob/87225c71063001c4b5da80680dda5eb1766c1cd0/productList.PNG)

### **Shopping Cart**  
 A dynamic cart to manage selected products.

![image-alt](https://github.com/AchiniPramo/Ecommerce/blob/3d60310fcc2db0a0104d6402244bb446879e90af/ShopingCart.PNG)  

### **Place Order**  
![image-alt](https://github.com/AchiniPramo/Ecommerce/blob/0d4200ed9096c6692c5f903cd3862ed656406613/PlaceOrder.PNG).

### **Profile Manage** 
![image-alt](https://github.com/AchiniPramo/Ecommerce/blob/0e60277b1a5105af50ae8a17f53940cce9b30a2a/ProfileManage.PNG).

---

## 🎥 Video Demonstration  

[Click here to watch the demo on YouTube!](https://youtu.be/tNaiAbQ-0lM?si=fbkxnwc18jNsgLKm)  

This video walkthrough highlights:  
1. User registration and login.  
2. Browsing categories and products.  
3. Adding items to the cart and checking out.  
4. Admin features for managing products.  

---

## 🛠️ Technologies Used  

- **Frontend**: HTML5, CSS3, Bootstrap  
- **Backend**: Java, Servlets, JDBC  
- **Database**: MySQL  
- **Security**: BCrypt for password hashing  
- **Tools**: IntelliJ IDEA, Apache Tomcat  

---

## 🗂️ Project Structure  

```
Ecommerce_Assignment/
├── src/
│   ├── lk.ijse.ecommerce_assignment/
│   │   ├── LoginServlet.java
│   │   ├── CartServlet.java
│   │   └── ...
├── web/
│   ├── index.jsp
│   ├── product-list.jsp
│   └── ...
├── resources/
│   ├── schema.sql
│   └── ...
├── README.md
└── ...
```

---

## 📝 Installation and Setup  

1. Clone the repository:  
   ```bash
   https://github.com/AchiniPramo/Ecommerce.git
   ```

2. Import the project into your IDE (e.g., IntelliJ IDEA).  

3. Set up the database:  
   - Import the provided `schema.sql` file into MySQL.  

4. Configure the `DataSource` in your project:  
   Update the database credentials in your code (e.g., `web.xml` or `context.xml`).  

5. Deploy the project:  
   - Use Apache Tomcat to deploy the application.  

6. Run the application and visit:  
   ```
   http://localhost:8080/Ecommerce_Assignment_war_exploded
   ```
---

## 📬 Contact  

Have questions or suggestions? Feel free to reach out:  
- **Email**: achinipramodhya4@gmail.com  
- **GitHub**: [AchiniPramo](https://github.com/AchiniPramo)  

---
