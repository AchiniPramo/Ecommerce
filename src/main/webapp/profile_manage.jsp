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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      background-color: #ffffff;
      color: #ffffff;
    }

    .header {
      background-color: #232f3e;
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
      color: #ff9900;
    }

    .profile-container {
      max-width: 500px;
      height: 460px;
      margin: 20px auto;
      background-color: #3f3a3a;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    }

    .profile-container h1 {
      text-align: center;
      color: #ff9900;
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

    footer {
      text-align: center;
      padding: 5px 0;
      background-color: #232f3e;
      color: #ffffff;
      margin-top: 50px;
    }

    footer a {
      color: #ff9900;
      text-decoration: none;
      margin: 0 5px;
    }

    footer a:hover {
      text-decoration: underline;
    }

    .notification {
      position: fixed;
      top: 70px;
      left: 50%;
      transform: translateX(-50%);
      padding: 10px;
      margin-top: 20px;
      border-radius: 5px;
      color: white;
      font-weight: bold;
      text-align: center;
      z-index: 1000;
      width: auto;
      min-width: 300px;
      text-align: center;
    }

    .success {
      background-color: #28a745;
    }

    .error {
      background-color: #dc3545;
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

<%
  String message = (String) session.getAttribute("message");
  String messageType = (String) session.getAttribute("messageType");
  if (message != null && !message.isEmpty()) {
%>
<div class="notification <%= messageType != null ? messageType : "success" %>">
  <%= message %>
</div>
<% session.removeAttribute("message"); %>
<% session.removeAttribute("messageType"); %>
<% } %>

<%
  lk.ijse.ecommerce_assignment.dto.UserDTO user = (lk.ijse.ecommerce_assignment.dto.UserDTO) session.getAttribute("user");
  if (user == null) {
%>
<!-- If user is null, redirect to login or show an error -->
<p>Session expired. Please <a href="index.jsp">log in</a>.</p>
<%
} else {
%>

<!-- Profile Management Form -->
<div class="profile-container">
  <h1>Profile Management</h1>
  <form action="profile" method="post">
    <div class="mb-3">
      <label for="profile-name" class="form-label">Full Name</label>
      <input type="text" class="form-control" id="profile-name" name="name" value="<%= user.getUsername() %>"
             required>
    </div>
    <div class="mb-3">
      <label for="profile-email" class="form-label">Email</label>
      <input type="email" class="form-control" id="profile-email" name="email" value="<%= user.getEmail() %>"
             required>
    </div>
    <div class="mb-3">
      <label for="profile-password" class="form-label">Password</label>
      <input type="password" class="form-control" id="profile-password" name="password" required>
    </div>
    <div class="mb-3">
      <label for="confirm-password" class="form-label">Confirm Password</label>
      <input type="password" class="form-control" id="confirm-password" name="confirmPassword" required>
    </div>
    <button type="submit" class="btn btn-success">Update Profile</button>
  </form>
  <%
    }
  %>
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
<script>
  setTimeout(function () {
    const notification = document.querySelector('.notification');
    if (notification) {
      notification.style.display = 'none';
    }
  }, 5000);
</script>
</body>
</html>