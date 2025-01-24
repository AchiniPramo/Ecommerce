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
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            color: #ffffff;
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

<!-- Main Content -->
<main>
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
