package com.javaweb.repository;

import com.javaweb.entity.RentareaEntity;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.repository.custom.RentareaRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RentareaRepository extends JpaRepository<RentareaEntity, Long>, RentareaRepositoryCustom {
    // Xóa tất cả RentareaEntity có buildingId tương ứng
    void deleteByBuildingId(Long buildingId);
}