package com.javaweb.model.dto;

import com.javaweb.entity.CustomerEntity;

public class CustomerDTO extends AbstractDTO{
    private Long id;
    private String name;
    private String managementStaff;
    private String customerPhone;
    private String email;
    private String demand;
    private String status;
    private String companyName;

    public CustomerDTO() {
    }

    public CustomerDTO(CustomerEntity entity) {
        System.out.println("CustomerEntity: " + entity);
        this.id = entity.getId();
        this.name = (entity.getFullname() != null) ? entity.getFullname() : "";
        this.customerPhone = (entity.getPhone() != null) ? entity.getPhone() : "";
        this.email = (entity.getEmail() != null) ? entity.getEmail() : "";
        this.demand = (entity.getDemand() != null) ? entity.getDemand() : "";
        this.status = (entity.getStatus() != null) ? entity.getStatus() : "";
        this.companyName = (entity.getCompanyName() != null) ? entity.getCompanyName() : "";
        // Assuming `users` is not needed in the DTO, you can omit it or map accordingly if needed
        this.managementStaff = (entity.getUsers() != null && !entity.getUsers().isEmpty()) ?
                entity.getUsers().get(0).getFullName() : ""; // Just an example, adapt as needed
        this.setCreatedBy(entity.getCreatedBy());
        this.setCreatedDate(entity.getCreatedDate());
        this.setModifiedBy(entity.getModifiedBy());
        this.setModifiedDate(entity.getModifiedDate());
    }
    public String getCompanyName() {
        return companyName;
    }

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getManagementStaff() {
        return managementStaff;
    }

    public void setManagementStaff(String managementStaff) {
        this.managementStaff = managementStaff;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDemand() {
        return demand;
    }

    public void setDemand(String demand) {
        this.demand = demand;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
