package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "customerApiOfAdmin")
@RequestMapping(value = "/api/customer")
public class CustomerAPI {
    @Autowired
    private ICustomerService customerService;


    @PostMapping
    public ResponseEntity<CustomerDTO> addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO){
        CustomerDTO addOrUpdateCustomer = customerService.saveOrUpdate(customerDTO);
        return ResponseEntity.ok(addOrUpdateCustomer);
    }
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO response = customerService.listStaffs(id);
        return response;
    }

    @PostMapping(value = "/assignment")
    public ResponseEntity<String> assignStaffToCustomer(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO){
        customerService.assignStaffToCustomer(assignmentCustomerDTO);
        return ResponseEntity.ok("Assignment updated successfully");
    }

    @DeleteMapping("/{ids}")
    public void deleteCustomer(@PathVariable List<Long> ids){
        customerService.deleteCustomers(ids);
        System.out.println("ok");
    }

    @PostMapping("/transaction")
    public ResponseEntity<String> addOrUpdateTransaction(@RequestBody TransactionDTO transactionDTO){
        TransactionDTO addOrUpdateTransactionDTO = customerService.saveOrUpdateTransaction(transactionDTO);
        return  ResponseEntity.ok("ok");
    }
}
