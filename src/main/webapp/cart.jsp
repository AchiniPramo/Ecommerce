<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 1/13/2025
  Time: 8:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #ffffff; /* White background */
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

        /* Cart container styling */
        .cart-container {
            max-width: 1000px;
            margin: 50px auto;
            background-color: #726f6f; /* Slightly lighter background for the cart */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(255, 255, 255, 0.3);
        }

        .cart-title {
            font-size: 1.8rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
            color: #ff9900; /* Gold accent */
        }

        .cart-table {
            color: #ffffff;
            width: 100%;
        }

        .cart-table th, .cart-table td {
            text-align: center;
            padding: 10px;
        }

        .cart-table th {
            background-color: #9f9696;
        }

        .cart-table td {
            background-color: #9f9696;
        }

        .cart-table input[type="number"] {
            width: 80px;
            text-align: center;
            border: 1px solid #6a7073;
            border-radius: 5px;
            background-color: #6a7073;
            color: #ffffff;
        }

        .btn-primary {
            background-color: #ff9900;
            border: none;
            border-radius: 5px;
        }

        .btn-primary:hover {
            background-color: #e68a00;
        }

        .btn-danger {
            background-color: #dc3545;
            border-radius: 5px;
        }

        /* Footer styling */
        footer {
            text-align: center;
            padding: 10px 0;
            background-color: #232f3e;
            color: #ffffff;
            margin-top: 110px;
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

<!-- Cart Container -->
<div class="cart-container">
    <h2 class="cart-title">Shopping Cart</h2>
    <form action="cart-update" method="post">
        <table class="cart-table table table-bordered">
            <thead>
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Product 1</td>
                <td>$29.99</td>
                <td>
                    <input type="number" name="quantity[1]" value="1" min="1">
                </td>
                <td>$29.99</td>
                <td>
                    <button type="submit" name="action" value="remove-1" class="btn btn-danger btn-sm">Remove</button>
                </td>
            </tr>
            <tr>
                <td>Product 2</td>
                <td>$39.99</td>
                <td>
                    <input type="number" name="quantity[2]" value="2" min="1">
                </td>
                <td>$79.98</td>
                <td>
                    <button type="submit" name="action" value="remove-2" class="btn btn-danger btn-sm">Remove</button>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="text-end mt-3">
            <strong>Total: $109.97</strong>
        </div>
        <div class="text-end mt-3">
            <button type="submit" name="action" value="checkout" class="btn btn-primary">Checkout</button>
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
