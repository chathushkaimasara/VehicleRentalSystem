# Vehicle Rental System

This is a comprehensive Vehicle Rental web application built using the Spring Boot framework. It allows users to browse, book, and manage vehicle rentals, while providing administrators with tools to manage the vehicle inventory.

## Features

*   **User Management**: Secure user registration and login system.
*   **Role-Based Access**:
    *   **Customer Role**: Can browse vehicles, make bookings, view their rental history, and cancel pending bookings.
    *   **Admin Role**: Can perform all customer actions, plus add new vehicles and remove existing ones from the inventory.
*   **Vehicle Catalog**: Displays all available vehicles with details like brand, model, price per day, and an image.
*   **Search Functionality**: Users can search for vehicles by brand or model.
*   **Booking System**:
    *   Select rental and return dates.
    *   Check for vehicle availability to prevent double-booking.
    *   Calculate the total cost based on the daily rate and rental duration.
*   **Checkout Process**: A multi-step booking process that includes a review and a simulated payment page.
*   **My Bookings Page**: Users can view a history of their past and current rentals, including their status (e.g., PENDING, CANCELLED).
*   **Admin Dashboard**: Admins can add new vehicles and soft-delete existing ones (sets status to "Deleted").

## Technologies Used

*   **Backend**: Java 17, Spring Boot (Web, Data JPA)
*   **Frontend**: JSP (JavaServer Pages), JSTL, HTML, CSS
*   **Database**: Microsoft SQL Server
*   **Build Tool**: Apache Maven
*   **Styling**: Bootstrap 5, Font Awesome

## Getting Started

### Prerequisites

*   Java Development Kit (JDK) 17 or later
*   Apache Maven
*   An instance of Microsoft SQL Server

### Installation & Setup

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/chathushkaimasara/VehicleRentalSystem.git
    cd VehicleRentalSystem
    ```

2.  **Database Configuration:**
    *   Open your SQL Server management tool and create a new database. The application is configured to use the name `VehicleRentalDB`.
    *   Update the database connection properties in `src/main/resources/application.properties` with your SQL Server URL, username, and password.
        ```properties
        spring.datasource.url=jdbc:sqlserver://localhost;databaseName=VehicleRentalDB;encrypt=true;trustServerCertificate=true
        spring.datasource.username=your_username
        spring.datasource.password=your_password
        ```
    *   The application uses `spring.jpa.hibernate.ddl-auto=update`, which will automatically create the necessary tables (`Users`, `Vehicles`, `Rentals`) when the application starts for the first time.

3.  **Create an Admin User:**
    *   After running the application once to create the tables, you will need to manually update a user's role to `ADMIN` in the `Users` table to access administrative features.
    1.  Register a new user through the application's registration page.
    2.  In your database, find the newly created user in the `Users` table.
    3.  Change the value in the `role` column for that user from `CUSTOMER` to `ADMIN`.

4.  **Build and Run the Application:**
    *   You can run the application using Maven:
        ```sh
        mvn spring-boot:run
        ```
    *   Alternatively, you can run the `VehicleRentalSystemApplication.java` file from your IDE (like IntelliJ or VS Code).

5.  **Access the Application:**
    *   Open your web browser and navigate to `http://localhost:8080`.

## Application Structure

### Key Pages & Views

*   `index.jsp`: The home page displaying all available vehicles and the search bar.
*   `login.jsp` / `register.jsp`: User authentication pages.
*   `new_vehicle.jsp`: [Admin] Form for adding a new vehicle to the system.
*   `book_vehicle.jsp`: Form for a user to select rental dates for a specific vehicle.
*   `checkout.jsp`: A summary of the booking and a mock payment form before final confirmation.
*   `my_bookings.jsp`: A list of all rentals made by the logged-in user.

### Backend Controllers

*   `AuthController.java`: Manages user login, registration, and logout.
*   `VehicleController.java`: Handles displaying, searching, adding, and deleting vehicles.
*   `RentalController.java`: Manages the booking process, including displaying the booking form, checkout, confirmation, and cancellation.
