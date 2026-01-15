<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Rental System | Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            background: url('https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=1920&auto=format&fit=crop') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .glass-nav {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            padding: 15px 30px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-weight: 500;
            transition: 0.3s;
        }
        .nav-links a:hover { color: #ffcccb; }

        .vehicle-card {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            height: 100%;
        }

        .vehicle-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
        }

        .price-tag {
            background: #2ed573;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-weight: bold;
            font-size: 0.9rem;
        }

        .search-container {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 15px;
            margin-bottom: 30px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .search-input {
            background: rgba(255, 255, 255, 0.9) !important;
            border: none !important;
        }

        .status-badge {
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
    </style>
</head>
<body>

<div class="glass-nav">
    <h3 class="m-0"><i class="fas fa-car-side"></i> VehicleRental</h3>

    <div class="nav-links">
        <c:choose>
            <c:when test="${not empty sessionScope.loggedInUser}">
                <span>Welcome, <b>${sessionScope.loggedInUser.fullName}</b></span>
                <a href="/rentals/myBookings"><i class="fas fa-list"></i> My Bookings</a>
                <a href="/logout" class="btn btn-sm btn-danger ms-3">Logout</a>
            </c:when>
            <c:otherwise>
                <a href="/login">Login</a>
                <a href="/register" class="btn btn-sm btn-primary ms-2">Sign Up</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<div class="container mt-5">

    <div class="search-container text-white">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2>Find your perfect ride</h2>
            <c:if test="${sessionScope.loggedInUser.role == 'ADMIN'}">
                <a href="/showNewVehicleForm" class="btn btn-success">+ Add Vehicle</a>
            </c:if>
        </div>

        <form action="/" method="get" class="row g-2">
            <div class="col-md-10">
                <input type="text" name="keyword" class="form-control search-input"
                       placeholder="Search by Brand (Toyota, BMW...) or Model" value="${keyword}">
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-primary w-100 fw-bold">Search</button>
            </div>
        </form>
    </div>

    <div class="row">
        <c:forEach var="vehicle" items="${listVehicles}">
        <div class="col-md-4 mb-4">
            <div class="card vehicle-card shadow-sm">

                <c:if test="${not empty vehicle.image}">
                <img src="${vehicle.image}" class="card-img-top" alt="Car Image">
                </c:if>
                <c:if test="${empty vehicle.image}">
                <div class="d-flex align-items-center justify-content-center bg-secondary text-white" style="height: 200px;">
                    <i class="fas fa-car fa-3x"></i>
                </div>
                </c:if>

                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-start">
                        <h5 class="card-title fw-bold">${vehicle.brand} ${vehicle.model}</h5>
                        <span class="price-tag">$${vehicle.pricePerDay}/day</span>
                    </div>

                    <p class="card-text text-muted mb-2">
                        Status: <span class="badge bg-info text-dark status-badge">${vehicle.status}</span>
                    </p>

                    <div class="d-grid gap-2">
                        <a href="/