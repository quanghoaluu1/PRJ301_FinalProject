/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.order;

import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 *
 * @author quang
 */
public class OrderDTO {
    private String user_id;
    private String prod_id;
    private int quantity;
    private Timestamp order_time;

    public OrderDTO(String user_id, String prod_id, int quantity, Timestamp order_time) {
        this.user_id = user_id;
        this.prod_id = prod_id;
        this.quantity = quantity;
        this.order_time = order_time;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getProd_id() {
        return prod_id;
    }

    public void setProd_id(String prod_id) {
        this.prod_id = prod_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Timestamp getOrder_time() {
        return order_time;
    }

    public void setOrder_time(Timestamp order_time) {
        this.order_time = order_time;
    }
    
}
