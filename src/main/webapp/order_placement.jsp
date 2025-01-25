<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 1/24/2025
  Time: 11:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Placement</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* General body styling */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #ffffff; /* Light background */
            color: #ffffff; /* White text */
        }

        /* Header styles */
        .header {
            background-color: #232f3e; /* Amazon-inspired header */
            padding: 10px 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header a {
            color: #ffffff;
            text-decoration: none;
            font-size: 16px;
            margin: 0 10px;
        }

        .header a:hover {
            color: #ff9900; /* Gold accent */
        }

        /* Order container styling */
        .order-container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #726f6f; /* Slightly lighter background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(94, 83, 83, 0.3);
        }

        .order-title {
            font-size: 1.8rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            color: #ff9900;
        }

        .list-group-item {
            background-color:  #9f9696;
            color: #ffffff;
            border: none;
            margin-bottom: 10px;
        }

        .list-group-item:last-child {
            margin-bottom: 0;
        }

        .btn-primary {
            background-color: #ff9900;
            border: none;
            border-radius: 5px;
        }

        .btn-primary:hover {
            background-color: #e68a00;
        }

        /* Footer styling */
        footer {
            text-align: center;
            padding: 10px 0;
            background-color: #232f3e;
            color: #ffffff;
            margin-top: 170px;
        }

        footer a {
            color: #ff9900;
            text-decoration: none;
            margin: 0 5px;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<!-- Header -->
<div class="header">
    <a href="#" class="logo"><strong>FusionPay</strong></a>
    <nav>
        <a href="product_list.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
        <a href="order_placement.jsp">Orders</a>
        <a href="profile_manage.jsp">Profile</a>
        <a href="index.jsp" class="logout">Logout</a>
    </nav>
</div>

<!-- Order Container -->
<div class="order-container">
    <h2 class="order-title">Order Summary</h2>
    <form action="order-submit" method="post">
        <ul class="list-group">
            <li class="list-group-item">Product 1 - $29.99 x 1</li>
            <li class="list-group-item">Product 2 - $39.99 x 2</li>
        </ul>
        <div class="text-end mt-3">
            <strong>Total: $109.97</strong>
        </div>
        <div class="text-end mt-3">
            <button type="submit" class="btn btn-primary">Place Order</button>
        </div>
    </form>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 E-Commerce Store. All Rights Reserved.</p>
    <p>Follow us on
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
    </p>
</footer>
</body>
</html>
