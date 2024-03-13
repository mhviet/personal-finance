package com.viet.personalfinance.services;

import com.viet.personalfinance.dtos.TotalBanlance;

import java.util.List;

public interface IBankUserService {
    public List<TotalBanlance> getTotalBalanceByCurrency(String currency);
}
