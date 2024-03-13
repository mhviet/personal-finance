package com.viet.personalfinance.dtos;

import lombok.Data;

@Data
public class TotalBanlance {
    String userId;
    String userName;
    String totalBalance;
    String currency;
}
