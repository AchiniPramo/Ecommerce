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
    </style>
</head>
<body>
<div class="container my-5">
    <h1 class="text-center mb-4">Product List</h1>

    <!-- Filter and Sort Bar -->
    <div class="row filter-bar">
        <div class="col-md-6">
            <select class="form-select">
                <option value="">Sort by</option>
                <option value="price_asc">Price: Low to High</option>
                <option value="price_desc">Price: High to Low</option>
                <option value="popular">Most Popular</option>
            </select>
        </div>
        <div class="col-md-6 text-end">
            <button class="btn btn-outline-primary">Filter</button>
        </div>
    </div>

    <!-- Product Grid -->
    <div class="row g-4">
        <!-- Product Card -->
        <div class="col-md-4 col-sm-6">
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

        <!-- Duplicate this block for more products -->
        <div class="col-md-4 col-sm-6">
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

        <div class="col-md-4 col-sm-6">
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
</body>
</html>
