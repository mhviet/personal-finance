package com.viet.personalfinance.entities;


import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "bank")
@Data
public class Bank {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Use GenerationType.IDENTITY for auto-increment
    private Long bankId;

    private String bankName;
    private String location;
    private String remark;
    private String currency;

    // Constructors, getters, and setters
}
