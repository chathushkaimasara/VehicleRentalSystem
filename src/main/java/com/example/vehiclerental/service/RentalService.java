package com.example.vehiclerental.service;

import com.example.vehiclerental.model.Rental;
import com.example.vehiclerental.repository.RentalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.temporal.ChronoUnit;

@Service
public class RentalService {

    @Autowired
    private RentalRepository rentalRepository;

    public void createRental(Rental rental) {

        long days = ChronoUnit.DAYS.between(rental.getRentalDate(), rental.getReturnDate());


        if (days < 1) days = 1;


        double pricePerDay = rental.getVehicle().getPricePerDay();
        rental.setTotalCost(days * pricePerDay);

        rental.setStatus("PENDING");
        rentalRepository.save(rental);
    }
    public void cancelRental(int rentalId) {

        Rental rental = rentalRepository.findById(rentalId).orElse(null);


        if (rental != null) {
            rental.setStatus("CANCELLED");
            rentalRepository.save(rental);
        }
    }
}
