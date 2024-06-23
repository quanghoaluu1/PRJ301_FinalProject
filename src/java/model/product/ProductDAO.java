/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.product;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.utils.DBUtils;

/**
 *
 * @author quang
 */
public class ProductDAO {

    public static void main(String[] args) {
        String brand = "others";
        List<ProductDTO> list = getByCriteria(null, null, null, null, brand);
        for(ProductDTO prod: list){
            System.out.println(prod.getImage());
            System.out.println(prod.getProd_name());
            System.out.println(prod.getNewPrice());
        }
    }
    public boolean addProduct(String prod_id, String prod_name, String category, double price, int stock, String description, double discount, String brand, String image) {
        boolean check = false;
        String sql = "insert into products (prod_id,prod_name,category,price,stock,description,discount,brand,image) values(?,?,?,?,?,?,?,?,?)";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ptm = conn.prepareStatement(sql)) {
            ptm.setString(1, prod_id);
            ptm.setString(2, prod_name);
            ptm.setString(3, category);
            ptm.setDouble(4, price);
            ptm.setInt(5, stock);
            ptm.setString(6, description);
            ptm.setDouble(7, discount);
            ptm.setString(8, brand);
            ptm.setString(9, image);
            check = ptm.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return check;
    }

    public List<ProductDTO> getAllProduct() {
        String sql = "select * from products";
        List<ProductDTO> list = new ArrayList<>();
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ptm = conn.prepareStatement(sql);
                ResultSet rs = ptm.executeQuery()) {
            while (rs.next()) {
                String prod_id = rs.getString("prod_id");
                String prod_name = rs.getString("prod_name");
                String category = rs.getString("category");
                float price = rs.getFloat("price");
                int stock = rs.getInt("stock");
                String description = rs.getString("description");
                float discount = rs.getFloat("discount");
                String brand = rs.getString("brand");
                String image = rs.getString("image");

                ProductDTO product = new ProductDTO(prod_id, prod_name, category, price, stock, description, discount, brand, image);
                list.add(product);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public boolean deleteProduct(String id) {
        String sql = "delete from products where prod_id = ?";
        boolean check = false;
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ptm = conn.prepareStatement(sql)) {
            if (conn != null) {
                ptm.setString(1, id);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return check;
    }

    public boolean updateProduct(String prod_id, String prod_name, String category, double price, int stock, String description, double discount, String brand, String image) {
        String sql = "update products set prod_name = ?, category = ?, price = ?, stock = ?, description = ?, discount = ?, brand = ?, image = ? where prod_id = ?";
        boolean check = false;
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ptm = conn.prepareStatement(sql);) {
            ptm.setString(1, prod_name);
            ptm.setString(2, category);
            ptm.setDouble(3, price);
            ptm.setInt(4, stock);
            ptm.setString(5, description);
            ptm.setDouble(6, discount);
            ptm.setString(7, brand);
            ptm.setString(8, image);
            ptm.setString(9, prod_id);

            check = ptm.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return check;
    }

    public ProductDTO getProductByID(String id) {
        String sql = "select * from products where prod_id like ?";
        ProductDTO product = null;
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ptm = conn.prepareStatement(sql);) {
            ptm.setString(1, '%' + id + '%');
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                String prod_id = rs.getString("prod_id");
                String prod_name = rs.getString("prod_name");
                String category = rs.getString("category");
                float price = rs.getFloat("price");
                int stock = rs.getInt("stock");
                String description = rs.getString("description");
                float discount = rs.getFloat("discount");
                String brand = rs.getString("brand");
                String image = rs.getString("image");
                product = new ProductDTO(prod_id, prod_name, category, price, stock, description, discount, brand, image);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return product;
    }

    public List<ProductDTO> getProductByName(String name) {
        String sql = "select * from products where prod_name like ?";
        List<ProductDTO> list = new ArrayList<>();
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ptm = conn.prepareStatement(sql);) {
            ptm.setString(1, '%' + name + '%');
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                String prod_id = rs.getString("prod_id");
                String prod_name = rs.getString("prod_name");
                String category = rs.getString("category");
                float price = rs.getFloat("price");
                int stock = rs.getInt("stock");
                String description = rs.getString("description");
                float discount = rs.getFloat("discount");
                String brand = rs.getString("brand");
                String image = rs.getString("image");
                list.add(new ProductDTO(prod_id, prod_name, category, price, stock, description, discount, brand, image));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<ProductDTO> getProductByCategory(String category) {
        String sql = "select * from products where category = ?";
        List<ProductDTO> list = new ArrayList<>();
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ptm = conn.prepareStatement(sql);) {
            ptm.setString(1, category);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                String prod_id = rs.getString("prod_id");
                String prod_name = rs.getString("prod_name");
                float price = rs.getFloat("price");
                int stock = rs.getInt("stock");
                String description = rs.getString("description");
                float discount = rs.getFloat("discount");
                String brand = rs.getString("brand");
                String image = rs.getString("image");
                list.add(new ProductDTO(prod_id, prod_name, category, price, stock, description, discount, brand, image));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<ProductDTO> getByNameAndCategory(String name, String category) {
        String sql = "select * from products where prod_name like ? and category = ?";
        List<ProductDTO> list = new ArrayList<>();
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ptm = conn.prepareStatement(sql)) {
            ptm.setString(1, '%' + name + '%');
            ptm.setString(2, category);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                String prod_id = rs.getString("prod_id");
                String prod_name = rs.getString("prod_name");
                float price = rs.getFloat("price");
                int stock = rs.getInt("stock");
                String description = rs.getString("description");
                float discount = rs.getFloat("discount");
                String brand = rs.getString("brand");
                String image = rs.getString("image");
                list.add(new ProductDTO(prod_id, prod_name, category, price, stock, description, discount, brand, image));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static List<ProductDTO> getByCriteria(String name, String category, Double min_price, Double max_price, String brand) {
        StringBuilder sql = new StringBuilder("select * from products where 1=1");
        List<ProductDTO> list = new ArrayList<>();
        if (name != null && !name.trim().isEmpty()) {
            sql.append(" and name like ?");
        }
        if (category != null && !category.trim().isEmpty()) {
            sql.append(" and category = ?");
        }
        if (min_price != null) {
            sql.append("and price >= ?");
        }
        if (max_price != null) {
            sql.append(" and price <= ?");
        }
        if (brand != null && !brand.trim().isEmpty()) {
            if ("others".equals(brand)) {
                sql.append(" and brand not in ('Acer','Asus','Apple')");
            } else {
                sql.append(" and brand = ?");
            }
        }
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ptm = conn.prepareStatement(sql.toString())) {
            int index = 1;
            if (name != null && !name.trim().isEmpty()) {
                ptm.setString(index++, '%' + name + '%');
            }
            if (category != null && !category.trim().isEmpty()) {
                ptm.setString(index++, category);
            }
            if (min_price != null) {
                ptm.setDouble(index++, min_price);
            }
            if (max_price != null) {
                ptm.setDouble(index++, max_price);
            }
            if (brand != null && !brand.trim().isEmpty() && !"others".equals(brand)) {
                ptm.setString(index++, brand);
            }
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                String prodId = rs.getString("prod_id");
                String prodName = rs.getString("prod_name");
                String prodCategory = rs.getString("category");
                double prodPrice = rs.getDouble("price");
                int prodStock = rs.getInt("stock");
                String prodDescription = rs.getString("description");
                double prodDiscount = rs.getDouble("discount");
                String prodBrand = rs.getString("brand");
                String prodImage = rs.getString("image");

                ProductDTO product = new ProductDTO(prodId, prodName, prodCategory, prodPrice, prodStock, prodDescription, prodDiscount, prodBrand, prodImage);
                list.add(product);
            }
        }catch(Exception e){
            System.out.println(e.toString());
        }
        return list;
    }

    public double setDecimal(double value) {
        BigDecimal valueRounded = new BigDecimal(value).setScale(2, RoundingMode.HALF_UP);
        value = valueRounded.doubleValue();
        return value;
    }

    public boolean addToWishList(String user_id, String prod_id) {
        String sql = "insert into WishLists(user_id,prod_id) values (?,?)";
        boolean check = false;
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ptm = conn.prepareStatement(sql)) {
            ptm.setString(1, user_id);
            ptm.setString(2, prod_id);
            check = ptm.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return check;
    }

    public boolean isInWishList(String user_id, String prod_id) {
        String sql = "select * from WishLists where user_id = ? and prod_id = ?";
        boolean check = false;
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ptm = conn.prepareStatement(sql)) {
            ptm.setString(1, user_id);
            ptm.setString(2, prod_id);
            ResultSet rs = ptm.executeQuery();
            check = rs.next();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return check;
    }

    public List<ProductDTO> getWishList(String user_id) {
        String sql = "select p.prod_id, p.prod_name, p.price, p.image from WishLists wl join Products p on p.prod_id = wl.prod_id where wl.user_id = ?";
        List<ProductDTO> list = new ArrayList<>();
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ptm = conn.prepareStatement(sql)) {
            ptm.setString(1, user_id);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                list.add(new ProductDTO(rs.getString("prod_id"), rs.getString("prod_name"), rs.getDouble("price"), rs.getString("image")));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public boolean removeFromWishList(String user_id, String prod_id) {
        String sql = "delete from WishLists where user_id = ? and prod_id = ?";
        boolean check = false;
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ptm = conn.prepareStatement(sql)) {
            ptm.setString(1, user_id);
            ptm.setString(2, prod_id);
            check = ptm.executeUpdate() > 0;

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return check;
    }

}
