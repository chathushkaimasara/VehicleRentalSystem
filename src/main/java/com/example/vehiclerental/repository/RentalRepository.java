package com.example.vehiclerental.repository;

import com.example.vehiclerental.model.Rental;
import com.example.vehiclerental.model.User; // <--- Added this Import
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.time.LocalDate;
import java.util.List;

public interface RentalRepository extends JpaRepository<Rental, Integer> {

    List<Rental> findByUser(User user);

    @Query("SELECT COUNT(r) FROM Rental r WHERE r.vehicle.vehicleID = :vehicleId " +
            "AND r.status <> 'CANCELLED' " +
            "AND (r.returnDate >= :startDate AND r.rentalDate <= :endDate)")
    long countOverlappingRentals(@Param("vehicleId") int vehicleId,
                                 @Param("startDate") LocalDate startDate,
                                 @Param("endDate") LocalDate endDate);
}
