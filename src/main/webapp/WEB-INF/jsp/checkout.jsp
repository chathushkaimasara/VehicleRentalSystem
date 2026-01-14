<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5" style="max-width: 800px;">
    <h2 class="mb-4">Review & Checkout</h2>

    <div class="row">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">Booking Summary</div>
                <div class="card-body">
                    <h5>${rental.vehicle.brand} ${rental.vehicle.model}</h5>
                    <hr>
                    <p><strong>Start Date:</strong> ${rental.rentalDate}</p>
                    <p><strong>Return Date:</strong> ${rental.returnDate}</p>
                    <p><strong>Duration:</strong> ${days} Days</p>
                    <p><strong>Price per Day:</strong> $${rental.vehicle.pricePerDay}</p>
                    <hr>
                    <h4 class="text-success">Total: $${rental.totalCost}</h4>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-header bg-success text-white">Payment Details</div>
                <div class="card-body">
                    <form action="/confirmBooking" method="post">

                        <input type="hidden" name="vehicle.vehicleID" value="${rental.vehicle.vehicleID}" />
                        <input type="hidden" name="rentalDate" value="${rental.rentalDate}" />
                        <input type="hidden" name="returnDate" value="${rental.returnDate}" />
                        <input type="hidden" name="totalCost" value="${rental.totalCost}" />

                        <div class="mb-3">
                            <label>Cardholder Name</label>
                            <input type="text" class="form-control" placeholder="John Doe" required>
                        </div>
                        <div class="mb-3">
                            <label>Card Number</label>
                            <input type="text" class="form-control" placeholder="0000 0000 0000 0000" required>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Expiry</label>
                                <input type="text" class="form-control" placeholder="MM/YY" required>
                            </div>
                            <div class="col">
                                <label>CVV</label>
                                <input type="text" class="form-control" placeholder="123" required>
                            </div>
                        </div>
                        <br>
                        <button type="submit" class="btn btn-success w-100 btn-lg">Pay & Confirm Booking</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>