package com.javaweb.repository.custom.impl;

import com.javaweb.entity.RentareaEntity;
import com.javaweb.repository.custom.RentareaRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
public class RentareaRepositoryCustomImpl implements RentareaRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void deleteRentareasWithoutBuildingId() {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaDelete<RentareaEntity> delete = cb.createCriteriaDelete(RentareaEntity.class);
        Root<RentareaEntity> root = delete.from(RentareaEntity.class);
        delete.where(cb.isNull(root.get("building")));
        entityManager.createQuery(delete).executeUpdate();
    }

    @Override
    public void deleteRentareasByBuildingIds(List<Long> buildingIds) {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaDelete<RentareaEntity> delete = cb.createCriteriaDelete(RentareaEntity.class);
        Root<RentareaEntity> root = delete.from(RentareaEntity.class);
        delete.where(root.get("building").get("id").in(buildingIds));
        entityManager.createQuery(delete).executeUpdate();
    }
}
