package com.javaweb.repository.custom;

import java.util.List;

public interface TransactionRepositoryCustom {
    void deleteTransactionByCustomerIds(List<Long> customerIds);
}
