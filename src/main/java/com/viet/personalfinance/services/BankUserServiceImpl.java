package com.viet.personalfinance.services;

import com.viet.personalfinance.dtos.TotalBanlance;
import com.viet.personalfinance.repositoties.BankUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BankUserServiceImpl implements IBankUserService {

    @Autowired
    private BankUserRepository bankUserRepository;

    @Override
    public List<TotalBanlance> getTotalBalanceByCurrency(String currency) {
        return null;
    }
}
