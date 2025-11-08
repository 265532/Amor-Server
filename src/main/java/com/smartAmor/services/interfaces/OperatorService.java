package com.smartAmor.services.interfaces;

import com.smartAmor.entity.OperatorEntity;

public interface OperatorService extends BaseService<OperatorEntity> {

    OperatorEntity getInfoByEmployeeId(String employeeId);
}
