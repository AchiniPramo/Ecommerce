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
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #f4f4f4, #eaeaea);
            color: #333333;
        }

        .header {
            background-color: #232f3e;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header a {
            color: #ffffff;
            text-decoration: none;
            font-size: 16px;
            margin: 0 15px;
        }

        .header a:hover {
            color: #ff9900;
        }

        .order-container {
            max-width: 700px;
            margin: 50px auto;
            background: #695f5f;
            border-radius: 12px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.15);
            padding: 20px 30px;
        }

        .order-title {
            font-size: 1.8rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 25px;
            color: #ff9900;
        }

        .list-group-item {
            background-color: #f9f9f9;
            color: #333333;
            border: none;
            border-radius: 8px;
            margin-bottom: 10px;
            padding: 15px 20px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .list-group-item:last-child {
            margin-bottom: 0;
        }

        .list-group-item span {
            font-weight: bold;
            color: #ff9900;
        }

        .total-container {
            text-align: right;
            font-size: 1.2rem;
            font-weight: bold;
            margin-top: 20px;
            color: #333333;
        }

        .btn-primary {
            background: linear-gradient(to right, #ff9900, #e68a00);
            border: none;
            border-radius: 8px;
            padding: 12px 20px;
            font-size: 16px;
            color: #ffffff;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(to left, #ff9900, #e68a00);
            transform: translateY(-2px);
        }

        footer {
            text-align: center;
            padding: 10px 0;
            background-color: #232f3e;
            color: #ffffff;
            margin-top: 120px;
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
<div class="header">
    <a href="#" class="logo"><strong>FusionPay</strong></a>
    <nav>
        <a href="products">Products</a>
        <a href="cart.jsp">Cart</a>
        <a href="order_placement.jsp">Orders</a>
        <a href="profile_manage.jsp">Profile</a>
        <a href="index.jsp" class="logout">Logout</a>
    </nav>
</div>

<!-- Order Container -->
<div class="order-container">
    <h2 class="order-title">Order Summary</h2>
    <form action="placeOrder" method="post">
        <ul class="list-group">
            <li class="list-group-item">
                SmartPhone
                <span>Rs. 50000.00 x 1</span>
            </li>
            <li class="list-group-item">
                Oven
                <span>Rs. 5500.00 x 2</span>
            </li>
        </ul>
        <div class="total-container">
            Total: Rs. 61000.00
        </div>
        <div class="text-end mt-4">
            <button type="submit" class="btn btn-primary">Place Order</button>
        </div>
    </form>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 FusionPay. All Rights Reserved.</p>
    <p>Follow us on
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
    </p>
</footer>
</body>
</html>
