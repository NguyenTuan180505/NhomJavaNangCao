package com.javaweb.controller.appAdmin;

import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.service.impl.BuildingServiceImpl;
import com.javaweb.service.impl.UserService;
import com.javaweb.utils.BuildingType;
import com.javaweb.utils.DistrictCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController("appApiAdmin")
@RequestMapping("/api/admin")
public class BuildingApiController {
    @Autowired
    private UserService userService;

    @Autowired
    private BuildingServiceImpl buildingService;

    @GetMapping("/building-list")
    public ResponseEntity<Map<String, Object>> buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest) {
        List<BuildingDTO> buildingDTOList = buildingService.searchBuildings(buildingSearchRequest);
        Map<String, Object> response = new HashMap<>();
        response.put("modelSearchRequest", buildingSearchRequest);
        response.put("buildingList", buildingDTOList);
        response.put("listStaffs", userService.getStaffs());
        response.put("districts", districtCode.type());
        response.put("typeCodes", buildingType.type());
        return ResponseEntity.ok(response);
    }
}
