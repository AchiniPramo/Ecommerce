<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 1/21/2025
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
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
    <h1>FusionPay</h1>
    <ul>
        <li><a href="product_management.jsp">Product Management</a></li>
        <li><a href="category_management.jsp">Category Management</a></li>
        <li><a href="order_management.jsp">Order Management</a></li>
        <li><a href="user_management.jsp">User Management</a></li>
        <li><a href="index.jsp">Logout</a></li>
    </ul>
</div>

<!-- Main Content -->
<div class="main-content">
    <div class="card">
        <h3>Product Management</h3>
        <div style="text-align: left;">
            <button type="button" class="btn btn-primary btn-sm" style="width: auto;" data-bs-toggle="modal" data-bs-target="#productModal">
                Add Product
            </button>
        </div>
        <table>
            <thead>
            <tr>
                <th>Id</th>
                <th>Product Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody id="productTableBody">
            <!-- Product rows will be dynamically added here -->
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap Modal -->
<div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="productModalLabel">Add Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="productForm">
                    <div class="mb-3">
                        <label for="productName" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="productName" placeholder="Enter product name">
                    </div>
                    <div class="mb-3">
                        <label for="productCategory" class="form-label">Category</label>
                        <input type="text" class="form-control" id="productCategory" placeholder="Enter category">
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Price</label>
                        <input type="number" class="form-control" id="productPrice" placeholder="Enter price">
                    </div>
                    <div class="mb-3">
                        <label for="productStock" class="form-label">Stock</label>
                        <input type="number" class="form-control" id="productStock" placeholder="Enter stock quantity">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-success" onclick="saveProduct()">Save</button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const products = [];

    function saveProduct() {
        const productName = document.getElementById("productName").value.trim();
        const productCategory = document.getElementById("productCategory").value.trim();
        const productPrice = document.getElementById("productPrice").value.trim();
        const productStock = document.getElementById("productStock").value.trim();

        if (productName && productCategory && productPrice && productStock) {
            const newProduct = {
                id: products.length + 1,
                name: productName,
                category: productCategory,
                price: parseFloat(productPrice),
                stock: parseInt(productStock)
            };

            products.push(newProduct);
            addProductRow(newProduct);
            document.getElementById("productForm").reset();
            const modal = bootstrap.Modal.getInstance(document.getElementById("productModal"));
            modal.hide();
        } else {
            alert("Please fill in all fields.");
        }
    }

    function addProductRow(product) {
        const tableBody = document.getElementById("productTableBody");
        const row = document.createElement("tr");

        row.innerHTML = `
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.category}</td>
            <td>${product.price.toFixed(2)}</td>
            <td>${product.stock}</td>
            <td class="action-buttons">
                <button class="edit" onclick="editProduct(${product.id})">Edit</button>
                <button class="delete" onclick="deleteProduct(${product.id})">Delete</button>
            </td>
        `;

        tableBody.appendChild(row);
    }

    function deleteProduct(id) {
        const index = products.findIndex(product => product.id === id);
        if (index !== -1) {
            products.splice(index, 1);
            document.getElementById("productTableBody").deleteRow(index);
        }
    }
</script>
</body>
</html>
