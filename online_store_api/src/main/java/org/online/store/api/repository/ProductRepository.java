package org.online.store.api.repository;

import org.online.store.api.model.Product;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends PagingAndSortingRepository<Product, Long> {

    List<Product> findByAvailability(boolean availability, Pageable pageable);

    @Query(value = "SELECT * FROM product WHERE availability = ?1 AND name ILIKE %?2%",
        nativeQuery = true)
    List<Product> searchForProductsByName(boolean availability, String name, Pageable pageable);
}
