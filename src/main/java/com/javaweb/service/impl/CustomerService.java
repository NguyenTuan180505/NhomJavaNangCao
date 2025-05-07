package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.ICustomerService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CustomerService implements ICustomerService {
    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private JavaMailSender emailSender;

    @Override
    public List<CustomerDTO> searchBuildings(CustomerSearchRequest request) {
        List<CustomerEntity> entities = customerRepository.findCustomers(request);
        return entities.stream().map(CustomerDTO::new).collect(Collectors.toList());
    }

    @Override
    public ResponseDTO listStaffs(Long customerId) {
        CustomerEntity customerEntity = customerRepository.findById(customerId).get();
//        System.out.println(customerEntity);
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<UserEntity> staffAssigment = customerEntity.getUsers();
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for (UserEntity it: staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());
            if(staffAssigment.contains(it)){
                staffResponseDTO.setChecked("checked");
            } else {
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public void assignStaffToCustomer(AssignmentCustomerDTO assignmentCustomerDTO) {
        Long customerId = assignmentCustomerDTO.getCustomerId();
        List<Long> staffIds = assignmentCustomerDTO.getStaffs();
        CustomerEntity customer = customerRepository.findById(customerId)
                .orElseThrow(()-> new RuntimeException("Building not found"));
        List<UserEntity> staffs = userRepository.findAllById(staffIds);
        for (UserEntity user : customer.getUsers()){
            user.getCustomers().remove(customer);
        }
        for (UserEntity staff : staffs){
            staff.getCustomers().add(customer);
        }
        customer.getUsers().addAll(staffs);
        userRepository.saveAll(staffs);
        customerRepository.save(customer);
    }

    @Override
    public CustomerDTO findbyId(Long id) {
        Optional<CustomerEntity> customerEntityOpt = customerRepository.findById(id);
        if (customerEntityOpt.isPresent()) {
            CustomerEntity customerEntity = customerEntityOpt.get();
            CustomerDTO customerDTO = new CustomerDTO(customerEntity);
            return customerDTO;
        }
        return null;
    }

    @Override
    public CustomerDTO saveOrUpdate(CustomerDTO customerDTO) {
        CustomerEntity customerEntity;
        if (customerDTO.getId() != null) {
            Optional<CustomerEntity> optionalCustomer = customerRepository.findById(customerDTO.getId());
            if (optionalCustomer.isPresent()) {
                customerEntity = optionalCustomer.get();
            } else {
                throw new RuntimeException("Customer not found with id: " + customerDTO.getId());
            }
        } else {
            customerEntity = new CustomerEntity();
            sendEmailNotification(customerDTO);
        }
        modelMapper.map(customerDTO, customerEntity);
        customerEntity = customerRepository.save(customerEntity);
        return modelMapper.map(customerEntity, CustomerDTO.class);
    }

    @Transactional
    @Override
    public void deleteCustomers(List<Long> customerIds) {
        transactionRepository.deleteTransactionByCustomerIds(customerIds);
        customerRepository.deleteCustomersByIds(customerIds);
    }

    @Override
    public List<TransactionDTO> findTransactionDTOsByCustomerId(Long customerId) {
        Optional<CustomerEntity> customerEntityOpt = customerRepository.findById(customerId);
        if (customerEntityOpt.isPresent()) {
            CustomerEntity customerEntity = customerEntityOpt.get();
            return customerEntity.getTransactions()
                    .stream()
                    .map(TransactionDTO::new)
                    .collect(Collectors.toList());
        }
        return new ArrayList<>();
    }

    @Override
    public TransactionDTO saveOrUpdateTransaction(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity;
        if (transactionDTO.getId() != null) {
            transactionEntity = transactionRepository.findById(transactionDTO.getId())
                    .orElseThrow(() -> new RuntimeException("Transaction not found"));
        } else {
            transactionEntity = new TransactionEntity();
        }
        modelMapper.map(transactionDTO, transactionEntity);
        CustomerEntity customer = customerRepository.findById(transactionDTO.getCustomerId())
                .orElseThrow(() -> new RuntimeException("Customer not found"));
        transactionEntity.setCustomer(customer);
        transactionEntity = transactionRepository.save(transactionEntity);
        return modelMapper.map(transactionEntity, TransactionDTO.class);
    }

    private void sendEmailNotification(CustomerDTO customerDTO) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo("Huy210105@gmail.com");
        message.setSubject("Thông báo: Người dùng đã liên hệ");
        message.setText("Có người dùng vừa gửi thông tin liên hệ:\n" +
                "Họ và tên: " + customerDTO.getName() + "\n" +
                "Email: " + customerDTO.getEmail() + "\n" +
                "Số điện thoại: " + customerDTO.getCustomerPhone() + "\n" +
                "Nhu cầu: " + customerDTO.getDemand());
        emailSender.send(message);
    }
}
