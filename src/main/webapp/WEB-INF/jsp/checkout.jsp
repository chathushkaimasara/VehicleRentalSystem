<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Checkout | Vehicle Rental</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            background: url('https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=1920&auto=format&fit=crop') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
        }
        .glass-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            padding: 30px;
            color: white;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
            height: 100%;
        }
        h2 { font-weight: 700; color: white; text-shadow: 0 2px 4px rgba(0,0,0,0.3); }
        h5 { font-weight: 600; color: #f1f2f6; }
        
        .summary-label { color: rgba(255, 255, 255, 0.7); font-size: 0.9rem; }
        .summary-value { font-weight: 600; font-size: 1.1rem; }
        
        .total-price {
            color: #2ed573;
            font-size: 2rem;
            font-weight: 800;
            text-shadow: 0 0 10px rgba(46, 213, 115, 0.3);
        }

        hr { border-color: rgba(255, 255, 255, 0.3); }

        label { margin-bottom: 5px; font-weight: 500; font-size: 0.9rem; color: #dfe6e9; }
        
        input[type="text"] {
            background: rgba(255, 255, 255, 0.2) !important;
            border: 1px solid rgba(255, 255, 255, 0.3) !important;
            color: white !important;
            padding: 10px 15px;
            border-radius: 8px;
        }

        input::placeholder { color: rgba(255, 255, 255, 0.5); }
        
        input:focus {
            background: rgba(255, 255, 255, 0.3) !important;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.2);
            border-color: white !important;
            outline: none;
        }
        .btn-pay {
            background: #2ed573;
            border: none;
            width: 100%;
            padding: 12px;
            font-weight: bold;
            font-size: 18px;
            border-radius: 8px;
            transition: all 0.3s ease;
            margin-top: 20px;
            color: white;
        }

        .btn-pay:hover {
            background: #26af61;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 213, 115, 0.4);
        }
        
        .btn-back {
            color: #ffcccb;
            text-decoration: none;
            margin-top: 15px;
            display: inline-block;
        }
        .btn-back:hover { color: white; text-decoration: underline; }

    </style>
</head>
<body>

<div class="container" style="max-width: 900px;">
    <h2 class="mb-4 text-center">Review & Checkout</h2>
    
    <div class="row g-4">
        
        <div class="col-md-6">
            <div class="glass-card">
                <h4 class="mb-3"><i class="fas fa-list-alt"></i> Booking Summary</h4>
                <div style="background: rgba(0,0,0,0.2); padding: 15px; border-radius: 10px;">
                    <h5>${rental.vehicle.brand} ${rental.vehicle.model}</h5>
                </div>
                
                <hr>
                
                <div class="row mb-2">
                    <div class="col-6 summary-label">Start Date</div>
                    <div class="col-6 text-end summary-value">${rental.rentalDate}</div>
                </div>
                
                <div class="row mb-2">
                    <div class="col-6 summary-label">Return Date</div>
                    <div class="col-6 text-end summary-value">${rental.returnDate}</div>
                </div>
                
                <div class="row mb-2">
                    <div class="col-6 summary-label">Duration</div>
                    <div class="col-6 text-end summary-value">${days} Days</div>
                </div>
                
                <div class="row mb-2">
                    <div class="col-6 summary-label">Price / Day</div>
                    <div class="col-6 text-end summary-value">$${rental.vehicle.pricePerDay}</div>
                </div>
                
                <hr>
                
                <div class="text-center mt-3">
                    <div class="summary-label">TOTAL TO PAY</div>
                    <div class="total-price">$${rental.totalCost}</div>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="glass-card">
                <h4 class="mb-3"><i class="fas fa-credit-card"></i> Payment Details</h4>
                
                <form action="/rentals/confirmBooking" method="post">
                    
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
                        <div class="input-group">
                            <span class="input-group-text" style="background: rgba(255,255,255,0.1); border: 1px solid rgba(255,255,255,0.3); color: white;"><i class="far fa-credit-card"></i></span>
                            <input type="text" class="form-control" placeholder="0000 0000 0000 0000" required>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-6">
                            <label>Expiry</label>
                            <input type="text" class="form-control" placeholder="MM/YY" required>
                        </div>
                        <div class="col-6">
                            <label>CVV</label>
                            <input type="text" class="form-control" placeholder="123" required>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-pay">
                        Pay & Confirm <i class="fas fa-check-circle"></i>
                    </button>
                    
                    <div class="text-center">
                        <a href="/" class="btn-back">Cancel Transaction</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
