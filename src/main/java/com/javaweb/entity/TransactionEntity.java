package com.javaweb.entity;

import javax.persistence.*;

@Entity
@Table(name = "[transaction]")
public class TransactionEntity extends BaseEntity{
    @Column(name = "code")
    private String code;
    @Column(name = "note")
    private String note;
    @ManyToOne
    @JoinColumn(name = "customerid", referencedColumnName = "id")
    private CustomerEntity customer;

    public CustomerEntity getCustomer() {
        return customer;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public void setCustomer(CustomerEntity customer) {
        this.customer = customer;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
