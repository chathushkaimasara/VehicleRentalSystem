package com.example.vehiclerental.controller;

import com.example.vehiclerental.model.Vehicle;
import com.example.vehiclerental.repository.VehicleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class VehicleController {

    @Autowired
    private VehicleRepository vehicleRepository;

    @GetMapping("/")
    public String viewHomePage(Model model) {
        model.addAttribute("listVehicles", vehicleRepository.findAll());
        return "index"; // Looks for index.jsp
    }

    @GetMapping("/showNewVehicleForm")
    public String showNewVehicleForm(Model model) {
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