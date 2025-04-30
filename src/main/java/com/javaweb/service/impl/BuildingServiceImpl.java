package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentareaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentareaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IBuildingService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Transactional
public class BuildingServiceImpl implements IBuildingService {
    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private RentareaRepository rentareaRepository;

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        BuildingEntity building = buildingRepository.findById(buildingId).get();
        System.out.println(building);
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssigment = building.getUsers();
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for (UserEntity it : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());
            if (staffAssigment.contains(it)) {
                staffResponseDTO.setChecked("checked");
            } else {
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public List<BuildingDTO> searchBuildings(BuildingSearchRequest request) {
        List<BuildingEntity> entities = buildingRepository.findBuildings(request);

        return entities.stream().map(BuildingDTO::new).collect(Collectors.toList());
    }


    @Override
    public void assignStaffToBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        Long buildingId = assignmentBuildingDTO.getBuildingId();
        List<Long> staffIds = assignmentBuildingDTO.getStaffs();
        BuildingEntity building = buildingRepository.findById(buildingId)
                .orElseThrow(() -> new RuntimeException("Building not found"));
        List<UserEntity> staffs = userRepository.findAllById(staffIds);
        for (UserEntity user : building.getUsers()) {
            user.getBuildings().remove(building);
        }
        building.getUsers().clear();
        for (UserEntity staff : staffs) {
            staff.getBuildings().add(building);
        }
        building.getUsers().addAll(staffs);
        userRepository.saveAll(staffs);
        buildingRepository.save(building);
    }

    @Override
    public BuildingDTO saveOrUpdate(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity;
        if (buildingDTO.getId() != null) {
            Optional<BuildingEntity> optionalBuilding = buildingRepository.findById(buildingDTO.getId());
            if (optionalBuilding.isPresent()) {
                buildingEntity = optionalBuilding.get();
            } else {
                throw new RuntimeException("Building not found with id: " + buildingDTO.getId());
            }
        } else {
            buildingEntity = new BuildingEntity();
        }
        modelMapper.map(buildingDTO, buildingEntity);
        if (buildingDTO.getTypeCode() != null) {
            String typeString = String.join(",", buildingDTO.getTypeCode());
            buildingEntity.setType(typeString);
        }
        if (buildingDTO.getRentArea() != null && !buildingDTO.getRentArea().isEmpty()) {
            String[] rentAreaValues = buildingDTO.getRentArea().split(",");
            Set<Integer> uniqueRentAreas = new HashSet<>();
            for (String rentArea : rentAreaValues) {
                try {
                    uniqueRentAreas.add(Integer.parseInt(rentArea.trim()));
                } catch (NumberFormatException e) {
                    continue;
                }
            }
            rentareaRepository.deleteByBuildingId(buildingEntity.getId());
            List<RentareaEntity> rentareaEntities = new ArrayList<>();
            for (Integer rentAreaValue : uniqueRentAreas) {
                RentareaEntity rentareaEntity = new RentareaEntity();
                rentareaEntity.setValue(rentAreaValue);
                rentareaEntity.setBuilding(buildingEntity);
                rentareaEntities.add(rentareaEntity);
            }
            buildingEntity.setRentareas(rentareaEntities);
        }
        rentareaRepository.deleteRentareasWithoutBuildingId();
        buildingEntity = buildingRepository.save(buildingEntity);
        saveThumbnail(buildingDTO, buildingEntity);
        return modelMapper.map(buildingEntity, BuildingDTO.class);
    }
    @Override
    public BuildingDTO findById(Long id) {
        Optional<BuildingEntity> buildingEntityOpt = buildingRepository.findById(id);
        if (buildingEntityOpt.isPresent()) {
            BuildingEntity buildingEntity = buildingEntityOpt.get();
            BuildingDTO buildingDTO = new BuildingDTO(buildingEntity);
            String imageUrl = buildingEntity.getLinkOfBuilding();
            if (buildingEntity.getLinkOfBuilding() != null) {
                buildingDTO.setImage("/uploads" + imageUrl);
            }
            List<Integer> rentAreas = buildingEntity.getRentareas().stream()
                    .map(rentArea -> rentArea.getValue())
                    .collect(Collectors.toList());
            if (!rentAreas.isEmpty()) {
                String rentAreasString = rentAreas.stream()
                        .map(String::valueOf)
                        .collect(Collectors.joining(","));
                buildingDTO.setRentArea(rentAreasString);
            } else {
                buildingDTO.setRentArea("");
            }

            return buildingDTO;
        } else {
            return null;
        }
    }
    @Transactional
    @Override
    public void deleteBuildings(List<Long> buildingIds) {
        rentareaRepository.deleteRentareasByBuildingIds(buildingIds);
        buildingRepository.deleteBuildingsByIds(buildingIds);
    }

    public void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String path = "/building/" + buildingDTO.getImageName();
        if (buildingDTO.getImageBase64() != null) {
            if (buildingEntity.getLinkOfBuilding() != null) {
                File oldFile = new File("D:/uploads/building" + buildingEntity.getLinkOfBuilding());
                oldFile.delete();
            }
            byte[] bytes = Base64.getDecoder().decode(buildingDTO.getImageBase64());
            String filePath = "D:/uploads/building" + path;
            try {
                File file = new File(filePath);
                try (FileOutputStream fileOutputStream = new FileOutputStream(file)) {
                    fileOutputStream.write(bytes);
                    fileOutputStream.flush();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

            buildingEntity.setLinkOfBuilding(path);  // Lưu đường dẫn ảnh vào entity
        }
    }


}
