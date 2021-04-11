package org.online.store.api.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "product", schema = "PUBLIC")
public class Product {

    @Id
    private long id;

    private String name;

    private double price;

    private String currency;

    private String description;

    private boolean availability;

    @Column(name = "available_items_number")
    private double availableItemsNumber;
}
