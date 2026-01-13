<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Vehicle</title>
</head>
<body>
<h1>Add New Vehicle</h1>
<form:form action="/saveVehicle" method="post" modelAttribute="vehicle">
    Brand: <form:input path="brand" /><br><br>
    Model: <form:input path="model" /><br><br>
    Price: <form:input path="pricePerDay" /><br><br>
    Status: <form:input path="status" /><br><br>
    <button type="submit">Save Vehicle</button>
</form:form>
</body>
</html><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Vehicle</title>
</head>
<body>
<h1>Add New Vehicle</h1>
<form:form action="/saveVehicle" method="post" modelAttribute="vehicle">
    Brand: <form:input path="brand" /><br><br>
    Model: <form:input path="model" /><br><br>
    Price: <form:input path="pricePerDay" /><br><br>
    Status: <form:input path="status" /><br><br>
    <button type="submit">Save Vehicle</button>
</form:form>
</body>
</html>