package com.javaweb.repository.custom;


import com.javaweb.entity.CustomerEntity;

import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.CustomerSearchRequest;

import java.util.List;

public interface CustomerRepositoryCustom {
    List<CustomerEntity> findCustomers(CustomerSearchRequest request);
    void deleteCustomersByIds(List<Long> ids);


}
