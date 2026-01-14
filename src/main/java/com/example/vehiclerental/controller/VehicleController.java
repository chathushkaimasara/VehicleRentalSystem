package com.example.vehiclerental.controller;

import com.example.vehiclerental.model.Vehicle;
import com.example.vehiclerental.repository.VehicleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;
import com.example.vehiclerental.model.User;
import java.util.List;


@Controller
public class VehicleController {

    @Autowired
    private VehicleRepository vehicleRepository;

    @GetMapping("/")
    public String viewHomePage(Model model, @RequestParam(value = "keyword", required = false) String keyword) {
        List<Vehicle> listVehicles;

        if (keyword != null && !keyword.isEmpty()) {
            // If user searched for something, use our new custom search
            listVehicles = vehicleRepository.findByBrandContainingIgnoreCaseOrModelContainingIgnoreCase(keyword, keyword);
        } else {
            // Otherwise, show everything
            listVehicles = vehicleRepository.findAll();
        }

        model.addAttribute("listVehicles", listVehicles);
        model.addAttribute("keyword", keyword); // Send the keyword back so it stays in the search box
        return "index";
    }

    @GetMapping("/showNewVehicleForm")
    public String showNewVehicleForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");

        if (user == null || !"ADMIN".equals(user.getRole())) {
            return "redirect:/";
        }

        Vehicle vehicle = new Vehicle();
        model.addAttribute("vehicle", vehicle);
        return "new_vehicle";
    }

    @PostMapping("/saveVehicle")
    public String saveVehicle(@ModelAttribute("vehicle") Vehicle vehicle) {
        vehicleRepository.save(vehicle);
        return "redirect:/";
    }

    @GetMapping("/deleteVehicle/{id}")
    public String deleteVehicle(@PathVariable(value = "id") int id) {
        vehicleRepository.deleteById(id);
        return "redirect:/";
    }
}