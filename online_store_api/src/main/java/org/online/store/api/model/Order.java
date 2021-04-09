package org.online.store.api.model;

import lombok.Data;
import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name = "order", schema = "PUBLIC")
public class Order {

    @Id
    private long id;

    @Column(name = "order_date")
    private Date orderDate;

    @Column(name = "receive_date")
    private Date receiveDate;

    private String address;

    private String status;

    @Column(name = "customer_id")
    private long customerId;

    @Column(name = "courier_id")
    private long courierId;

    private double price;

    private String currency;
}
