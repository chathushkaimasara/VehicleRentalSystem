<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Rental System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h1>Add New Vehicle</h1>
<form:form action="/saveVehicle" method="post" modelAttribute="vehicle">
    <label>Brand:</label>
    <form:input path="brand" /><br><br>

    <label>Model:</label>
    <form:input path="model" /><br><br>

    <label>Price:</label>
    <form:input path="pricePerDay" /><br><br>

    <label>Image URL:</label>
    <form:input path="image" placeholder="Paste image link here..." class="form-control" />
    <br><br>

    <label>Status:</label>
    <form:input path="status" /><br><br>

    <button type="submit">Save Vehicle</button>
</form:form>
</body>
</html>