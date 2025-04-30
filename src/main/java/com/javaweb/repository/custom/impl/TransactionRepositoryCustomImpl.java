package com.javaweb.repository.custom.impl;

import com.javaweb.entity.TransactionEntity;

import com.javaweb.repository.custom.TransactionRepositoryCustom;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.Root;
import java.util.List;

public class TransactionRepositoryCustomImpl implements TransactionRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    @Override
    public void deleteTransactionByCustomerIds(List<Long> customerIds) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaDelete<TransactionEntity> delete = cb.createCriteriaDelete(TransactionEntity.class);
        Root<TransactionEntity> root = delete.from(TransactionEntity.class);
        delete.where(root.get("customer").get("id").in(customerIds));
        entityManager.createQuery(delete).executeUpdate();
    }
}
