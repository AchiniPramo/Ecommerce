<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.ecommerce_assignment.dto.CategoryDTO" %>
<%@ page import="lk.ijse.ecommerce_assignment.dto.ProductDTO" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Browsing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <style>
        /* Ensure the body takes full height and makes footer stick to bottom */
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        body {
            background-color: #f9f9f9;
            color: #333;
            font-family: 'Arial', sans-serif;
        }

        .header {
            background-color: #232f3e;
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
            color: #ff9900;
        }


        .btn-primary {
            background-color:  #ff9900;
            border-color:  #ff9900;
            color: white;
        }

        .btn-primary:hover {
            background-color:  #ff9900;
            border-color: #ff9900;
        }

        /* Cards Styling */
        .card {
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .card-img-top {
            height: 225px; /* Set a fixed height */
            object-fit: cover; /* Ensure image fits well within the container */
        }

        footer {
            text-align: center;
            padding: 5px 0;
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
    </style>
</head>
<body>
<%
    // Fetching categories and products from request scope
    List<CategoryDTO> categories = (List<CategoryDTO>) request.getAttribute("categories");
    List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
    String selectedCategory = request.getParameter("category");
    String sortOrder = request.getParameter("sort");
%>

<!-- Header -->
<div class="header navbar navbar-expand-lg fixed-top">
    <a href="#" class="logo"><strong>FusionPay</strong></a>
    <nav>
        <a href="products">Products</a>
        <a href="cart.jsp">Cart</a>
        <a href="order_placement.jsp">Orders</a>
        <a href="profile_manage.jsp">Profile</a>
        <a href="index.jsp" class="logout">Logout</a>
    </nav>
</div>

<div class="container mt-5">
    <h2 class="mb-4 mt-5">Browse Products</h2>
    <form method="get" action="product_list.jsp">
        <div class="row mb-3">
            <div class="col-md-6">
                <select class="form-select" name="category">
                    <option value="">All Categories</option>
                    <% if (categories != null) {
                        for (CategoryDTO category : categories) { %>
                    <option value="<%= category.getId() %>"
                            <%= String.valueOf(category.getId()).equals(selectedCategory) ? "selected" : "" %>>
                        <%= category.getName() %>
                    </option>

                    <% }
                    } %>
                </select>
            </div>
            <div class="col-md-6">
                <select class="form-select" name="sort">
                    <option value="asc" <%= "asc".equals(sortOrder) ? "selected" : "" %>>Price: Low to High</option>
                    <option value="desc" <%= "desc".equals(sortOrder) ? "selected" : "" %>>Price: High to Low</option>
                </select>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Apply Filters</button>
    </form>

    <div class="row">
        <% if (products != null) {
            for (ProductDTO product : products) { %>
        <div class="col-md-4">
            <div class="card mb-3">
                <% if (product.getPhotos() != null && !product.getPhotos().isEmpty()) { %>
                <img src="${pageContext.request.contextPath}/<%= product.getPhotos().get(0).getPhotoUrl() %>"
                     class="card-img-top"
                     alt="<%= product.getName() %>">
                <% } else { %>
                <img src="default-product.jpg" class="card-img-top" alt="<%= product.getName() %>">
                <% } %>
                <div class="card-body">
                    <h5 class="card-title"><%= product.getName() %>
                    </h5>
                    <p class="card-text">Rs.<%= product.getPrice() %>
                    </p>
                    <button class="btn btn-primary btn-sm">Add to Cart</button>
                </div>
            </div>
        </div>
        <% }
        } %>
    </div>
</div>

<footer>
    <p>&copy; 2025 E-Commerce Store. All Rights Reserved.</p>
    <p>Follow us on
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
    </p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>