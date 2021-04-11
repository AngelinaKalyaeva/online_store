package org.online.store.api.service;

import lombok.RequiredArgsConstructor;
import org.online.store.api.model.Order;
import org.online.store.api.repository.OrderRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final OrderRepository repository;

    public List<Order> getAllOrders() {
        return repository.findAll();
    }
}
