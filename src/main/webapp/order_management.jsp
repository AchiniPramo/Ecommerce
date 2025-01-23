<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 1/20/2025
  Time: 9:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Management</title>
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
            background: linear-gradient(to right, #4e54c8, #8f94fb);
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
            background-color: #2347bd;
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
            background: #b1b2d5;
            color: #fff;
        }

        .card h3 {
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            color: #000;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        table th {
            background-color: #7b7c9a;
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
    </style>
</head>
<body>
<!-- Navbar -->
<div class="navbar">
    <h1>Admin Dashboard</h1>
    <ul>
        <li><a href="product_management.jsp">Product Management</a></li>
        <li><a href="category_management.jsp">Category Management</a></li>
        <li><a href="order_management.jsp">Order Management</a></li>
        <li><a href="user-manage">User Management</a></li>
        <li><a href="index.jsp">Logout</a></li>
    </ul>
</div>

<!-- Main Content -->
<div class="main-content">
    <div class="card">
        <h1>FusionPay</h1>
        <table>
            <thead>
            <tr>
                <th>OrderId</th>
                <th>Customer</th>
                <th>Order Date</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>101</td>
                <td>John Doe</td>
                <td>2025-01-10</td>
                <td>Pending</td>
                <td class="action-buttons">
                    <button class="edit" onclick="alert('Edit Order 101')">Edit</button>
                    <button class="delete" onclick="alert('Delete Order 101')">Delete</button>
                </td>
            </tr>
            <tr>
                <td>102</td>
                <td>Jane Smith</td>
                <td>2025-01-12</td>
                <td>Completed</td>
                <td class="action-buttons">
                    <button class="edit" onclick="alert('Edit Order 102')">Edit</button>
                    <button class="delete" onclick="alert('Delete Order 102')">Delete</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
