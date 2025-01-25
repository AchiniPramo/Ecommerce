<%--
 Created by IntelliJ IDEA.
User: user Date: 1/20/2025
Time: 12:42 PM
--%>
<%@ page import="lk.ijse.ecommerce_assignment.dto.CategoryDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management</title>
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

        .btn-primary.btn-sm {
            padding: 5px 10px;
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


<!-- Main Content -->
<div class="main-content">
    <div class="card">
        <h3>Category Management</h3>
        <div style="text-align: left;">
            <button type="button" class="btn btn-primary btn-sm" style="width: auto;" data-bs-toggle="modal" data-bs-target="#categoryModal">
                Add Category
            </button>
        </div>
        <table>
            <thead>
            <tr>
                <th>Category Name</th>
                <th>Description</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<lk.ijse.ecommerce_assignment.dto.CategoryDTO> categories =
                        (List<lk.ijse.ecommerce_assignment.dto.CategoryDTO>) request.getAttribute("categories");
                if (categories != null) {
                    for (lk.ijse.ecommerce_assignment.dto.CategoryDTO category : categories) {
            %>
            <tr>
                <td><%= category.getName() %></td>
                <td><%= category.getDescription() %></td>
                <td class="action-buttons">
                    <button class="btn btn-success btn-sm"
                            onclick="editCategory('<%= category.getId() %>', '<%= category.getName() %>', '<%= category.getDescription() %>')">Edit</button>
                    <form style="display:inline;" method="post" action="category-manage">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= category.getId() %>">
                        <button class="btn btn-danger btn-sm">Delete</button>
                    </form>
                </td>
            </tr>
            <%      }
            }
            %>
            </tbody>
        </table>
    </div>
</div>

<div class="modal fade" id="categoryModal" tabindex="-1" aria-labelledby="categoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="post" action="category-manage">
                <div class="modal-header">
                    <h5 class="modal-title" id="categoryModalLabel">Add/Edit Category</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="action" id="action" value="add">
                    <input type="hidden" name="id" id="categoryId">
                    <div class="mb-3">
                        <label for="categoryName" class="form-label">Category Name</label>
                        <input type="text" class="form-control" id="categoryName" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="categoryDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="categoryDescription" name="description" rows="3" required></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-success">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function editCategory(id, name, description) {
        document.getElementById('action').value = 'edit';
        document.getElementById('categoryId').value = id;
        document.getElementById('categoryName').value = name;
        document.getElementById('categoryDescription').value = description;
        new bootstrap.Modal(document.getElementById('categoryModal')).show();
    }
</script>
<script>
    setTimeout(function () {
        const notification = document.querySelector('.notification');
        if (notification) {
            notification.style.display = 'none';
        }
    }, 5000);
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
