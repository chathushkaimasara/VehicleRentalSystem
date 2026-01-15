<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Rental System | Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        body {
            background: url('https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=1920&auto=format&fit=crop') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            padding: 40px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
            color: white;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            color: white;
            padding: 12px;
            margin-bottom: 20px;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.3);
            color: white;
            box-shadow: none;
            border: 1px solid rgba(255, 255, 255, 0.5);
        }

        .btn-login {
            background: #ff4757;
            border: none;
            width: 100%;
            padding: 12px;
            font-weight: bold;
            font-size: 16px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .btn-login:hover {
            background: #ff6b81;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 71, 87, 0.4);
        }

        a {
            color: #ffcccb;
            text-decoration: none;
            font-weight: 500;
        }
        a:hover {
            color: white;
            text-decoration: underline;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
            letter-spacing: 1px;
        }
    </style>
</head>

<body>

<div class="login-card">
    <h2>Welcome Back</h2>

    <c:if test="${not empty error}">
        <div class="alert alert-danger text-center" style="background: rgba(220, 53, 69, 0.8); border: none; color: white;">
                ${error}
        </div>
    </c:if>

    <% if (request.getParameter("success") != null) { %>
    <div class="alert alert-success text-center" style="background: rgba(25, 135, 84, 0.8); border: none; color: white;">
        Registration successful! Please login.
    </div>
    <% } %>

    <form action="/login" method="post">
        <label class="form-label">Username</label>
        <input type="text" name="username" class="form-control" placeholder="Enter your username" required>

        <label class="form-label">Password</label>
        <input type="password" name="password" class="form-control" placeholder="Enter your password" required>

        <button type="submit" class="btn btn-primary btn-login">Login</button>
    </form>

    <p class="text-center mt-4 mb-0">
        Don't have an account? <a href="/register">Sign Up</a>
    </p>
</div>

</body>
</html>
