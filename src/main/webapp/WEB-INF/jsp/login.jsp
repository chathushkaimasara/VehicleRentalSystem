<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Vehicle Rental</title>
    <style>
        body { font-family: sans-serif; display: flex; justify-content: center; padding-top: 50px; }
        .login-container { border: 1px solid #ccc; padding: 20px; border-radius: 5px; width: 300px; }
        .error { color: red; }
    </style>
</head>
<body>
<div class="login-container">
    <h2>Login</h2>

    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <form action="/login" method="post">
        <label>Username:</label><br>
        <input type="text" name="username" required style="width: 90%;"><br><br>

        <label>Password:</label><br>
        <input type="password" name="password" required style="width: 90%;"><br><br>

        <button type="submit">Login</button>
    </form>
    <p style="text-align: center; margin-top: 15px;">
        Don't have an account? <a href="/register">Register here</a>
    </p>

    <% if (request.getParameter("success") != null) { %>
    <p style="color: green; text-align: center;">Registration successful! Please login.</p>
    <% } %>
</div>
</body>
</html>
