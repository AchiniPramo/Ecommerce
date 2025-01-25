<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 1/24/2025
  Time: 11:38 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Profile Management</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <style>
    /* General body styling */
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      background-color: #ffffff;
      color: #ffffff; /* White text for contrast */
    }

    /* Header styles */
    .header {
      background-color: #232f3e; /* Amazon-inspired header color */
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
      color: #ff9900; /* Amazon gold accent */
    }

    /* Form container */
    .profile-container {
      max-width: 500px;
      height: 450px;
      margin: 20px auto;
      background-color: #595252; /* Dark gray for contrast */
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    }

    .profile-container h1 {
      text-align: center;
      color: #ff9900; /* Amazon accent */
    }

    .profile-container label {
      display: block;
      font-weight: bold;
      margin-top: 10px;
    }

    .profile-container input[type="text"],
    .profile-container input[type="email"],
    .profile-container input[type="password"] {
      width: 100%;
      padding: 10px;
      margin: 10px -10px 10px;
      border: 1px solid #333333;
      border-radius: 5px;
      background-color: #817171;
      color: #ffffff;
    }

    .profile-container input[type="submit"] {
      width: 100%;
      padding: 12px;
      background-color: #ff9900;
      border: none;
      border-radius: 5px;
      color: #463d3d;
      font-size: 16px;
      cursor: pointer;
    }

    .profile-container input[type="submit"]:hover {
      background-color: #e68a00;
    }

    /* Footer styling */
    footer {
      text-align: center;
      padding: 5px 0;
      background-color: #232f3e;
      color: #ffffff;
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

<!-- Profile Management Form -->
<div class="profile-container">
  <h1>Profile Management</h1>
  <form action="profile-manage" method="post">
    <label for="name">Full Name</label>
    <input type="text" id="name" name="name" placeholder="Enter Name" required>

    <label for="email">Email</label>
    <input type="email" id="email" name="email" placeholder="Enter Email" required>

    <label for="password">Password</label>
    <input type="password" id="password" name="password" placeholder="Enter new password">

    <label for="confirm-password">Confirm Password</label>
    <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm new password">

    <input type="submit" value="Update Profile">
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
