package com.example.vehiclerental.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Vehicles")
public class Vehicle {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int vehicleID;
    private String brand;
    private String model;
    private double pricePerDay;
    private String status;
}