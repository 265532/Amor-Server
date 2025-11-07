package com.smartAmor.dto;

import com.smartAmor.utils.NumberRange;
import lombok.Data;

@Data
public class AlloysFilter {
    Integer baseTypeId;
    NumberRange hardness;
    NumberRange strength;
    Double corrosionResistance;
}
