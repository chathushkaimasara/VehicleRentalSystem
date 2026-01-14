package com.example.vehiclerental.controller;

import com.example.vehiclerental.model.Rental;
import com.example.vehiclerental.model.User;
import com.example.vehiclerental.model.Vehicle;
import com.example.vehiclerental.repository.RentalRepository;
import com.example.vehiclerental.repository.VehicleRepository;
import com.example.vehiclerental.service.RentalService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.time.temporal.ChronoUnit;
import com.example.vehiclerental.repository.VehicleRepository;

@Controller
@RequestMapping("/rentals")
public class RentalController {

    @Autowired
    private com.example.vehiclerental.repository.VehicleRepository vehicleRepository;

    @PostMapping("/checkout")
    public String proceedToCheckout(@ModelAttribute("rental") Rental rental, Model model) {

        Vehicle vehicle = vehicleRepository.findById(rental.getVehicle().getVehicleID()).orElse(null);
        rental.setVehicle(vehicle);

        long days = java.time.temporal.ChronoUnit.DAYS.between(rental.getRentalDate(), rental.getReturnDate());
        if (days < 1) days = 1;

        double totalPrice = days * vehicle.getPricePerDay();
        rental.setTotalCost(totalPrice);

        model.addAttribute("rental", rental);
        model.addAttribute("days", days);

        return "checkout";
    }


    @Autowired
    private RentalService rentalService;

    @Autowired
    private RentalRepository rentalRepository;


    @GetMapping("/book/{vehicleId}")
    public String showBookingForm(@PathVariable int vehicleId, HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }

        Vehicle vehicle = vehicleRepository.findById(vehicleId).orElse(null);
        Rental rental = new Rental();
        rental.setVehicle(vehicle);
        rental.setUser(user);

        model.addAttribute("rental", rental);
        model.addAttribute("vehicle", vehicle);

        return "book_vehicle";
    }

    @PostMapping("/confirmBooking")
    public String confirmBooking(@ModelAttribute("rental") Rental rental, HttpSession session) {

        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }
        rental.setUser(user);

        if (rental.getRentalDate() != null && rental.getReturnDate() != null) {
            if (rental.getReturnDate().isBefore(rental.getRentalDate())) {
                return "redirect:/rentals/book/" + rental.getVehicle().getVehicleID() + "?error=dates";
            }
        }

        long conflictingBookings = rentalRepository.countOverlappingRentals(
                rental.getVehicle().getVehicleID(),
                rental.getRentalDate(),
                rental.getReturnDate()
        );

        if (conflictingBookings > 0) {
            return "redirect:/rentals/book/" + rental.getVehicle().getVehicleID() + "?error=unavailable";
        }

        rentalService.createRental(rental);
        return "redirect:/?success=booking";
    }

    @GetMapping("/myBookings")
    public String showMyBookings(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/login";
        }

        List<Rental> myRentals = rentalRepository.findByUser(user);
        model.addAttribute("rentals", myRentals);

        return "my_bookings";
    }
    @PostMapping("/cancel")
    public String cancelRental(@RequestParam("id") int id, HttpSession session) {

        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }


        rentalService.cancelRental(id);

        return "redirect:/rentals/myBookings";
    }
}
