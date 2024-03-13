package com.viet.personalfinance.controller;

import com.viet.personalfinance.dtos.TotalBanlance;
import com.viet.personalfinance.entities.User;
import com.viet.personalfinance.services.IBankUserService;
import com.viet.personalfinance.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/dashboard")
public class DashboardController {
    @Autowired
    private IUserService userService;
    @Autowired
    private IBankUserService bankService;


    @GetMapping("")
    public ResponseEntity<List<User>> getAllUser() {
        List<User> users = userService.findAll();
        return ResponseEntity.ok(users);
    }

    @GetMapping("/totalBalance/{currency}")
    public ResponseEntity<List<TotalBanlance>> getTotalBalanceByCurrency(@PathVariable String currency) {
        List<TotalBanlance> totalBanlances = bankService.getTotalBalanceByCurrency(currency);
        return ResponseEntity.ok(totalBanlances);
    }
}