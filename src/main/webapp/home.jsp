<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 1/17/2025
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - E-Commerce</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar a {
            color: white !important;
        }
        .hero-section {
            /*background: url('banner.jpg') no-repeat center center/cover;*/
            height: 60vh;
            color: white;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .hero-section h1 {
            font-size: 3rem;
            margin-bottom: 20px;
        }
        .category-card {
            border: none;
            text-align: center;
        }
        .category-card img {
            max-height: 100px;
            object-fit: cover;
        }
        footer {
            background-color: #343a40;
            color: white;
            padding: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">E-Shop</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Categories</a></li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search">
                <button class="btn btn-outline-light" type="submit">Search</button>
            </form>
            <a href="#" class="btn btn-outline-light ms-3">Cart</a>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<div class="hero-section">
    <h1>Welcome to E-Shop</h1>
    <p>Shop the best products at unbeatable prices.</p>
    <button class="btn btn-primary">Shop Now</button>
</div>

<!-- Categories -->
<div class="container my-5">
    <h2 class="text-center mb-4">Shop by Category</h2>
    <div class="row text-center">
        <div class="col-md-4">
            <div class="card category-card">
                <img src="electronics.jpg" class="card-img-top" alt="Electronics">
                <div class="card-body">
                    <h5 class="card-title">Electronics</h5>
                    <a href="#" class="btn btn-outline-primary">View Products</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card category-card">
                <img src="fashion.jpg" class="card-img-top" alt="Fashion">
                <div class="card-body">
                    <h5 class="card-title">Fashion</h5>
                    <a href="#" class="btn btn-outline-primary">View Products</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 E-Shop. All rights reserved.</p>
</footer>
</body>
</html>

