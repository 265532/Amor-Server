package com.smartAmor.controllers;

import com.smartAmor.entity.BaseTypesEntity;
import com.smartAmor.services.interfaces.BaseTypesService;
import com.smartAmor.utils.ApiResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Validated
@RestController
@RequestMapping("/api/base_types")
public class BaseTypeController {
    private static final Logger logger = LoggerFactory.getLogger(BaseTypeController.class);
    private final BaseTypesService baseTypesService;

    public BaseTypeController(BaseTypesService baseTypesService) {
        this.baseTypesService = baseTypesService;
    }

    @GetMapping("/{id}")
    public ApiResponse<BaseTypesEntity> getBaseTypeById(
            @PathVariable("id") int id) {
        logger.info("根据ID查询基体类型: {}", id);
        BaseTypesEntity result = baseTypesService.getInfoById(id);
        if (result == null) return ApiResponse.notFound("基体类型不存在");
        return ApiResponse.success("基体类型获取成功", result);
    }

    @GetMapping("/list")
    public ApiResponse<List<BaseTypesEntity>> getBaseTypes() {
        logger.info("查询基体类型列表");
        List<BaseTypesEntity> result = baseTypesService.getAll();
        return ApiResponse.success("基体类型列表获取成功", result);
    }
}
