package com.smartAmor.utils;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class NumberRange {
    private Double min;
    private Double max;

    public NumberRange(Double min, Double max) {
        this.min = min;
        this.max = max;
    }

}