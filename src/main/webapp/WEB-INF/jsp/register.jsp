<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Rental System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
