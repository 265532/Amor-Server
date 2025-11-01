package com.smartAmor.controllers;

import com.smartAmor.model.AmorphousAlloys;
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
    public ApiResponse<AmorphousAlloys> getAmorphousAlloyById(
            @PathVariable("id") @NotBlank String id) {
        logger.info("根据ID查询非晶合金: {}", id);
        AmorphousAlloys result = amorphousAlloysService.getInfoById(id);
        if (result == null) {
            return ApiResponse.notFound("非晶合金不存在");
        }
        return ApiResponse.success("非晶合金获取成功", result);
    }


    @GetMapping("/list")
    public ApiResponse<List<AmorphousAlloys>> getAmorphousAlloysWithPagination(
            @RequestParam(name = "page", defaultValue = "0") @PositiveOrZero(message = "页码不能为负数") int page,
            @RequestParam(name = "size", defaultValue = "10") @Positive(message = "每页大小必须大于0") int size) {
        logger.info("分页查询非晶合金, page: {}, size: {}", page, size);
        List<AmorphousAlloys> result = amorphousAlloysService.selectList(page, size);
        return ApiResponse.success("非晶合金列表获取成功", result);
    }

    @PostMapping("/create")
    @ResponseStatus(HttpStatus.CREATED)
    public ApiResponse<AmorphousAlloys> createAmorphousAlloy(@Valid @RequestBody AmorphousAlloys body) {
        logger.info("创建非晶合金: {}", body);
        AmorphousAlloys result = amorphousAlloysService.create(body);
        return ApiResponse.success("非晶合金创建成功", result);
    }

    @PutMapping("/{id}")
    public ApiResponse<AmorphousAlloys> updateAmorphousAlloy(
            @PathVariable("id") @NotBlank(message = "ID不能为空") String id,
            @Valid @RequestBody AmorphousAlloys body) {
        logger.info("更新非晶合金, ID: {}, 数据: {}", id, body);
        body.setId(id); // 确保ID一致性
        AmorphousAlloys result = amorphousAlloysService.updateById(body);
        return ApiResponse.success("非晶合金更新成功", result);
    }

    @DeleteMapping("/{id}")
    public ApiResponse<Void> deleteAmorphousAlloy(
            @PathVariable("id") @NotBlank(message = "ID不能为空") String id) {
        logger.info("删除非晶合金: {}", id);
        amorphousAlloysService.deleteById(id);
        return ApiResponse.success("非晶合金删除成功", null);
    }

}