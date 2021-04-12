package org.online.store.api.service;

import lombok.RequiredArgsConstructor;
import org.online.store.api.model.Product;
import org.online.store.api.repository.ProductRepository;
import org.online.store.api.utils.SortingOrder;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Locale;

import static org.online.store.api.utils.SortingOrder.DESC;

@Service
@RequiredArgsConstructor
public class ProductService {

    private static final boolean DEFAULT_AVAILABILITY = true;

    private final ProductRepository repository;

    public List<Product> getAllProducts(int page, int size, String sortBy, SortingOrder sortingOrder) {
        if (sortBy.isEmpty()) {
            return repository.findByAvailability(
                    DEFAULT_AVAILABILITY, PageRequest.of(page, size)
            );
        }

        Sort sort = Sort.by(sortBy);
        sort = DESC.equals(sortingOrder) ? sort.descending() : sort.ascending();

        return repository.findByAvailability(
                DEFAULT_AVAILABILITY, PageRequest.of(page, size, sort)
        );
    }

    public List<Product> searchForProductsByName(String name, int page, int size, String sortBy, SortingOrder sortingOrder) {
        if (sortBy.isEmpty()) {
            return repository.searchForProductsByName(DEFAULT_AVAILABILITY, name, PageRequest.of(page, size));
        }

        Sort sort = Sort.by(sortBy);
        sort = DESC.equals(sortingOrder) ? sort.descending() : sort.ascending();

        return repository.searchForProductsByName(
                DEFAULT_AVAILABILITY, name, PageRequest.of(page, size, sort)
        );
    }
}
