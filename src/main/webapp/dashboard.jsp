<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
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
            background: #232f3e;
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

        /* Stats overview cards */
        .stats-overview {
            display: flex;
            gap: 20px;
            margin: 20px auto;
            justify-content: space-around;
            flex-wrap: wrap;
            max-width: 1200px;
        }

        .stat-card {
            background-color: #645959;
            border: 1px solid #645959;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            flex: 1;
            min-width: 200px;
            max-width: 250px;
            color: #ffffff;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .stat-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(123, 124, 154, 0.5);
        }

        .stat-card i {
            font-size: 30px;
            color: #ff9900;
        }

        .stat-card h3 {
            margin: 15px 0 10px;
            font-size: 18px;
        }

        .stat-card p {
            font-size: 24px;
            font-weight: bold;
            margin: 0;
        }

        /* Graph section */
        .graphs {
            display: flex;
            gap: 20px;
            margin: 20px auto;
            flex-wrap: wrap;
            max-width: 1200px;
        }

        .graph-card {
            background-color: #2c2c2c;
            border: 1px solid #5d5454;
            border-radius: 10px;
            padding: 20px;
            flex: 1;
            min-width: 300px;
            color: #ffffff;
        }

        .graph-card h3 {
            font-size: 1.2rem;
            margin-bottom: 20px;
            color: #ff9900;
        }

        .graph-card canvas {
            max-width: 100%;
        }

        /* Footer styling */
        footer {
            text-align: center;
            padding: 10px 0;
            background-color: #232f3e;
            color: #ffffff;
            margin-top: 50px;
        }

        footer a {
            color: #ff9900;
            text-decoration: none;
            margin: 0 5px;
        }

        footer a:hover {
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .stats-overview,
            .graphs {
                flex-direction: column;
                align-items: center;
            }
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

<!-- Main Content -->
<main class="main-content">
    <!-- Stats Overview -->
    <section class="stats-overview">
        <div class="stat-card">
            <i class="fa fa-box-open"></i>
            <h3>Total Products</h3>
            <p>120</p>
        </div>
        <div class="stat-card">
            <i class="fa fa-shopping-cart"></i>
            <h3>Total Orders</h3>
            <p>350</p>
        </div>
        <div class="stat-card">
            <i class="fa fa-users"></i>
            <h3>Active Users</h3>
            <p>450</p>
        </div>
        <div class="stat-card">
            <i class="fa fa-clock"></i>
            <h3>Pending Orders</h3>
            <p>25</p>
        </div>
    </section>

    <!-- Graphs -->
    <section class="graphs">
        <div class="graph-card">
            <h3>Monthly Sales Trends</h3>
            <canvas id="salesTrends"></canvas>
        </div>
        <div class="graph-card">
            <h3>Top Categories</h3>
            <canvas id="topCategories"></canvas>
        </div>
    </section>
</main>

<!-- Footer -->
<footer>
    <p>&copy; 2025 E-Commerce Store. All Rights Reserved.</p>
    <p>Follow us on
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
    </p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Chart.js for Sales Trends
    const ctxSales = document.getElementById('salesTrends').getContext('2d');
    new Chart(ctxSales, {
        type: 'line',
        data: {
            labels: ['January', 'February', 'March', 'April', 'May', 'June'],
            datasets: [{
                label: 'Sales',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: 'rgba(78, 84, 200, 0.2)',
                borderColor: 'rgba(78, 84, 200, 1)',
                borderWidth: 2
            }]
        },
        options: {
            responsive: true
        }
    });

    // Chart.js for Top Categories
    const ctxCategories = document.getElementById('topCategories').getContext('2d');
    new Chart(ctxCategories, {
        type: 'bar',
        data: {
            labels: ['Electronics', 'Fashion', 'Home', 'Beauty', 'Sports'],
            datasets: [{
                label: 'Top Categories',
                data: [15, 20, 10, 8, 5],
                backgroundColor: ['#4e54c8', '#8f94fb', '#ff758c', '#ff7eb3', '#f4c4f3']
            }]
        },
        options: {
            responsive: true
        }
    });
</script>
</body>
</html>
