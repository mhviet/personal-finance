package com.viet.personalfinance.services;

import com.viet.personalfinance.entities.User;
import com.viet.personalfinance.repositoties.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserRepository userRepository;

//    @Autowired
//    private PasswordEncoder passwordEncoder;

    public boolean authenticateUser(String username, String password) {
        User user = userRepository.findByUsername(username);
//        if (user != null && passwordEncoder.matches(password, user.getPassword())) {
//            return true; // Authentication successful
//        }
        return false; // Authentication failed
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }
}
