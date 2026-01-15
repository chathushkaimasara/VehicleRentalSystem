<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Vehicle | Vehicle Rental</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            background: url('https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=1920&auto=format&fit=crop') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }


        .glass-nav {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            padding: 15px 30px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            margin-bottom: 40px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-weight: 500;
            transition: 0.3s;
        }
        .nav-links a:hover { color: #ffcccb; }

        .form-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            padding: 40px;
            max-width: 600px;
            margin: 0 auto;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
            color: white;
        }


        label {
            font-weight: 500;
            margin-bottom: 8px;
            margin-top: 15px;
            display: block;
        }

        input[type="text"], input[type="number"] {
            background: rgba(255, 255, 255, 0.2) !important;
            border: 1px solid rgba(255, 255, 255, 0.3) !important;
            color: white !important;
            padding: 12px;
            border-radius: 8px;
        }

        input::placeholder { color: rgba(255, 255, 255, 0.6); }

        input:focus {
            background: rgba(255, 255, 255, 0.3) !important;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.2);
            border-color: white !important;
        }


        .btn-save {
            background: #2ed573;
            border: none;
            width: 100%;
            padding: 12px;
            font-weight: bold;
            font-size: 18px;
            border-radius: 8px;
            margin-top: 30px;
            transition: 0.3s;
        }

        .btn-save:hover {
            background: #26af61;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 213, 115, 0.4);
        }

        h2 { text-align: center; margin-bottom: 20px; font-weight: 700; }
    </style>
</head>
<body>

<div class="glass-nav">
    <h3 class="m-0"><i class="fas fa-car-side"></i> VehicleRental <span class="badge bg-danger" style="font-size: 0.5em; vertical-align: top;">ADMIN</span></h3>
    <div class="nav-links">
        <a href="/"><i class="fas fa-home"></i> Dashboard</a>
        <a href="/logout" class="btn btn-sm btn-danger ms-3">Logout</a>
    </div>
</div>

<div class="container mb-5">
    <div class="form-card">
        <h2><i class="fas fa-plus-circle"></i> Add New Vehicle</h2>

        <form:form action="/saveVehicle" method="post" modelAttribute="vehicle">

            <div class="row">
                <div class="col-md-6">
                    <label>Brand</label>
                    <form:input path="brand" cssClass="form-control" placeholder="e.g. Toyota" required="true"/>
                </div>

                <div class="col-md-6">
                    <label>Model</label>
                    <form:input path="model" cssClass="form-control" placeholder="e.g. Camry" required="true"/>
                </div>
            </div>

            <label>Price Per Day ($)</label>
            <form:input path="pricePerDay" cssClass="form-control" placeholder="e.g. 50.00" required="true"/>

            <label>Image URL</label>
            <form:input path="image" cssClass="form-control" placeholder="Paste image link here (https://...)" />
            <div class="form-text text-white-50">Right-click an image on Google -> Copy Image Address</div>

            <label>Initial Status</label>
            <form:input path="status" cssClass="form-control" placeholder="Available" value="Available"/>

            <button type="submit" class="btn btn-primary btn-save">
                <i class="fas fa-save"></i> Save Vehicle
            </button>

        </form:form>
    </div>
</div>

</body>
</html>