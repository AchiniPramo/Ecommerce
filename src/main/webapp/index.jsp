<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
      background: #f9f9f9;
    }
    a {
      text-decoration: none;
      color: inherit;
    }

    /* Header */
    .dashboard-header {
      background: linear-gradient(to right, #4e54c8, #8f94fb);
      color: #fff;
      padding: 10px 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
    }
    .dashboard-header .logo {
      font-size: 24px;
      font-weight: bold;
    }
    .dashboard-header .nav-links {
      list-style: none;
      display: flex;
      flex-wrap: wrap;
      gap: 15px;
      padding: 0;
    }
    .dashboard-header .nav-links a {
      color: #fff;
      font-weight: 500;
    }

    /* Sidebar */
    .sidebar {
      background: #333;
      color: #fff;
      width: 250px;
      padding: 20px;
      display: flex;
      flex-direction: column;
      gap: 15px;
    }
    .sidebar .sidebar-links {
      list-style: none;
      padding: 0;
    }
    .sidebar .sidebar-links a {
      color: #bbb;
      display: block;
      padding: 10px 15px;
      border-radius: 8px;
      transition: all 0.3s;
    }
    .sidebar .sidebar-links a:hover {
      background: #444;
      color: #fff;
    }

    .main-content {
      flex: 1;
      padding: 20px;
    }
    .stats-overview {
      display: flex;
      gap: 20px;
      margin-bottom: 30px;
      justify-content: space-evenly;
      flex-wrap: wrap;
    }
    .stat-card {
      background: #fff;
      border-radius: 15px;
      box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
      padding: 20px;
      text-align: center;
      flex: 1;
      max-width: 200px;
    }
    .stat-card i {
      font-size: 30px;
      color: #4e54c8;
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

    /* Graph Section */
    .graphs {
      display: flex;
      gap: 20px;
      flex-wrap: wrap;
    }
    .graph-card {
      background: #fff;
      border-radius: 15px;
      box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
      padding: 20px;
      flex: 1;
      min-width: 300px;
    }
    .graph-card canvas {
      max-width: 100%;
    }

    /*!* Actions Table *!*/
    /*.product-table {*/
    /*  width: 100%;*/
    /*  border-collapse: collapse;*/
    /*  background: #fff;*/
    /*  box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);*/
    /*  border-radius: 15px;*/
    /*  overflow: hidden;*/
    /*}*/
    /*.product-table thead {*/
    /*  background: #4e54c8;*/
    /*  color: #fff;*/
    /*}*/
    /*.product-table th, .product-table td {*/
    /*  padding: 15px;*/
    /*  text-align: left;*/
    /*}*/
    /*.product-table tbody tr {*/
    /*  transition: background 0.3s;*/
    /*}*/
    /*.product-table tbody tr:hover {*/
    /*  background: #f4f4f4;*/
    /*}*/
    /*.edit-btn, .delete-btn {*/
    /*  border: none;*/
    /*  padding: 10px 15px;*/
    /*  border-radius: 5px;*/
    /*  cursor: pointer;*/
    /*}*/
    /*.edit-btn {*/
    /*  background: #4caf50;*/
    /*  color: #fff;*/
    /*}*/
    /*.delete-btn {*/
    /*  background: #f44336;*/
    /*  color: #fff;*/
    /*}*/

    .form-container {
      background-color: #fff;
      color: #333;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.3);
      max-width: 500px;
      width: 100%;
    }
    .form-container h1 {
      margin-bottom: 30px;
      font-size: 28px;
      font-weight: bold;
      text-align: center;
      color: #333;
    }
    .form-container .form-label {
      font-weight: 500;
    }
    .form-container a {
      color: #ff7e5f;
    }
    .form-container a:hover {
      text-decoration: underline;
    }
    .form-container button {
      background: linear-gradient(to right, #ff7e5f, #feb47b);
      border: none;
      font-size: 16px;
      padding: 12px;
    }
    .form-container button:hover {
      background: linear-gradient(to left, #ff7e5f, #feb47b);
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .dashboard-header {
        flex-direction: column;
        align-items: flex-start;
      }
      .stats-overview {
        flex-direction: column;
        align-items: center;
      }
      .graphs {
        flex-direction: column;
        gap: 20px;
      }
      .sidebar {
        display: none;
      }
    }
  </style>
</head>
<body>
<header class="dashboard-header">
  <div class="logo">Dashboard</div>
  <nav>
    <ul class="nav-links">
      <li><a href="#">Home</a></li>
      <li><a href="#products">Products</a></li>
      <li><a href="#categories">Categories</a></li>
      <li><a href="#orders">Orders</a></li>
      <li><a href="#users">Users</a></li>
      <li><a href="#settings">Settings</a></li>
      <li><a href="#" data-bs-toggle="modal" data-bs-target="#loginModal">Login</a></li>
      <li><a href="#" data-bs-toggle="modal" data-bs-target="#signUpModal">Sign Up</a></li>
      <li><a href="#logout">Logout</a></li>
    </ul>
  </nav>
</header>

<main class="main-content">
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

<%--  <section class="actions">--%>
<%--    <h3>Product Management</h3>--%>
<%--    <table class="product-table">--%>
<%--      <thead>--%>
<%--      <tr>--%>
<%--        <th>Product</th>--%>
<%--        <th>Category</th>--%>
<%--        <th>Price</th>--%>
<%--        <th>Actions</th>--%>
<%--      </tr>--%>
<%--      </thead>--%>
<%--      <tbody>--%>
<%--      <tr>--%>
<%--        <td>Product 1</td>--%>
<%--        <td>Electronics</td>--%>
<%--        <td>$50</td>--%>
<%--        <td><button class="edit-btn">Edit</button> <button class="delete-btn">Delete</button></td>--%>
<%--      </tr>--%>
<%--      <tr>--%>
<%--        <td>Product 2</td>--%>
<%--        <td>Fashion</td>--%>
<%--        <td>$30</td>--%>
<%--        <td><button class="edit-btn">Edit</button> <button class="delete-btn">Delete</button></td>--%>
<%--      </tr>--%>
<%--      </tbody>--%>
<%--    </table>--%>
<%--  </section>--%>
</main>

<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="loginModalLabel">Login</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form method="POST" action="login">
          <div class="mb-3">
<%--            <label for="role" class="form-label">Select Role</label>--%>
<%--            <select class="form-select" id="role" name="role" required>--%>
<%--              <option value="">-- Select Role --</option>--%>
<%--              <option value="admin">Admin</option>--%>
<%--              <option value="customer">Customer</option>--%>
<%--            </select>--%>
<%--          </div>--%>
          <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
          </div>
          <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Sign Up Modal -->
<div class="modal fade" id="signUpModal" tabindex="-1" aria-labelledby="signUpModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="signUpModalLabel">Sign Up</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form method="POST" action="signup">
          <div class="mb-3">
            <label for="signupRole" class="form-label">Select Role</label>
            <select class="form-select" id="signupRole" name="role" required>
              <option value="">-- Select Role --</option>
              <option value="admin">Admin</option>
              <option value="customer">Customer</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="signupUsername" class="form-label">Username</label>
            <input type="text" class="form-control" id="signupUsername" name="username" placeholder="Enter your username" required>
          </div>
          <div class="mb-3">
            <label for="signupEmail" class="form-label">Email</label>
            <input type="email" class="form-control" id="signupEmail" name="email" placeholder="Enter your email" required>
          </div>
          <div class="mb-3">
            <label for="signupPassword" class="form-label">Password</label>
            <input type="password" class="form-control" id="signupPassword" name="password" placeholder="Enter your password" required>
          </div>
          <div class="mb-3">
            <label for="confirmPassword" class="form-label">Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
          </div>
          <button type="submit" class="btn btn-success w-100">Sign Up</button>
        </form>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Example chart.js code to render the graphs
  const ctxSales = document.getElementById('salesTrends').getContext('2d');
  const salesChart = new Chart(ctxSales, {
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

  const ctxCategories = document.getElementById('topCategories').getContext('2d');
  const categoriesChart = new Chart(ctxCategories, {
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
