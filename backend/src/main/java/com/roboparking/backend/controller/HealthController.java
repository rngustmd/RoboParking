package com.roboparking.backend.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class HealthController {

    // 서버가 켜져 있는지 확인하는 API: localhost:8080/api/health
    @GetMapping("/health")
    public String health() {
        return "RoboParking backend OK";
    }
}
