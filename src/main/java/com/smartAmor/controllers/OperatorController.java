package com.smartAmor.controllers;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.smartAmor.entity.OperatorEntity;
import com.smartAmor.services.interfaces.OperatorService;
import com.smartAmor.utils.ApiResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Slf4j
@Validated
@RestController
@RequestMapping("/api/operator")
public class OperatorController {
    @Autowired
    private OperatorService OperatorService;

    @GetMapping("/{id}")
    public ApiResponse<OperatorEntity> getOperatorById(
            @PathVariable("id") Long id) {
        log.info("根据ID查询操作员: {}", id);
        OperatorEntity result = OperatorService.getInfoById(id);
        if (result == null) return ApiResponse.notFound("操作员不存在");
        return ApiResponse.success("操作员获取成功", result);
    }

    @GetMapping("/list")
    public ApiResponse<List<OperatorEntity>> getOperatores() {
        log.info("查询操作员列表");
        List<OperatorEntity> result = OperatorService.getAll();
        return ApiResponse.success("操作员列表获取成功", result);
    }

    @GetMapping("/list/page")
    public ApiResponse<Page<OperatorEntity>> getOperatoresByPage(
            @RequestParam(value = "startPage", defaultValue = "1") int startPage,
            @RequestParam(value = "size", defaultValue = "10") int size) {
        log.info("查询操作员列表");
        Page<OperatorEntity> result = OperatorService.getListByPage(startPage, size);
        return ApiResponse.success("操作员列表获取成功", result);
    }

    @PostMapping("/create")
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<OperatorEntity> createOperator(@Valid @RequestBody OperatorEntity body) {
        try {
            log.info("创建操作员: {}", body);
            int result = OperatorService.create(body);
            OperatorEntity createdOperator = OperatorService.getInfoByEmployeeId(body.getEmployeeId());
            return ApiResponse.success("操作员创建成功", createdOperator);
        }catch (Exception e){
            return ApiResponse.error("操作员创建失败");
        }
    }

    @PutMapping("/update")
    public ApiResponse<OperatorEntity> updateOperator(@Valid @RequestBody OperatorEntity body) {
        log.info("更新操作员: {}", body);
        OperatorEntity result = OperatorService.update(body);
        return ApiResponse.success("操作员更新成功", result);
    }

    @DeleteMapping("/delete")
    public ApiResponse<Integer> deleteOperator(@RequestParam("id") Long id) {
       try{
           log.info("删除操作员: {}", id);
           int result = OperatorService.delete(id);
           return ApiResponse.success("操作员删除成功",result);
       }catch (Exception e){
           return ApiResponse.error("操作员删除失败");
       }
    }
}
