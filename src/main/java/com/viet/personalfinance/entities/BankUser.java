package com.viet.personalfinance.entities;


import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;

@Entity
@Table(name = "bank_user")
@Data
public class BankUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Use GenerationType.IDENTITY for auto-increment
    private Long bankUserId;
    private Long bankId;
    private Long userId;
    private BigDecimal balance;
    private String currency;

    // Constructors, getters, and setters
}
