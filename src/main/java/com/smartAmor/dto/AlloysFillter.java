package com.smartAmor.dto;

import com.smartAmor.utils.NumberRange;
import lombok.Data;

@Data
public class AlloysFillter {
    String name;
    NumberRange hardness;
    NumberRange strength;
    Double corrosionResistance;
}
