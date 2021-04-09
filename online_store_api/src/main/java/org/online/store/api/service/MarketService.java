package org.online.store.api.service;

import org.online.store.api.model.Order;
import org.online.store.api.repository.MarketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MarketService {

    private MarketRepository repository;

    @Autowired
    public MarketService(MarketRepository repository) {
        this.repository = repository;
    }

    public List<Order> getAllOrders() {
        return repository.findAll();
    }
}
