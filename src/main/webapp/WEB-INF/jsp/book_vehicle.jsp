<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book Vehicle</title>
</head>
<body>
<h1>Book: ${vehicle.brand} ${vehicle.model}</h1>

<% if (request.getParameter("error") != null) { %>
<div style="color: red; background-color: #ffdddd; padding: 10px; border: 1px solid red; margin-bottom: 15px;">
    <strong>Error:</strong> You cannot return the car before you pick it up! Please check your dates.
</div>
<% } %>
<% if ("unavailable".equals(request.getParameter("error"))) { %>
<div style="color: #721c24; background-color: #f8d7da; padding: 10px; border: 1px solid #f5c6cb; margin-bottom: 15px;">
    <strong>Unavailable!</strong> This car is already booked for those dates. Please try different dates.
</div>
<% } %>
<p>Price per Day: $${vehicle.pricePerDay}</p>

<form:form action="/rentals/confirmBooking" method="post" modelAttribute="rental">

    <form:hidden path="vehicle" value="${vehicle.vehicleID}"/>
    <form:hidden path="user" value="${sessionScope.loggedInUser.userID}"/>

    <label>Start Date:</label>
    <form:input type="date" path="rentalDate" required="true" /><br><br>

    <label>Return Date:</label>
    <form:input type="date" path="returnDate" required="true" /><br><br>

    <button type="submit">Confirm Booking</button>
</form:form>
</body>
</html>