package com.javaweb.controller.admin;

import com.javaweb.enums.Transaction;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.impl.CustomerService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value = "CustomerControllerOfAdmin")
public class CustomerController {
    @Autowired
    private UserService userService;
    @Autowired
    private CustomerService customerService;
    @GetMapping(value = "/admin/customer-list")
    public ModelAndView CustomerList(@ModelAttribute CustomerSearchRequest customerSearchRequest, HttpServletRequest request ){
        ModelAndView mav = new ModelAndView("admin/customer/list");
        mav.addObject("modelSearchRequest", customerSearchRequest);
        mav.addObject("listStaffs", userService.getStaffs());
        if (SecurityUtils.getAuthorities().contains("ROLE_STAFF")) {
            Long staffId = SecurityUtils.getPrincipal().getId();
            customerSearchRequest.setStaffId(staffId);
            List<CustomerDTO> CustomerDTOList = customerService.searchBuildings(customerSearchRequest);
            mav.addObject("CustomerList",CustomerDTOList);
        } else {
            List<CustomerDTO> CustomerDTOList = customerService.searchBuildings(customerSearchRequest);
            mav.addObject("CustomerList",CustomerDTOList);
        }
        return mav;
    }

    @GetMapping(value = "/admin/customer-edit")
    public ModelAndView customerEdit(HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerDTO customerDTO = new CustomerDTO();
        mav.addObject("customerEdit",customerDTO);
        return mav;
    }

    @GetMapping("/admin/customer-edit-{id}")
    public ModelAndView customerEdit(@PathVariable("id") Long id,HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerDTO customerDTO = customerService.findbyId(id);
        List<TransactionDTO> transactionDTOList = customerService.findTransactionDTOsByCustomerId(id);
        mav.addObject("transactionList",transactionDTOList);
        mav.addObject("transactionType", Transaction.type());
        mav.addObject("customerEdit",customerDTO);
        return mav;
    }
}
