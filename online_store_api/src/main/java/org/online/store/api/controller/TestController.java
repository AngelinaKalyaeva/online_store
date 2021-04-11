package org.online.store.api.controller;

import lombok.RequiredArgsConstructor;
import org.online.store.api.service.OrderService;
import org.online.store.api.service.ProductService;
import org.online.store.api.utils.SortingOrder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class TestController {

    private final OrderService orderService;

    private final ProductService productService;

    @GetMapping("/orders")
    public String getOrders() {
        return orderService.getAllOrders().toString();
    }

    @GetMapping("/products")
    public String getProducts(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(defaultValue = "") String sortBy,
            @RequestParam(defaultValue = "ASC") SortingOrder sortingOrder
    ) {
        return productService.getAllProducts(page, size, sortBy, sortingOrder).toString();
    }
}
