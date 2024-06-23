/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.utils.DBUtils;

/**
 *
 * @author quang
 */
public class CartDAO {

    static Connection conn = null;
    static PreparedStatement ptm = null;

    public CartDAO() {

    }
    public void main(String[] args) {
         String user_id ="duy";
        try{
           for(CartDTO item: getItems(user_id)){
               System.out.println(item.getProd_id());
               System.out.println(item.getQuantity());
           }
        }catch(Exception e){
                System.out.println(e.getMessage());
                }
        
    }

    public void addItem(String user_id, String prod_id, int quantity) throws SQLException {

        String sql = "insert into carts(user_id, prod_id, quantity) values (?,?,?)";
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(sql);
            ptm.setString(1, user_id);
            ptm.setString(2, prod_id);
            ptm.setInt(3, quantity);
            ptm.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        conn.close();
        ptm.close();
    }

    public void updateItems(String user_id, String prod_id, int quantity) throws SQLException {

        String sql = "update carts set quantity = ? where user_id = ? and prod_id = ?";
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(sql);
            ptm.setInt(1, quantity);
            ptm.setString(2, user_id);
            ptm.setString(3, prod_id);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        conn.close();
        ptm.close();
    }

    public void removeItem(String user_id, String prod_id) throws SQLException {

        String sql = "delete from carts where user_id = ? and prod_id = ?";
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(sql);
            ptm.setString(1, user_id);
            ptm.setString(2, prod_id);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        conn.close();
        ptm.close();
    }

    public List<CartDTO> getItems(String user_id) throws SQLException {
        String sql = "select * from carts where user_id =?";
        List<CartDTO> items = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(sql);
            ptm.setString(1, user_id);

            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {
                items.add(new CartDTO(rs.getString("user_id"), rs.getString("prod_id"), rs.getInt("quantity")));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        conn.close();
        ptm.close();
        return items;
    }

    public void clearItems(String user_id) throws SQLException {
        String sql = "delete from carts where user_id = ?";
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(sql);
            ptm.setString(1, user_id);
            ptm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        conn.close();
        ptm.close();
    }
    
   
}
