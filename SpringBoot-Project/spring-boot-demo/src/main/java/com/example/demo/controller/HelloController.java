package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String home() {
        return "✅ Spring Boot is running inside Docker!";
    }

    @GetMapping("/hello")
    public String hello() {
        return "👋 Hello from ci/cd Dockerized Spring Boot!";
    }
}
