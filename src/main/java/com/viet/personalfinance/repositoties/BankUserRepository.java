package com.viet.personalfinance.repositoties;

import com.viet.personalfinance.dtos.TotalBanlance;
import com.viet.personalfinance.entities.BankUser;
import com.viet.personalfinance.entities.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BankUserRepository extends CrudRepository<BankUser, Long> {
    String getTotalBalanceByCurrency = "SELECT u.username, SUM(bu.balance) AS total_sgd FROM bank_user bu \n" +
            "INNER JOIN user u ON bu.userId = u.userId\n" +
            "INNER JOIN bank b ON bu.bankId = b.bankId\n" +
            "WHERE b.currency = :currency\n" +
            "GROUP BY bu.userId";
    @Query(value = getTotalBalanceByCurrency, nativeQuery = true)
    public List<TotalBanlance> getTotalBalanceByCurrency(@Param("currency") String currency);

}
