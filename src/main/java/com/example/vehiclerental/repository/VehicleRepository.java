package com.example.vehiclerental.repository;

import com.example.vehiclerental.model.Vehicle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface VehicleRepository extends JpaRepository<Vehicle, Integer> {

    List<Vehicle> findByBrandContainingIgnoreCaseOrModelContainingIgnoreCase(String brand, String model);
    List<Vehicle> findByStatusNot(String status);

    @Query("SELECT v FROM Vehicle v WHERE (v.brand LIKE %?1% OR v.model LIKE %?1%) AND v.status <> 'Deleted'")
    List<Vehicle> searchActiveVehicles(String keyword);

}