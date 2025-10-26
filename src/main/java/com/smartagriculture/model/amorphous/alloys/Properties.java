package com.smartagriculture.model.amorphous.alloys;

import java.io.Serializable;

public class Properties implements Serializable {
    private double hardness;
    private double strength;
    private double corrosion_resistance;

    // 必须有无参构造函数
    public Properties() {}

    // getters and setters
    public double getHardness() {
        return hardness;
    }

    public void setHardness(double hardness) {
        this.hardness = hardness;
    }

    public double getStrength() {
        return strength;
    }

    public void setStrength(double strength) {
        this.strength = strength;
    }

    public double getCorrosion_resistance() {
        return corrosion_resistance;
    }

    public void setCorrosion_resistance(double corrosion_resistance) {
        this.corrosion_resistance = corrosion_resistance;
    }
}