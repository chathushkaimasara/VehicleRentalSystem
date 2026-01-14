<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Rental System</title>
    <style>
        body { font-family: sans-serif; padding: 20px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #4CAF50; color: white; }
    </style>
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
<a href="/showNewVehicleForm">Add New Vehicle</a>
<br><br>
<table>
    <tr>
        <th>ID</th>
        <th>Brand</th>
        <th>Model</th>
        <th>Price</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>
    <tr>
        <td>...</td>
        <td>...</td>
        <td>
            <a href="/book/${vehicle.vehicleID}">Book Now</a>

            <c:if test="${sessionScope.loggedInUser.role == 'ADMIN'}">
                | <a href="/deleteVehicle/${vehicle.vehicleID}">Delete</a>
            </c:if>
        </td>
    </tr>
    <c:forEach var="vehicle" items="${listVehicles}">
        <tr>
            <td><c:out value="${vehicle.vehicleID}" /></td>
            <td><c:out value="${vehicle.brand}" /></td>
            <td><c:out value="${vehicle.model}" /></td>
            <td><c:out value="${vehicle.pricePerDay}" /></td>
            <td><c:out value="${vehicle.status}" /></td>
            <td>
                <a href="/deleteVehicle/${vehicle.vehicleID}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>