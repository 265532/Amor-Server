package com.smartAmor.controllers;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.smartAmor.entity.ProductionBatchEntity;
import com.smartAmor.services.interfaces.ProductionBatchService;
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
@RequestMapping("/api/production_batches")
public class ProductionBatchController {
    @Autowired
    private ProductionBatchService productionBatchService;

    @GetMapping("/{id}")
    public ApiResponse<ProductionBatchEntity> getProductionBatchById(
            @PathVariable("id") int id) {
        log.info("根据ID查询生产批次: {}", id);
        ProductionBatchEntity result = productionBatchService.getInfoById(id);
        if (result == null) return ApiResponse.notFound("生产批次不存在");
        return ApiResponse.success("生产批次获取成功", result);
    }

    @GetMapping("/batchNo/{id}")
    public ApiResponse<ProductionBatchEntity> getProductionBatchByBatchNo(
            @PathVariable("id") String batchNo) {
        log.info("根据ID查询生产批次: {}", batchNo);
        ProductionBatchEntity result = productionBatchService.getInfoByBatchNo(batchNo);
        if (result == null) return ApiResponse.notFound("生产批次不存在");
        return ApiResponse.success("生产批次获取成功", result);
    }

    @GetMapping("/list")
    public ApiResponse<List<ProductionBatchEntity>> getProductionBatches() {
        log.info("查询生产批次列表");
        List<ProductionBatchEntity> result = productionBatchService.getAll();
        return ApiResponse.success("生产批次列表获取成功", result);
    }

    @GetMapping("/list/page")
    public ApiResponse<Page<ProductionBatchEntity>> getProductionBatchesByPage(
            @RequestParam(value = "startPage", defaultValue = "1") int startPage,
            @RequestParam(value = "size", defaultValue = "10") int size) {
        log.info("查询生产批次列表");
        Page<ProductionBatchEntity> result = productionBatchService.getListByPage(startPage, size);
        return ApiResponse.success("生产批次列表获取成功", result);
    }

    @PostMapping("/create")
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<ProductionBatchEntity> createProductionBatch(@Valid @RequestBody ProductionBatchEntity body) {
        log.info("创建生产批次: {}", body);
        ProductionBatchEntity result = productionBatchService.create(body);
        return ApiResponse.success("生产批次创建成功", result);
    }

    @PutMapping("/update")
    public ApiResponse<ProductionBatchEntity> updateProductionBatch(@Valid @RequestBody ProductionBatchEntity body) {
        log.info("更新生产批次: {}", body);
        ProductionBatchEntity result = productionBatchService.update(body);
        return ApiResponse.success("生产批次更新成功", result);
    }

    @DeleteMapping("/delete")
    public ApiResponse<Void> deleteProductionBatch(@RequestParam("id") int id) {
        log.info("删除生产批次: {}", id);
        productionBatchService.delete(id);
        return ApiResponse.success("生产批次删除成功");
    }
}
