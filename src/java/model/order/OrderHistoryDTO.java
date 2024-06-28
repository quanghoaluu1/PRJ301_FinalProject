/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.order;

import java.sql.Timestamp;

/**
 *
 * @author quang
 */
public class OrderHistoryDTO {
    private Timestamp order_time;
    private String image;
    private String prod_name;
    private int quantity;
    private double price;

    public OrderHistoryDTO(Timestamp order_time, String image, String prod_name, int quantity, double price) {
        this.order_time = order_time;
        this.image = image;
        this.prod_name = prod_name;
        this.quantity = quantity;
        this.price = price;
    }

    public Timestamp getOrder_time() {
        return order_time;
    }

    public void setOrder_time(Timestamp order_time) {
        this.order_time = order_time;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getProd_name() {
        return prod_name;
    }

    public void setProd_name(String prod_name) {
        this.prod_name = prod_name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
}
