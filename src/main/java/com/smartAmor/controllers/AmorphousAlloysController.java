package com.smartAmor.controllers;

import com.smartAmor.model.AmorphousAlloys;
import com.smartAmor.model.Properties;
import com.smartAmor.services.AmorphousAlloysService;
import com.smartAmor.utils.ApiResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/amorphous_alloys")
public class AmorphousAlloysController {
    private static final Logger logger = LoggerFactory.getLogger(AmorphousAlloysController.class);

    private final AmorphousAlloysService amorphousAlloysService;

    @Autowired
    public AmorphousAlloysController(AmorphousAlloysService amorphousAlloysService) {
        this.amorphousAlloysService = amorphousAlloysService;
    }

    @GetMapping
    public ApiResponse<AmorphousAlloys> getAmorphousAlloyById(@RequestParam("id") String id) {
        try {
            // 参数验证
            if (id == null || id.trim().isEmpty()) {
                logger.warn("ID参数为空");
                return ApiResponse.error("ID不能为空");
            }

            // 业务逻辑处理
            AmorphousAlloys result = amorphousAlloysService.getInfoById(id);
            if (result == null) {
                logger.warn("未找到ID为 {} 的非晶合金", id);
                return ApiResponse.error("非晶合金未找到");
            }

            logger.info("成功获取ID为 {} 的非晶合金信息", id);
            return ApiResponse.success("非晶合金获取成功", result);

        } catch (Exception e) {
            // 异常处理
            logger.error("获取非晶合金信息时发生异常: {}", e.getMessage(), e);
            return ApiResponse.error("服务器内部错误");
        }
    }

    @GetMapping("/list")
    public ApiResponse<List<AmorphousAlloys>> getAmorphousAlloysWithPagination(@RequestParam("start") int start, @RequestParam("size") int size) {
        if (start < 0 || size < 0) {
            logger.warn("分页参数错误");
            return ApiResponse.error("分页参数错误");
        }
        if (size == 0) size = 10;
        if (start == 0) start = 1;
        try {
            List<AmorphousAlloys> result = amorphousAlloysService.selectList(start, size);
            if (result.isEmpty()) {
                logger.warn("未找到任何非晶合金");
                return ApiResponse.error("未找到任何非晶合金");
            }

            logger.info("成功获取所有非晶合金信息");
            return ApiResponse.success("非晶合金获取成功", result);
        } catch (Exception e) {
            // 异常处理
            logger.error("获取非晶合金信息时发生异常: {}", e.getMessage(), e);
            return ApiResponse.error("服务器内部错误");
        }
    }

    @PostMapping("/create")
    public ApiResponse<AmorphousAlloys> createAmorphousAlloy(@RequestBody AmorphousAlloys body) {
        if (body == null || body.getProperties() == null) return ApiResponse.error("非晶合金信息不能为空");
        try {
            AmorphousAlloys result = amorphousAlloysService.create(body);
            logger.info("成功创建非晶合金信息");
            return ApiResponse.success("非晶合金创建成功", body);
        } catch (Exception e) {
            logger.warn("创建非晶合金信息失败: {}", e.getMessage(), e);
            return ApiResponse.error(e.getMessage());
        }
    }

    @PutMapping("/update")
    public ApiResponse<AmorphousAlloys> updateAmorphousAlloy(@RequestBody AmorphousAlloys body) {
        if (body == null || body.getId() == null) {
            logger.warn("更新参数为空");
            return ApiResponse.error("更新参数不能为空");
        }
        try {
            AmorphousAlloys result = amorphousAlloysService.updateById(body);
            if (result == null) {
                logger.warn("未找到ID为 {} 的非晶合金", body.getId());
                return ApiResponse.error("非晶合金未找到");
            }
            logger.info("成功更新ID为 {} 的非晶合金信息", body.getId());
            return ApiResponse.success("非晶合金更新成功", result);
        } catch (Exception e) {
            logger.error("更新非晶合金信息时发生异常: {}", e.getMessage(), e);
            return ApiResponse.error("服务器内部错误");
        }
    }

    @DeleteMapping("/delete")
    public ApiResponse<Void> deleteAmorphousAlloy(@RequestParam("id") String id) {
        if (id == null || id.trim().isEmpty()) {
            logger.warn("删除参数为空");
            return ApiResponse.error("删除参数不能为空");
        }
        if (amorphousAlloysService.getInfoById(id) == null) {
            logger.warn("未找到ID为 {} 的非晶合金", id);
            return ApiResponse.error("非晶合金未找到");
        }
        try {
            amorphousAlloysService.deleteById(id);
            logger.info("成功删除ID为 {} 的非晶合金信息", id);
            return ApiResponse.success("非晶合金删除成功", null);
        } catch (Exception e) {
            logger.error("删除非晶合金信息时发生异常: {}", e.getMessage(), e);
            return ApiResponse.error("服务器内部错误");
        }
    }


}