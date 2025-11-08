package com.smartAmor.services;

import com.smartAmor.entity.OperatorEntity;
import com.smartAmor.mapper.OperatorMapper;
import com.smartAmor.services.interfaces.OperatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OperatorServiceImpl extends BaseServiceImpl<OperatorEntity, OperatorMapper>
        implements OperatorService {

    @Autowired
    private OperatorMapper operatorMapper;
    @Override
    public OperatorEntity getInfoByEmployeeId(String employeeId) {
        return operatorMapper.selectByEmployeeId(employeeId);
    }
}
