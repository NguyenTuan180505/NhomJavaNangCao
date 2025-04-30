package com.javaweb.model.dto;

import com.javaweb.entity.TransactionEntity;

public class TransactionDTO extends AbstractDTO{
    private String code;
    private String note;
    private Long customerId;

    public TransactionDTO() {
    }

    public TransactionDTO(TransactionEntity transactionEntity) {
        if (transactionEntity != null) {
            this.setId(transactionEntity.getId());
            this.code = transactionEntity.getCode();
            this.note = transactionEntity.getNote();
            if (transactionEntity.getCustomer() != null) {
                this.customerId = transactionEntity.getCustomer().getId();
            }
            this.setCreatedBy(transactionEntity.getCreatedBy());
            this.setCreatedDate(transactionEntity.getCreatedDate());
            this.setModifiedBy(transactionEntity.getModifiedBy());
            this.setModifiedDate(transactionEntity.getModifiedDate());
        }
    }
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }
}
