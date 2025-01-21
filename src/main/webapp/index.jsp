<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 1/15/2025
  Time: 6:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Authentication</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <style>
    body {
      background : linear-gradient(to right, #4e54c8, #8f94fb);
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      color: #fff;
      padding: 20px;
    }
    .form-container {
      background-color: #fff;
      color: #333;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.3);
      max-width: 500px;
      width: 100%;
    }
    .form-container h1 {
      margin-bottom: 30px;
      font-size: 28px;
      font-weight: bold;
      text-align: center;
      color: #333;
    }
    .form-container .form-label {
      font-weight: 500;
    }
    .form-container a {
      color: #4e54c8;
    }
    .form-container a:hover {
      text-decoration: underline;
    }
    .form-container button {
      background : linear-gradient(to right, #4e54c8, #8f94fb);
      border: none;
      font-size: 16px;
      padding: 12px;
    }
    .form-container button:hover {
      background : linear-gradient(to right, #4e54c8, #8f94fb);
    }
  </style>
</head>
<body>
<div class="form-container">
  <h1>Login</h1>
<%--  Display the message from session --%>
  <c:if test="${not empty sessionScope.message}">
    <div class="alert alert-${sessionScope.alertType} mt-4" role="alert">
      <strong>${sessionScope.message}</strong>
    </div>
    <c:remove var="message"/>
    <c:remove var="alertType"/>
  </c:if>

  <form class="mt-4" method="POST" action="login">
    <div class="mb-4">
      <label for="username" class="form-label">Username</label>
      <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
    </div>
    <div class="mb-4">
      <label for="password" class="form-label">Password</label>
      <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
    </div>

    <button type="submit" class="btn btn-primary w-100">Login</button>
    <p class="mt-4 text-center">
      Don't have an account? <a href="registration.jsp">Register here</a>
    </p>
  </form>
</div>
</body>
</html>