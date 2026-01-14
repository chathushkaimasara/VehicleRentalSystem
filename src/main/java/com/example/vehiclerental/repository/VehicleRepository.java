package com.example.vehiclerental.repository;

import com.example.vehiclerental.model.Vehicle;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface VehicleRepository extends JpaRepository<Vehicle, Integer> {

    List<Vehicle> findByBrandContainingIgnoreCaseOrModelContainingIgnoreCase(String brand, String model);
}