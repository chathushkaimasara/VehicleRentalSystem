<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Rental System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div style="background: #eee; padding: 10px; margin-bottom: 20px;">
    <c:choose>
        <c:when test="${not empty sessionScope.loggedInUser}">
            <span>Welcome, <b>${sessionScope.loggedInUser.fullName}</b>!</span>

            | <a href="/rentals/myBookings">My Bookings</a> |

            <a href="/logout" style="float: right;">Logout</a>
        </c:when>
        <c:otherwise>
            <a href="/login">Login</a>
        </c:otherwise>
    </c:choose>
</div>

<h1>Vehicle Inventory</h1>

<c:if test="${sessionScope.loggedInUser.role == 'ADMIN'}">
    <a href="/showNewVehicleForm" style="background: green; color: white; padding: 5px; text-decoration: none;">+ Add New Vehicle</a>
    <br><br>
</c:if>
<form action="/" method="get" class="mb-3">
    <div class="input-group">
        <input type="text" name="keyword" class="form-control" placeholder="Search by Brand or Model (e.g., Toyota)" value="${keyword}">
        <button type="submit" class="btn btn-primary">Search</button>
        <a href="/" class="btn btn-secondary">Reset</a>
    </div>
</form>
<table class="table table-striped table-hover table-bordered shadow-sm">
    <tr>
        <th>ID</th>
        <th>Brand</th>
        <th>Model</th>
        <th>Price</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>

    <c:forEach var="vehicle" items="${listVehicles}">
        <tr>
            <td><c:out value="${vehicle.vehicleID}" /></td>
            <td><c:out value="${vehicle.brand}" /></td>
            <td><c:out value="${vehicle.model}" /></td>
            <td><c:out value="${vehicle.pricePerDay}" /></td>
            <td><c:out value="${vehicle.status}" /></td>
            <td>
                <a href="/rentals/book/${vehicle.vehicleID}" class="btn btn-success btn-sm">Book Now</a>

                <c:if test="${sessionScope.loggedInUser.role == 'ADMIN'}">
                    | <a href="/deleteVehicle/${vehicle.vehicleID}" class="btn btn-danger btn-sm">Delete</a>
                </c:if>
            </td>
        </tr>
    </c:forEach> </table>
</body>
</html>