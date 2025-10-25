package com.smartagriculture.controllers;

import com.smartagriculture.utils.ApiResponse;
import com.smartagriculture.model.AmorphousAlloys;
import com.smartagriculture.services.AmorphousAlloysService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

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
}