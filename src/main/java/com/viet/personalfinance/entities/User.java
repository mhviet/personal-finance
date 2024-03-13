package com.viet.personalfinance.entities;


import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "user")
@Data
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Use GenerationType.IDENTITY for auto-increment
    private Long userId;

    private String username;
    private String password;
    private String email;
    private String remark;

    // Constructors, getters, and setters
}
