package com.smartAmor.controllers;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.smartAmor.entity.AmorphousAlloysEntity;
import com.smartAmor.services.AmorphousAlloysService;
import com.smartAmor.utils.ApiResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;
import javax.validation.constraints.PositiveOrZero;
import java.util.List;

@Validated
@RestController
@RequestMapping("/api/amorphous_alloys")
public class AmorphousAlloysController {
    private static final Logger logger = LoggerFactory.getLogger(AmorphousAlloysController.class);

    private final AmorphousAlloysService amorphousAlloysService;

    @Autowired
    public AmorphousAlloysController(AmorphousAlloysService amorphousAlloysService) {
        this.amorphousAlloysService = amorphousAlloysService;
    }

    @GetMapping("/{id}")
    public ApiResponse<AmorphousAlloysEntity> getAmorphousAlloyById(
            @PathVariable("id") @NotBlank String id) {
        logger.info("根据ID查询非晶合金: {}", id);
        AmorphousAlloysEntity result = amorphousAlloysService.getInfoById(id);
        if (result == null) {
            return ApiResponse.notFound("非晶合金不存在");
        }
        return ApiResponse.success("非晶合金获取成功", result);
    }


    @GetMapping("/list")
    public ApiResponse<Page<AmorphousAlloysEntity>> getAmorphousAlloysWithPagination
    (
            @RequestParam(name = "startPage", defaultValue = "0") @PositiveOrZero(message = "页码不能为负数") int startPage,
            @RequestParam(name = "size", defaultValue = "10") @Positive(message = "每页大小必须大于0") int size
    )
    {
        logger.info("分页查询非晶合金, startPage: {}, size: {}", startPage, size);
        Page<AmorphousAlloysEntity> result = amorphousAlloysService.selectListByPage(startPage, size);
        return ApiResponse.success("非晶合金列表获取成功", result);
    }

    @PostMapping("/create")
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<AmorphousAlloysEntity> createAmorphousAlloy(@Valid @RequestBody AmorphousAlloysEntity body) {
        logger.info("创建非晶合金: {}", body);
        AmorphousAlloysEntity result = amorphousAlloysService.create(body);
        return ApiResponse.success("非晶合金创建成功", result);
    }

    @PutMapping("/{id}")
    public ApiResponse<AmorphousAlloysEntity> updateAmorphousAlloy(
            @PathVariable("id") @NotBlank(message = "ID不能为空") String id,
            @Valid @RequestBody AmorphousAlloysEntity body) {
        logger.info("更新非晶合金, ID: {}, 数据: {}", id, body);
        body.setId(id); // 确保ID一致性
        AmorphousAlloysEntity result = amorphousAlloysService.updateById(body);
        return ApiResponse.success("非晶合金更新成功", result);
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> deleteAmorphousAlloy(
            @PathVariable("id") @NotBlank(message = "ID不能为空") String id) {
        logger.info("删除非晶合金: {}", id);
        amorphousAlloysService.deleteById(id);
        return ApiResponse.success("非晶合金删除成功", null);
    }

    @GetMapping("/filter")
    public ApiResponse<List<AmorphousAlloysEntity>> filterAmorphousAlloys(
            @RequestParam(name = "name",required = false) String name,
            @RequestParam(name = "hardness", required = false) Double hardness,
            @RequestParam(name = "strength", required = false) Double strength,
            @RequestParam(name = "corrosion_resistance", required = false) Double corrosion_resistance) {
        logger.info("筛选非晶合金, hardness: {}, strength: {}, corrosion_resistance: {}",
                hardness, strength, corrosion_resistance);
        List<AmorphousAlloysEntity> result = amorphousAlloysService.filterByPropertiesWithName(
                name,hardness, strength, corrosion_resistance);
        return ApiResponse.success("非晶合金筛选成功", result);
    }
}