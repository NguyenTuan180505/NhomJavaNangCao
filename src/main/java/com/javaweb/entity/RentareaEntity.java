package com.javaweb.entity;

import javax.persistence.*;

@Entity
@Table(name = "rentarea")
public class RentareaEntity extends BaseEntity {
    private Integer value;

    @ManyToOne
    @JoinColumn(name = "buildingid",referencedColumnName = "id")
    private BuildingEntity building;

    // Getters and Setters

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public BuildingEntity getBuilding() {
        return building;
    }

    public void setBuilding(BuildingEntity building) {
        this.building = building;
    }

}
