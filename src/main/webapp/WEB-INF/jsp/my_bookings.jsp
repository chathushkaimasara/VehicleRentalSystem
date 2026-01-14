<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>My Bookings</title>
  <style>
    body { font-family: sans-serif; padding: 20px; }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
    th { background-color: #007bff; color: white; }
    .status-PENDING { color: orange; font-weight: bold; }
    .status-APPROVED { color: green; font-weight: bold; }
  </style>
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
