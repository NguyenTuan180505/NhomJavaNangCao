package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
@Repository
public class CustomerRepositoryCustomImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    @Override
    public List<CustomerEntity> findCustomers(CustomerSearchRequest request) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<CustomerEntity> query = cb.createQuery(CustomerEntity.class);
        Root<CustomerEntity> root = query.from(CustomerEntity.class);

        List<Predicate> predicates = new ArrayList<>();

        if (request.getName() != null && !request.getName().isEmpty()) {
            predicates.add(cb.like(cb.lower(root.get("fullname")), "%" + request.getName().toLowerCase() + "%"));
        }

        if (request.getPhone() != null && !request.getPhone().isEmpty()) {
            predicates.add(cb.equal(root.get("phone"), request.getPhone()));
        }

        if (request.getEmail() != null && !request.getEmail().isEmpty()) {
            predicates.add(cb.equal(root.get("email"), request.getEmail()));
        }

        if (request.getStaffId() != null) {
            Join<CustomerEntity, UserEntity> userJoin = root.join("users", JoinType.INNER);
            predicates.add(cb.equal(userJoin.get("id"), request.getStaffId()));
        }

        query.select(root).where(cb.and(predicates.toArray(new Predicate[0])));
        return entityManager.createQuery(query).getResultList();
    }

    @Override
    public void deleteCustomersByIds(List<Long> ids) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaDelete<CustomerEntity> delete = cb.createCriteriaDelete(CustomerEntity.class);
        Root<CustomerEntity> root = delete.from(CustomerEntity.class);
        delete.where(root.get("id").in(ids));
        entityManager.createQuery(delete).executeUpdate();
    }
}
