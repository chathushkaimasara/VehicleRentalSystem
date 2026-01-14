package com.example.vehiclerental.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "Rentals")
public class Rental {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int rentalID;


    @ManyToOne
    @JoinColumn(name = "UserID")
    private User user;


    @ManyToOne
    @JoinColumn(name = "VehicleID")
    private Vehicle vehicle;

    private LocalDate rentalDate;
    private LocalDate returnDate;
    private double totalCost;
    private String status;


    public int getRentalID() { return rentalID; }
    public void setRentalID(int rentalID) { this.rentalID = rentalID; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    public Vehicle getVehicle() { return vehicle; }
    public void setVehicle(Vehicle vehicle) { this.vehicle = vehicle; }
    public LocalDate getRentalDate() { return rentalDate; }
    public void setRentalDate(LocalDate rentalDate) { this.rentalDate = rentalDate; }
    public LocalDate getReturnDate() { return returnDate; }
    public void setReturnDate(LocalDate returnDate) { this.returnDate = returnDate; }
    public double getTotalCost() { return totalCost; }
    public void setTotalCost(double totalCost) { this.totalCost = totalCost; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}