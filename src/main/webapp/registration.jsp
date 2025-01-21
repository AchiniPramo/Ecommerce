<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background : linear-gradient(to right, #4e54c8, #8f94fb);
            color: #fff;
            padding: 20px;
        }
        .form-container {
            background-color: #fff;
            color: #333;
            padding: 20px;
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
        .form-container button {
            background : linear-gradient(to right, #4e54c8, #8f94fb);
            border: none;
            font-size: 16px;
            padding: 12px;
        }
        .form-container button:hover {
            background : linear-gradient(to right, #4e54c8, #8f94fb);
        }
        p{
            margin-bottom: 10px;
            margin-top: 10px;
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h1>Register</h1>
    <form class="mt-4" method="POST" action="registration">
        <div class="mb-4" >
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
        </div>
        <div class="mb-4">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <div class="mb-4">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
        </div>
        <div class="mb-4">
            <label for="role" class="form-label">Role</label>
            <select class="form-control" id="role" name="role" required>
                <option value="">Select a role</option>
                <option value="admin">Admin</option>
                <option value="customer">Customer</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary w-100">Register</button>
    </form>
    <c:if test="${not empty message}">
        <div class="alert alert-${alertType} " role="alert">
            <strong>${message}</strong>
        </div>
    </c:if>
        <p>Already have an account? <a href="index.jsp" class="text-decoration-none" style="color: #4e54c8;">Login</a></p>
</div>
</body>
</html>