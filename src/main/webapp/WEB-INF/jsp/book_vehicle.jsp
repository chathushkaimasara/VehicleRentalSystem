<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book Vehicle | Vehicle Rental</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            background: url('https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=1920&auto=format&fit=crop') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
        }
        .booking-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            padding: 40px;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
            color: white;
            text-align: center;
        }
        input[type="date"] {
            background: rgba(255, 255, 255, 0.2) !important;
            border: 1px solid rgba(255, 255, 255, 0.3) !important;
            color: white !important;
            padding: 12px;
            border-radius: 8px;
            width: 100%;
            margin-bottom: 20px;
            cursor: pointer;
        }
        input[type="date"]::-webkit-calendar-picker-indicator {
            filter: invert(1);
            cursor: pointer;
        }
        input:focus {
            background: rgba(255, 255, 255, 0.3) !important;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.2);
            border-color: white !important;
            outline: none;
        }
        label {
            display: block;
            text-align: left;
            font-weight: 500;
            margin-bottom: 5px;
            color: #f1f2f6;
        }
        .btn-book {
            background: #2ed573;
            border: none;
            width: 100%;
            padding: 12px;
            font-weight: bold;
            font-size: 18px;
            border-radius: 8px;
            transition: all 0.3s ease;
            margin-top: 10px;
            color: white;
        }
        .btn-book:hover {
            background: #26af61;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 213, 115, 0.4);
        }
        .btn-cancel {
            display: inline-block;
            margin-top: 15px;
            color: #ffcccb;
            text-decoration: none;
            font-weight: 500;
        }
        .btn-cancel:hover { color: white; text-decoration: underline; }

        h2 { font-weight: 700; margin-bottom: 5px; }
        .price-text { color: #7bed9f; font-size: 1.2rem; margin-bottom: 30px; font-weight: 600; }
    </style>
</head>

<body>

<div class="booking-card">
    <h2>${vehicle.brand} ${vehicle.model}</h2>
    <div class="price-text">$${vehicle.pricePerDay} / day</div>

    <% if (request.getParameter("error") != null) { %>
        <div class="alert alert-danger text-start" role="alert" style="background: rgba(220, 53, 69, 0.8); color: white; border: none;">
            <i class="fas fa-exclamation-circle"></i> <strong>Error:</strong> Return date cannot be before start date.
        </div>
    <% } %>
    
    <% if ("unavailable".equals(request.getParameter("error"))) { %>
        <div class="alert alert-warning text-start" role="alert" style="background: rgba(255, 193, 7, 0.8); color: black; border: none;">
            <i class="fas fa-calendar-times"></i> <strong>Unavailable!</strong> This car is already booked for these dates.
        </div>
    <% } %>

    <form:form method="post" action="/rentals/checkout" modelAttribute="rental">

        <form:hidden path="vehicle" value="${vehicle.vehicleID}"/>
        <form:hidden path="user" value="${sessionScope.loggedInUser.userID}"/>

        <div class="text-start">
            <label><i class="far fa-calendar-alt"></i> Pick-up Date</label>
            <form:input type="date" path="rentalDate" required="true" cssClass="form-control" />

            <label><i class="far fa-calendar-check"></i> Return Date</label>
            <form:input type="date" path="returnDate" required="true" cssClass="form-control" />
        </div>

        <button type="submit" class="btn btn-book">
            Confirm Booking <i class="fas fa-arrow-right"></i>
        </button>

        <br>
        <a href="/" class="btn-cancel">Cancel and Go Back</a>
        
    </form:form>
</div>

</body>
</html>
