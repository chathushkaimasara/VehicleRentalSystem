<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Rental System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
