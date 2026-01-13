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