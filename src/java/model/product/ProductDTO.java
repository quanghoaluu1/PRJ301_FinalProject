/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.product;

import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 *
 * @author quang
 */
public class ProductDTO {

    private String prod_id;
    private String prod_name;
    private String category;
    private double price;
    private int stock;
    private String description;
    private double discount;
    private String brand;
    private String image;

    ProductDAO dao = new ProductDAO();

    public ProductDTO() {
    }

    public ProductDTO(String prod_id, String prod_name, double price, String image) {
        this.prod_id = prod_id;
        this.prod_name = prod_name;
        this.price = price;
        this.image = image;
    }

    public ProductDTO(String prod_id, String prod_name, String category, double price, String brand) {
        this.prod_id = prod_id;
        this.prod_name = prod_name;
        this.category = category;
        this.price = price;
        this.brand = brand;
    }
    
    

    public ProductDTO(String prod_id, String prod_name, String category, double price, int stock, String description, double discount, String brand, String image) {
        this.prod_id = prod_id;
        this.prod_name = prod_name;
        this.category = category;
        this.price = price;
        this.stock = stock;
        this.description = description;
        this.discount = discount;
        this.brand = brand;
        this.image = image;
    }

    public double getNewPrice() {
        double newPrice = price - (price * discount);
        BigDecimal priceRounded = new BigDecimal(newPrice).setScale(2, RoundingMode.HALF_UP);
        newPrice = priceRounded.doubleValue();
        return newPrice;
    }

    public String getProd_id() {
        return prod_id;
    }

    public void setProd_id(String prod_id) {
        this.prod_id = prod_id;
    }

    public String getProd_name() {
        return prod_name;
    }

    public void setProd_name(String prod_name) {
        this.prod_name = prod_name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        BigDecimal priceRounded = new BigDecimal(price).setScale(2, RoundingMode.HALF_UP);
        price = priceRounded.doubleValue();
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getDiscount() {
        BigDecimal discountRounded = new BigDecimal(discount).setScale(2, RoundingMode.HALF_UP);
        discount = discountRounded.doubleValue();
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "ProductDTO{"
                + "prod_id='" + prod_id + '\''
                + ", prod_name='" + prod_name + '\''
                + ", category='" + category + '\''
                + ", price=" + price
                + ", stock=" + stock
                + ", description='" + description + '\''
                + ", discount=" + discount
                + ", brand='" + brand + '\''
                + ", image='" + image + '\''
                + '}';
    }
}
