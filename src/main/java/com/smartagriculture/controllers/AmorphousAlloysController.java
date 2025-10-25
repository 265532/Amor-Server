package com.smartagriculture.controllers;

import com.smartagriculture.ApiResponse;
import com.smartagriculture.model.AmorphousAlloys;
import com.smartagriculture.services.AmorphousAlloysService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import com.smartagriculture.utils.ResponseEntityUtil;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/amorphous_alloys")
public class AmorphousAlloysController {
    @Autowired
    private AmorphousAlloysService amorphousAlloysService;

    @GetMapping
    public ResponseEntity<ApiResponse<AmorphousAlloys>> getInfo(@RequestParam("id") String id) {
        AmorphousAlloys result = amorphousAlloysService.getInfoById(id);
        if (result == null) {
            return new ResponseEntity<>(new ApiResponse<>("error", "用户未找到", result), HttpStatus.NOT_FOUND);
        }
        return ResponseEntity.ok(
                new ApiResponse<>("success", "用户获取成功", result)
        );
    }
}
