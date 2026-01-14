<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Vehicle Rental</title>
    <style>
        body { font-family: sans-serif; display: flex; justify-content: center; padding-top: 50px; }
        .container { border: 1px solid #ccc; padding: 20px; border-radius: 5px; width: 350px; }
        .error { color: red; }
        input { width: 95%; padding: 8px; margin: 5px 0; }
        button { width: 100%; padding: 10px; background-color: #28a745; color: white; border: none; cursor: pointer; }
        button:hover { background-color: #218838; }
    </style>
</head>
<body>
<div class="container">
    <h2>Create Account</h2>

    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <form:form action="/register" method="post" modelAttribute="user">
        <label>Full Name:</label>
        <form:input path="fullName" required="true"/>

        <label>Username:</label>
        <form:input path="username" required="true"/>

        <label>Password:</label>
        <form:password path="password" required="true"/>

        <br><br>
        <button type="submit">Sign Up</button>
    </form:form>

    <p style="text-align: center;">
        Already have an account? <a href="/login">Login here</a>
    </p>
</div>
</body>
</html>
