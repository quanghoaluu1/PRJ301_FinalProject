/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.cart;

/**
 *
 * @author quang
 */
public class CartDTO {
    private String user_id;
    private String prod_id;
    private int quantity;

    public CartDTO(String user_id, String prod_id, int quantity) {
        this.user_id = user_id;
        this.prod_id = prod_id;
        this.quantity = quantity;
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
    
    
}
