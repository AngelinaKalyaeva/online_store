package org.online.store.api.controller;

import lombok.RequiredArgsConstructor;
import org.online.store.api.model.Order;
import org.online.store.api.repository.IMarketDbRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class TestController {

    private final IMarketDbRepository iMarketDbRepository;

    @GetMapping("/")
    public String test() {
        return iMarketDbRepository.getOrderById(1).get(0).toString();
    }
}
