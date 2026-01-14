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
import java.time.temporal.ChronoUnit and com.example.vehiclerental.repository.VehicleRepository;

@Controller
@RequestMapping("/rentals")
public class RentalController {

    // Add this at the top of the class with other Autowired items
    @Autowired
    private com.example.vehiclerental.repository.VehicleRepository vehicleRepository;

    @PostMapping("/checkout")
    public String proceedToCheckout(@ModelAttribute("rental") Rental rental, Model model) {

        // 1. Fetch the full Vehicle details (Brand, Price, etc.)
        Vehicle vehicle = vehicleRepository.findById(rental.getVehicle().getVehicleID()).orElse(null);
        rental.setVehicle(vehicle);

        // 2. Calculate the Number of Days
        long days = java.time.temporal.ChronoUnit.DAYS.between(rental.getRentalDate(), rental.getReturnDate());
        if (days < 1) days = 1; // Minimum 1 day rental

        // 3. Calculate Total Price
        double totalPrice = days * vehicle.getPricePerDay();
        rental.setTotalCost(totalPrice);

        // 4. Send data to the checkout page
        model.addAttribute("rental", rental);
        model.addAttribute("days", days);

        return "checkout";
    }


    @Autowired
    private RentalService rentalService;

    @Autowired
    private VehicleRepository vehicleRepository;
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
    public String confirmBooking(@ModelAttribute("rental") Rental rental) {

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
