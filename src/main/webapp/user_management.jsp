<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 1/20/2025
  Time: 12:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="lk.ijse.ecommerce_assignment.dto.UserDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url("assets/retailpos.jpg");
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        /* Navbar */
        .navbar {
            background:#232f3e;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        .navbar h1 {
            margin: 0;
        }

        .navbar ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
        }

        .navbar ul li {
            padding: 10px 20px;
            cursor: pointer;
        }

        .navbar ul li a {
            text-decoration: none;
            color: white;
            font-weight: bold;
        }

        .navbar ul li:hover {
            background-color: #4d4f54;
        }

        h1 a{
            text-decoration: none;
            color: white;
            font-weight: bold;
        }

        .main-content {
            margin-top: 80px;
            padding: 20px;
        }

        .card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            background: #736b6b;
            color: #fff;
        }

        .card h3 {
            margin-top: 0;
        }

        .actions {
            margin-top: 15px;
        }

        .actions button {
            padding: 10px 15px;
            margin-right: 10px;
            border: none;
            border-radius: 3px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }

        .actions button:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 50px;
            background-color: #fff;
            color: #000;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        table th {
            background-color: #35363d;
            color: #fff;
        }

        .action-buttons button {
            padding: 5px 10px;
            margin-right: 5px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .action-buttons .edit {
            background-color: #28a745;
            color: #fff;
        }

        .action-buttons .edit:hover {
            background-color: #218838;
        }

        .action-buttons .delete {
            background-color: #dc3545;
            color: #fff;
        }

        .action-buttons .delete:hover {
            background-color: #c82333;
        }

        .action-buttons .activate {
            background-color: #28a745;
            color: #fff;
        }

        .action-buttons .activate:hover {
            background-color: #218838;
        }

        .action-buttons .deactivate {
            background-color: #dc3545;
            color: #fff;
        }

        .action-buttons .deactivate:hover {
            background-color: #c82333;
        }

        .modal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            padding: 20px;
            width: 400px;
            border-radius: 8px;
        }

        .modal-header {
            font-size: 18px;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .modal-content input,
        .modal-content textarea {
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .modal-footer button {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .modal-footer .cancel-btn {
            background-color: #dc3545;
            color: white;
        }

        .modal-footer .save-btn {
            background-color: #28a745;
            color: white;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        .show {
            display: block;
        }

        /* Notification Styling */
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
<!-- Navbar -->
<div class="navbar">
    <h1><a href="dashboard.jsp">FusionPay</a></h1>
    <ul>
        <li><a href="product-manage">Product Management</a></li>
        <li><a href="category-manage">Category Management</a></li>
        <li><a href="order-manage">Order Management</a></li>
        <li><a href="user-manage">User Management</a></li>
        <li><a href="index.jsp">Logout</a></li>
    </ul>
</div>

<!-- Notification Section -->
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

<!-- User Management Section -->
<div class="main-content">
    <div class="card">
        <h3>User Management</h3>
        <table>
            <thead>
            <tr>
                <th>UserId</th>
                <th>User Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<UserDTO> users = (List<UserDTO>) request.getAttribute("users");
                if (users != null && !users.isEmpty()) {
                    for (UserDTO user : users) {
            %>
            <tr>
                <td><%= user.getUserId() %></td>
                <td><%= user.getUsername() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getRole() %></td>
                <td><%= user.getStatus() %></td>
                <td class="action-buttons">
                    <% if ("Active".equalsIgnoreCase(user.getStatus())) { %>
                    <button class="deactivate"
                            onclick="window.location.href='user-manage?action=toggleStatus&username=<%= user.getUsername() %>'">
                        Deactivate
                    </button>
                    <% } else { %>
                    <button class="activate"
                            onclick="window.location.href='user-manage?action=toggleStatus&username=<%= user.getUsername() %>'">
                        Activate
                    </button>
                    <% } %>
                </td>
            </tr>
            <% }
            } else {
            %>
            <tr>
                <td colspan="6">No users found.</td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<script>
    setTimeout(function () {
        const notification = document.querySelector('.notification');
        if (notification) {
            notification.style.display = 'none';
        }
    }, 5000);  // Hide the notification after 5 seconds
</script>
</body>
</html>
