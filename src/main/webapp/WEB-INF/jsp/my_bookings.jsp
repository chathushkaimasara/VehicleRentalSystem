<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>My Bookings | Vehicle Rental</title>
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
    }

    .nav-links a {
      color: white;
      text-decoration: none;
      margin-left: 20px;
      font-weight: 500;
      transition: 0.3s;
    }
    .nav-links a:hover { color: #ffcccb; }

    .booking-container {
      background: rgba(255, 255, 255, 0.85);
      backdrop-filter: blur(15px);
      border-radius: 15px;
      padding: 30px;
      margin-top: 50px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.3);
    }

    .table-custom {
      background: transparent;
    }

    .table-custom th {
      background-color: rgba(0, 0, 0, 0.05);
      border-bottom: 2px solid #ccc;
    }

    .status-badge {
      font-size: 0.85rem;
      padding: 6px 12px;
      border-radius: 20px;
      font-weight: 600;
      letter-spacing: 0.5px;
    }

    .status-PENDING { background-color: #ffeaa7; color: #d35400; }
    .status-CANCELLED { background-color: #ff7675; color: white; }
    .status-APPROVED { background-color: #55efc4; color: #00b894; }

    .empty-state {
      text-align: center;
      padding: 40px;
      color: #636e72;
    }
  </style>
</head>
<body>

<div class="glass-nav">
  <h3 class="m-0"><i class="fas fa-car-side"></i> VehicleRental</h3>
  <div class="nav-links">
    <span>Welcome, <b>${sessionScope.loggedInUser.fullName}</b></span>
    <a href="/"><i class="fas fa-home"></i> Home</a>
    <a href="/logout" class="btn btn-sm btn-danger ms-3">Logout</a>
  </div>
</div>

<div class="container">
  <div class="booking-container">
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h2 class="fw-bold"><i class="fas fa-history"></i> My Rental History</h2>
      <a href="/" class="btn btn-outline-primary">&larr; Back to Dashboard</a>
    </div>

    <c:if test="${empty rentals}">
      <div class="empty-state">
        <i class="fas fa-calendar-times fa-4x mb-3"></i>
        <h4>No bookings found</h4>
        <p>You haven't rented any cars yet.</p>
        <a href="/" class="btn btn-primary mt-2">Browse Cars</a>
      </div>
    </c:if>

    <c:if test="${not empty rentals}">
      <table class="table table-hover table-custom align-middle">
        <thead>
        <tr>
          <th>ID</th>
          <th>Vehicle</th>
          <th>Dates</th>
          <th>Total Cost</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="rental" items="${rentals}">
          <tr>
            <td class="fw-bold">#${rental.rentalID}</td>
            <td>
              <div class="d-flex align-items-center">
                <c:if test="${not empty rental.vehicle.image}">
                  <img src="${rental.vehicle.image}" style="width: 50px; height: 35px; border-radius: 4px; object-fit: cover; margin-right: 10px;">
                </c:if>
                <c:if test="${empty rental.vehicle.image}">
                  <i class="fas fa-car fa-lg me-2 text-secondary"></i>
                </c:if>

                <div>
                  <div class="fw-bold">${rental.vehicle.brand}</div>
                  <div class="small text-muted">${rental.vehicle.model}</div>
                </div>
              </div>
            </td>
            <td>
              <i class="far fa-calendar-alt text-muted"></i>
                ${rental.rentalDate} <i class="fas fa-long-arrow-alt-right mx-1"></i> ${rental.returnDate}
            </td>
            <td class="fw-bold text-success">$${rental.totalCost}</td>

            <td>
                            <span class="badge status-badge status-${rental.status}">
                                ${rental.status}
                            </span>
            </td>

            <td>
              <c:if test="${rental.status == 'PENDING'}">
                <form action="/rentals/cancel" method="post" class="d-inline">
                  <input type="hidden" name="id" value="${rental.rentalID}"/>
                  <button type="submit" class="btn btn-outline-danger btn-sm rounded-pill"
                          onclick="return confirm('Are you sure you want to cancel this booking?');">
                    <i class="fas fa-times"></i> Cancel
                  </button>
                </form>
              </c:if>

              <c:if test="${rental.status == 'CANCELLED'}">
                <span class="text-muted small"><i class="fas fa-ban"></i> Cancelled</span>
              </c:if>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </c:if>
  </div>
</div>

</body>
</html>