package com.viet.personalfinance.services;

import com.viet.personalfinance.entities.User;

import java.util.List;

public interface IUserService {
    public boolean authenticateUser(String username, String password);
    public List<User> findAll();
}
