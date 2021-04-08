package org.online.store.api.model;

import javax.persistence.*;

@Entity
public class Order {
    @Id
    @GeneratedValue
    private long id;

//    @Column(name = "order_date")
//    private long orderDate;
//
//    @Column(name = "receive_date")
//    private long receiveDate;
//
//    private String address;
//
//    private String status;
//
//    @Column(name = "customer_id")
//    private long customerId;
//
//    @Column(name = "courier_id")
//    private long courierId;
//
//    private long price;
//
//    private String currency;
}
