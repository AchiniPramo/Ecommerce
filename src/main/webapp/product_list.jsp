<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* General body styling */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #ffffff; /* Dark background */
            color: #ffffff; /* White text */
        }

        /* Header styles */
        .header {
            background-color: #232f3e; /* Amazon-inspired header */
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
            color: #ff9900; /* Gold accent */
        }

        /* Product grid styling */
        .product-card {
            border: 1px solid #333333;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            background-color: #2c2c2c; /* Slightly lighter background for cards */
        }

        .product-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgb(123, 124, 154);
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
            color: #ff9900; /* Gold accent for titles */
        }

        .product-card-price {
            color: #28a745; /* Green price */
            font-size: 1.1rem;
            margin-bottom: 15px;
        }

        .product-card button {
            margin: 5px;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #ff9900;
            border: none;
        }

        .btn-primary:hover {
            background-color: #e68a00;
        }

        .btn-outline-secondary {
            border-color: #ff9900;
            color: #ff9900;
        }

        .btn-outline-secondary:hover {
            background-color: #ff9900;
            color: #7b7c9a;
        }

        /* Filter bar styling */
        .filter-bar {
            margin-bottom: 20px;
            color: #ffffff;
        }

        .filter-bar input,
        .filter-bar select {
            border: 1px solid #6a7073;
            background-color: #6a7073;
            color: #ffffff;
            border-radius: 5px;
        }

        /* Footer styling */
        footer {
            text-align: center;
            padding: 10px 0;
            background-color: #232f3e;
            color: #ffffff;
            margin-top: 150px;
        }

        footer a {
            color: #ff9900;
            text-decoration: none;
            margin: 0 5px;
        }

        footer a:hover {
            text-decoration: underline;
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

<div class="container my-5">
    <h1 class="text-center mb-4">Product List</h1>
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
