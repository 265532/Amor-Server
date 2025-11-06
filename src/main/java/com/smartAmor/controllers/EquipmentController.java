package com.smartAmor.controllers;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.smartAmor.entity.EquipmentEntity;
import com.smartAmor.services.interfaces.EquipmentService;
import com.smartAmor.utils.ApiResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Slf4j
@Validated
@RestController
@RequestMapping("/api/equipment")
public class EquipmentController {
    @Autowired
    private EquipmentService productionBatchService;

    @GetMapping("/{id}")
    public ApiResponse<EquipmentEntity> getEquipmentById(
            @PathVariable("id") int id) {
        log.info("根据ID查询设备: {}", id);
        EquipmentEntity result = productionBatchService.getInfoById(id);
        if (result == null) return ApiResponse.notFound("设备不存在");
        return ApiResponse.success("设备获取成功", result);
    }

    @GetMapping("/list")
    public ApiResponse<List<EquipmentEntity>> getEquipmentesAll() {
        log.info("查询设备列表");
        List<EquipmentEntity> result = productionBatchService.getAll();
        return ApiResponse.success("设备列表获取成功", result);
    }

    @GetMapping("/list/page")
    public ApiResponse<Page<EquipmentEntity>> getEquipmentesByPage(
            @RequestParam(value = "startPage", defaultValue = "1") int startPage,
            @RequestParam(value = "size", defaultValue = "10") int size) {
        log.info("查询设备列表");
        Page<EquipmentEntity> result = productionBatchService.getListByPage(startPage, size);
        return ApiResponse.success("设备列表获取成功", result);
    }

    @PostMapping("/create")
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<EquipmentEntity> createEquipment(@Valid @RequestBody EquipmentEntity body) {
        log.info("创建设备: {}", body);
        EquipmentEntity result = productionBatchService.create(body);
        return ApiResponse.success("设备创建成功", result);
    }

    @PutMapping("/update")
    public ApiResponse<EquipmentEntity> updateEquipment(@Valid @RequestBody EquipmentEntity body) {
        log.info("更新设备: {}", body);
        EquipmentEntity result = productionBatchService.update(body);
        return ApiResponse.success("设备更新成功", result);
    }

    @DeleteMapping("/delete")
    public ApiResponse<Void> deleteEquipment(@RequestParam("id") int id) {
        log.info("删除设备: {}", id);
        productionBatchService.delete(id);
        return ApiResponse.success("设备删除成功");
    }
}
