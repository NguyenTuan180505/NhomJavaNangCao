package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentareaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class BuildingRepositoryCustomImpl implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<BuildingEntity> findBuildings(BuildingSearchRequest request) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<BuildingEntity> query = cb.createQuery(BuildingEntity.class);
        Root<BuildingEntity> root = query.from(BuildingEntity.class);

        List<Predicate> predicates = new ArrayList<>();

        // Tìm kiếm theo tên
        if (request.getName() != null && !request.getName().isEmpty()) {
            predicates.add(cb.like(cb.lower(root.get("name")), "%" + request.getName().toLowerCase() + "%"));
        }

        // Tìm kiếm theo quận
        if (request.getDistrict() != null && !request.getDistrict().isEmpty()) {
            predicates.add(cb.equal(root.get("district"), request.getDistrict()));
        }

        // Tìm kiếm theo số tầng hầm
        if (request.getNumberOfBasement() != null) {
            predicates.add(cb.equal(root.get("numberOfBasement"), request.getNumberOfBasement()));
        }

        // Tìm kiếm theo đường
        if (request.getStreet() != null && !request.getStreet().isEmpty()) {
            predicates.add(cb.equal(root.get("street"), request.getStreet()));
        }

        // Tìm kiếm theo phường
        if (request.getWard() != null && !request.getWard().isEmpty()) {
            predicates.add(cb.equal(root.get("ward"), request.getWard()));
        }

        // Tìm kiếm theo tên người quản lý
        if (request.getManagerName() != null && !request.getManagerName().isEmpty()) {
            predicates.add(cb.equal(root.get("managerName"), request.getManagerName()));
        }

        // Tìm kiếm theo số điện thoại của người quản lý
        if (request.getManagerPhone() != null && !request.getManagerPhone().isEmpty()) {
            predicates.add(cb.equal(root.get("managerPhone"), request.getManagerPhone()));
        }

        // Tìm kiếm theo loại mã
        if (request.getTypeCode() != null && !request.getTypeCode().isEmpty()) {
            CriteriaBuilder.In<String> typePredicate = cb.in(root.get("type"));
            for (String type : request.getTypeCode()) {
                typePredicate.value(type);
            }
            predicates.add(typePredicate);
        }

        // Tìm kiếm theo diện tích sàn
        if (request.getFloorArea() != null) {
            predicates.add(cb.equal(root.get("floorArea"), request.getFloorArea()));
        }

        // Tìm kiếm theo giá thuê (rentPrice)
        if (request.getRentPriceFrom() != null) {
            predicates.add(cb.greaterThanOrEqualTo(root.get("rentPrice"), request.getRentPriceFrom()));
        }
        if (request.getRentPriceTo() != null) {
            predicates.add(cb.lessThanOrEqualTo(root.get("rentPrice"), request.getRentPriceTo()));
        }

        // Tìm kiếm theo User (Nhân viên quản lý tòa nhà)
        if (request.getStaffId() != null) {
            Join<BuildingEntity, UserEntity> userJoin = root.join("users", JoinType.INNER);
            predicates.add(cb.equal(userJoin.get("id"), request.getStaffId()));
        }

        // Tìm kiếm theo diện tích thuê (JOIN với RentareaEntity)
        if (request.getAreaFrom() != null || request.getAreaTo() != null) {
            Join<BuildingEntity, RentareaEntity> rentareaJoin = root.join("rentareas", JoinType.LEFT);
            if (request.getAreaFrom() != null) {
                predicates.add(cb.greaterThan(rentareaJoin.get("value"), request.getAreaFrom()));
            }
            if (request.getAreaTo() != null) {
                predicates.add(cb.lessThan(rentareaJoin.get("value"), request.getAreaTo()));
            }
        }

        // Áp dụng các predicate và trả về kết quả
        query.select(root).where(cb.and(predicates.toArray(new Predicate[0]))).distinct(true);
        return entityManager.createQuery(query).getResultList();
    }

    @Override
    public void deleteBuildingsByIds(List<Long> ids) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaDelete<BuildingEntity> delete = cb.createCriteriaDelete(BuildingEntity.class);
        Root<BuildingEntity> root = delete.from(BuildingEntity.class);
        delete.where(root.get("id").in(ids));
        entityManager.createQuery(delete).executeUpdate();
    }
}
