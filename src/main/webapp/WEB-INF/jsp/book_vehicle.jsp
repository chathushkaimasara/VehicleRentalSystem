<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book Vehicle</title>
</head>
<body>
<h1>Book: ${vehicle.brand} ${vehicle.model}</h1>
<p>Price per Day: $${vehicle.pricePerDay}</p>

<form:form action="/confirmBooking" method="post" modelAttribute="rental">

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