<%--
 Created by IntelliJ IDEA.
User: user Date: 1/20/2025
Time: 12:42 PM
--%>
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

        .btn-primary.btn-sm {
            padding: 5px 10px;
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
    </ul>
</div>

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
                <th>Id</th>
                <th>Category Name</th>
                <th>Description</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>Electronics</td>
                <td>Devices, gadgets, and accessories</td>
                <td class="action-buttons">
                    <button class="edit" onclick="alert('Edit Category 1')">Edit</button>
                    <button class="delete" onclick="alert('Delete Category 1')">Delete</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap Modal -->
<div class="modal fade" id="categoryModal" tabindex="-1" aria-labelledby="categoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="categoryModalLabel">Add Category</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="categoryForm">
                    <div class="mb-3">
                        <label for="categoryName" class="form-label">Category Name</label>
                        <input type="text" class="form-control" id="categoryName" placeholder="Enter category name">
                    </div>
                    <div class="mb-3">
                        <label for="categoryDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="categoryDescription" rows="3" placeholder="Enter description"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-success" onclick="saveCategory()">Save</button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function saveCategory() {
        const categoryName = document.getElementById("categoryName").value.trim();
        const categoryDescription = document.getElementById("categoryDescription").value.trim();

        if (categoryName && categoryDescription) {
            alert("Category added successfully!");
            document.getElementById("categoryForm").reset();
            const modal = bootstrap.Modal.getInstance(document.getElementById("categoryModal"));
            modal.hide();
        } else {
            alert("Please fill in all fields.");
        }
    }
</script>
</body>
</html>
