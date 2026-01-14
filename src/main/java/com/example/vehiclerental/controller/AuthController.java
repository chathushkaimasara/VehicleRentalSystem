package com.example.vehiclerental.controller;

import com.example.vehiclerental.model.User;
import com.example.vehiclerental.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;
    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam("username") String username,
                               @RequestParam("password") String password,
                               HttpSession session,
                               Model model) {

        User user = userService.authenticate(username, password);

        if (user != null) {
            session.setAttribute("loggedInUser", user);
            return "redirect:/";
        } else {
            model.addAttribute("error", "Invalid Username or Password");
            return "login";
        }
    }

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") User user, Model model) {
        boolean isRegistered = userService.registerUser(user);

        if (isRegistered) {
            return "redirect:/login?success";
        } else {
            model.addAttribute("error", "Username already exists! Try another.");
            return "register";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
    @GetMapping("/test")
    @ResponseBody
    public String test() {
        return "Controller is working!";
    }
}
