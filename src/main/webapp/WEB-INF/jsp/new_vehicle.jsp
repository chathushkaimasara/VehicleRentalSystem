<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Vehicle</title>
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

    <label>Status:</label>
    <form:input path="status" /><br><br>

    <button type="submit">Save Vehicle</button>
</form:form>
</body>
</html>