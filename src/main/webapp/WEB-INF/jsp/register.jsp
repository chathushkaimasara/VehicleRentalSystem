<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Rental System | Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
            background: url('https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=1920&auto=format&fit=crop') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .register-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            padding: 40px;
            width: 100%;
            max-width: 450px;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
            color: white;
        }

        input[type="text"], input[type="password"] {
            background: rgba(255, 255, 255, 0.2) !important;
            border: 1px solid rgba(255, 255, 255, 0.3) !important;
            color: white !important;
            padding: 12px;
            border-radius: 6px;
        }

        input::placeholder { color: rgba(255, 255, 255, 0.7); }
        input:focus {
            background: rgba(255, 255, 255, 0.3) !important;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.2);
            border-color: white !important;
        }

        .btn-register {
            background: #2ed573;
            border: none;
            width: 100%;
            padding: 12px;
            font-weight: bold;
            font-size: 16px;
            border-radius: 8px;
            transition: all 0.3s ease;
            margin-top: 10px;
        }

        .btn-register:hover {
            background: #7bed9f;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 213, 115, 0.4);
        }

        h2 { text-align: center; margin-bottom: 30px; font-weight: 700; }
        label { margin-bottom: 5px; font-weight: 500; margin-top: 15px; display: block; }

        a { color: #ffcccb; text-decoration: none; font-weight: 500; }
        a:hover { color: white; text-decoration: underline; }
    </style>
</head>

<body>

<div class="register-card">
    <h2>Create Account</h2>

    <c:if test="${not empty error}">
        <div class="alert alert-danger text-center" style="background: rgba(220, 53, 69, 0.8); border: none; color: white;">
                ${error}
        </div>
    </c:if>

    <form:form action="/register" method="post" modelAttribute="user">

        <label>Full Name</label>
        <form:input path="fullName" cssClass="form-control" placeholder="John Doe" required="true"/>

        <label>Username</label>
        <form:input path="username" cssClass="form-control" placeholder="Choose a username" required="true"/>

        <label>Password</label>
        <form:password path="password" cssClass="form-control" placeholder="Create a password" required="true"/>

        <br>
        <button type="submit" class="btn btn-primary btn-register">Sign Up</button>
    </form:form>

    <p class="text-center mt-4 mb-0">
        Already have an account? <a href="/login">Login here</a>
    </p>
</div>

</body>
</html>
