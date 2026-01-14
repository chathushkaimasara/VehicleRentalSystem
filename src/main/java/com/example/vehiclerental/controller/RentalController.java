package com.example.vehiclerental.controller;

import com.example.vehiclerental.model.Rental;
import com.example.vehiclerental.model.User;
import com.example.vehiclerental.model.Vehicle;
import com.example.vehiclerental.repository.VehicleRepository;
import com.example.vehiclerental.service.RentalService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class RentalController {

    @Autowired
    private RentalService rentalService;

    @Autowired
    private VehicleRepository vehicleRepository;


    @GetMapping("/book/{vehicleId}")
    public String showBookingForm(@PathVariable int vehicleId, HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login"; // Force login
        }

        Vehicle vehicle = vehicleRepository.findById(vehicleId).orElse(null);
        Rental rental = new Rental();
        rental.setVehicle(vehicle);
        rental.setUser(user);

        model.addAttribute("rental", rental);
        model.addAttribute("vehicle", vehicle);

        return "book_vehicle"; // Loads book_vehicle.jsp
    }


    @PostMapping("/confirmBooking")
    public String confirmBooking(@ModelAttribute("rental") Rental rental, HttpSession session) {


        rentalService.createRental(rental);
        return "redirect:/?success=booking";
    }
}
