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
    <title>Product List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .product-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            background-color: #fff;
        }
        .product-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }
        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .product-card-body {
            padding: 15px;
            text-align: center;
        }
        .product-card-title {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .product-card-price {
            color: #28a745;
            font-size: 1.1rem;
            margin-bottom: 15px;
        }
        .product-card button {
            margin: 5px;
        }
        .filter-bar {
            margin-bottom: 20px;
        }
        .filter-bar input {
            width: 100%;
            margin-bottom: 10px;
        }
        .navbar-brand {
            font-weight: bold;
        }
    </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Products</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Cart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Order</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container my-5">
    <h1 class="text-center mb-4"></h1>
    <!-- Filter and Sort Bar -->
    <div class="row filter-bar">
        <div class="col-md-4">
            <input type="text" id="searchInput" class="form-control" placeholder="Search by name">
        </div>
        <div class="col-md-4">
            <select id="categoryFilter" class="form-select">
                <option value="">All Categories</option>
                <option value="electronics">Electronics</option>
                <option value="fashion">Fashion</option>
                <option value="home">Home</option>
                <option value="beauty">Beauty</option>
                <option value="sports">Sports</option>
            </select>
        </div>
        <div class="col-md-4">
            <select id="priceSort" class="form-select">
                <option value="">Sort by Price</option>
                <option value="asc">Low to High</option>
                <option value="desc">High to Low</option>
            </select>
        </div>
    </div>

    <!-- Product Grid -->
    <div class="row g-4" id="productGrid">
        <!-- Product Cards -->
        <div class="col-md-4 col-sm-6 product" data-name="Product 1" data-category="electronics" data-price="29.99">
            <div class="product-card">
                <img src="product1.jpg" alt="Product 1">
                <div class="product-card-body">
                    <h5 class="product-card-title">Product 1</h5>
                    <p class="product-card-price">$29.99</p>
                    <button class="btn btn-primary">Add to Cart</button>
                    <button class="btn btn-outline-secondary">View Details</button>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 product" data-name="Product 2" data-category="fashion" data-price="39.99">
            <div class="product-card">
                <img src="product2.jpg" alt="Product 2">
                <div class="product-card-body">
                    <h5 class="product-card-title">Product 2</h5>
                    <p class="product-card-price">$39.99</p>
                    <button class="btn btn-primary">Add to Cart</button>
                    <button class="btn btn-outline-secondary">View Details</button>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-6 product" data-name="Product 3" data-category="home" data-price="49.99">
            <div class="product-card">
                <img src="product3.jpg" alt="Product 3">
                <div class="product-card-body">
                    <h5 class="product-card-title">Product 3</h5>
                    <p class="product-card-price">$49.99</p>
                    <button class="btn btn-primary">Add to Cart</button>
                    <button class="btn btn-outline-secondary">View Details</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    const searchInput = document.getElementById('searchInput');
    const categoryFilter = document.getElementById('categoryFilter');
    const priceSort = document.getElementById('priceSort');
    const productGrid = document.getElementById('productGrid');
    const products = Array.from(document.querySelectorAll('.product'));

    function filterProducts() {
        const searchTerm = searchInput.value.toLowerCase();
        const category = categoryFilter.value;
        const sortOrder = priceSort.value;

        let filteredProducts = products;

        // Filter by name
        if (searchTerm) {
            filteredProducts = filteredProducts.filter(product =>
                product.dataset.name.toLowerCase().includes(searchTerm)
            );
        }

        // Filter by category
        if (category) {
            filteredProducts = filteredProducts.filter(product =>
                product.dataset.category === category
            );
        }

        // Sort by price
        if (sortOrder) {
            filteredProducts.sort((a, b) => {
                const priceA = parseFloat(a.dataset.price);
                const priceB = parseFloat(b.dataset.price);
                return sortOrder === 'asc' ? priceA - priceB : priceB - priceA;
            });
        }

        // Update product grid
        productGrid.innerHTML = '';
        filteredProducts.forEach(product => productGrid.appendChild(product));
    }

    searchInput.addEventListener('input', filterProducts);
    categoryFilter.addEventListener('change', filterProducts);
    priceSort.addEventListener('change', filterProducts);
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
