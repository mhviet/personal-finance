package com.viet.personalfinance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/custom-login")
    public String showCustomLoginPage() {
        return "custom-login"; // Return the name of your custom login page (e.g., "custom-login.html")
    }
}
