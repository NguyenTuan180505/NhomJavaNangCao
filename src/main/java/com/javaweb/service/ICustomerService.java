package com.javaweb.service;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface ICustomerService {
    List<CustomerDTO> searchBuildings(CustomerSearchRequest request);
    ResponseDTO listStaffs(Long customerId);
    void assignStaffToCustomer(AssignmentCustomerDTO assignmentCustomerDTO);
    CustomerDTO findbyId(Long id);

    CustomerDTO saveOrUpdate(CustomerDTO customerDTO);

    void deleteCustomers(List<Long> customerIds);
    public List<TransactionDTO> findTransactionDTOsByCustomerId(Long customerId);
    TransactionDTO saveOrUpdateTransaction(TransactionDTO transactionDTO);
}
