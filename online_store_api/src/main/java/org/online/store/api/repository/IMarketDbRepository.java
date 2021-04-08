package org.online.store.api.repository;

import org.online.store.api.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IMarketDbRepository extends JpaRepository<Order, Long> {

    @Query(value = "SELECT * FROM production.\"Order\" WHERE id = ?1", nativeQuery = true)
    List<Order> getOrderById(long id);
}
