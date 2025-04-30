package com.javaweb.model.dto;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentareaEntity;

import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

public class BuildingDTO extends AbstractDTO{
    private Long id;
    private String name;
    private String street;
    private String ward;
    private String district;
    private Long numberOfBasement;
    private Integer floorArea;
    private String level;
    private List<String> typeCode;
    private String overtimeFee;
    private String electricityFee;
    private String deposit;
    private String payment;
    private String rentTime;
    private String decorationTime;
    private String rentPriceDescription;
    private String carFee;
    private String motoFee;
    private String structure;
    private String direction;
    private String note;
    private String rentArea;
    private String managerName;
    private String managerPhone;
    private Integer rentPrice;
    private String serviceFee;
    private BigDecimal brokerageFee;
    private List<Integer> rentAreas;
    private String image;
    private String imageBase64;
    private String imageName;
    public BuildingDTO(BuildingEntity entity) {
        System.out.println("BuildingEntity: " + entity);
        this.id = entity.getId();
        this.name = (entity.getName() != null) ? entity.getName() : "";
        this.street = (entity.getStreet() != null) ? entity.getStreet() : "";
        this.ward = (entity.getWard() != null) ? entity.getWard() : "";
        this.district = (entity.getDistrict() != null) ? entity.getDistrict() : "";
        this.numberOfBasement = (entity.getNumberOfBasement() != null) ? Long.valueOf(entity.getNumberOfBasement()) : 0L;
        this.floorArea = (entity.getFloorArea() != null) ? entity.getFloorArea() : 0;
        this.level = (entity.getLevel() != null) ? entity.getLevel() : "";
        this.managerName = (entity.getManagerName() != null) ? entity.getManagerName() : "";
        this.managerPhone = (entity.getManagerPhone() != null) ? entity.getManagerPhone() : "";
        this.rentPrice = (entity.getRentPrice() != null) ? entity.getRentPrice() : 0;
        this.serviceFee = (entity.getServiceFee() != null) ? entity.getServiceFee() : "";
        this.brokerageFee = (entity.getBrokerageFee() != null) ? entity.getBrokerageFee() : BigDecimal.ZERO;
        this.image = ("/uploads"+entity.getLinkOfBuilding());
        this.rentAreas = (entity.getRentareas() != null) ?
                entity.getRentareas().stream().map(RentareaEntity::getValue).collect(Collectors.toList()) :
                new ArrayList<>();

        this.typeCode = (entity.getType() != null && !entity.getType().isEmpty()) ?
                Arrays.asList(entity.getType().split(",")) : new ArrayList<>();
    }



    public BuildingDTO(){
    }

    private Map<String,String> buildingDTOs = new HashMap<>();

    public Map<String, String> getBuildingDTOs() {
        return buildingDTOs;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public void setBuildingDTOs(Map<String, String> buildingDTOs) {
        this.buildingDTOs = buildingDTOs;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getStructure() {
        return structure;
    }


    public void setStructure(String structure) {
        this.structure = structure;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getImageBase64() {
        if (imageBase64 != null) {
            if (!imageBase64.startsWith("data:image/")) {
                imageBase64 = "data:image/png;base64," + imageBase64;
            }

            String[] parts = imageBase64.split(",");
            if (parts.length > 1) {
                return parts[1];  // Trả về phần dữ liệu ảnh Base64
            }
        }
        return null;
    }


    public void setImageBase64(String imageBase64) {
        this.imageBase64 = imageBase64;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRentArea() {
        return rentArea;
    }

    public void setRentArea(String rentArea) {
        this.rentArea = rentArea;
    }

    public Integer getFloorArea() {
        return floorArea;
    }

    public void setFloorArea(Integer floorArea) {
        this.floorArea = floorArea;
    }

    public Long getNumberOfBasement() {
        return numberOfBasement;
    }

    public void setNumberOfBasement(Long numberOfBasement) {
        this.numberOfBasement = numberOfBasement;
    }

    public List<String> getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(List<String> typeCode) {
        this.typeCode = typeCode;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public String getManagerPhone() {
        return managerPhone;
    }

    public void setManagerPhone(String managerPhone) {
        this.managerPhone = managerPhone;
    }

    public String getServiceFee() {
        return serviceFee;
    }

    public void setServiceFee(String serviceFee) {
        this.serviceFee = serviceFee;
    }

    public BigDecimal getBrokerageFee() {
        return brokerageFee;
    }

    public void setBrokerageFee(BigDecimal brokerageFee) {
        this.brokerageFee = brokerageFee;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getRentPriceDescription() {
        return rentPriceDescription;
    }

    public void setRentPriceDescription(String rentPriceDescription) {
        this.rentPriceDescription = rentPriceDescription;
    }

    public String getCarFee() {
        return carFee;
    }

    public void setCarFee(String carFee) {
        this.carFee = carFee;
    }

    public String getMotoFee() {
        return motoFee;
    }

    public void setMotoFee(String motoFee) {
        this.motoFee = motoFee;
    }

    public String getOvertimeFee() {
        return overtimeFee;
    }

    public void setOvertimeFee(String overtimeFee) {
        this.overtimeFee = overtimeFee;
    }

    public String getElectricityFee() {
        return electricityFee;
    }

    public void setElectricityFee(String electricityFee) {
        this.electricityFee = electricityFee;
    }

    public String getDeposit() {
        return deposit;
    }

    public void setDeposit(String deposit) {
        this.deposit = deposit;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getRentTime() {
        return rentTime;
    }

    public void setRentTime(String rentTime) {
        this.rentTime = rentTime;
    }

    public String getDecorationTime() {
        return decorationTime;
    }

    public void setDecorationTime(String decorationTime) {
        this.decorationTime = decorationTime;
    }

    public Integer getRentPrice() {
        return rentPrice;
    }

    public void setRentPrice(Integer rentPrice) {
        this.rentPrice = rentPrice;
    }

    public List<Integer> getRentAreas() {
        return rentAreas;
    }

    public void setRentAreas(List<Integer> rentAreas) {
        this.rentAreas = rentAreas;
    }
}