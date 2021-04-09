package org.online.store.api.controller;

import lombok.RequiredArgsConstructor;
import org.online.store.api.service.MarketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class TestController {

    private MarketService service;

    @Autowired
    public TestController(MarketService service) {
        this.service = service;
    }

    @GetMapping("/")
    public String test() {
        return service.getAllOrders().toString();
    }
}
