package com.javaweb.repository.custom;

import java.util.List;

public interface RentareaRepositoryCustom {
    void deleteRentareasWithoutBuildingId();

    void deleteRentareasByBuildingIds(List<Long> buildingIds);
}
