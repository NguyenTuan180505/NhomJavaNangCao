package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IBuildingService {
    ResponseDTO listStaffs(Long buildingId);
//    Page<BuildingDTO> searchBuildings(BuildingSearchRequest request, Pageable pageable);

        List<BuildingDTO> searchBuildings(BuildingSearchRequest request);
    void assignStaffToBuilding(AssignmentBuildingDTO assignmentBuildingDTO);

    BuildingDTO saveOrUpdate(BuildingDTO buildingDTO);

    BuildingDTO findById(Long id);

    void deleteBuildings(List<Long> buildingIds);

}
