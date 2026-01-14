<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Vehicle Rental System</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<h1>My Rental History</h1>
<a href="/">Back to Home</a>

<table>
  <tr>
    <th>Rental ID</th>
    <th>Vehicle</th>
    <th>Dates</th>
    <th>Total Cost</th>
    <th>Status</th>
  </tr>
  <c:forEach var="rental" items="${rentals}">
    <tr>
      <td>${rental.rentalID}</td>
      <td>${rental.vehicle.brand} ${rental.vehicle.model}</td>
      <td>${rental.rentalDate} to ${rental.returnDate}</td>
      <td>$${rental.totalCost}</td>
      <td>
        <span class="status-${rental.status}">${rental.status}</span>
      </td>
    </tr>
  </c:forEach>
</table>

<c:if test="${empty rentals}">
  <p>You haven't booked any vehicles yet.</p>
</c:if>
</body>
</html>
