/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.cart.CartDTO;
import model.utils.DBUtils;

/**
 *
 * @author quang
 */
public class OrderDAO {
    public boolean isStockAvailable(List<CartDTO> cart){
        String sql = "select stock from products where prod_id = ?";
        try(Connection conn = DBUtils.getConnection();
                PreparedStatement ptm = conn.prepareStatement(sql)){
            for(CartDTO item: cart){
                ptm.setString(1, item.getProd_id());
                ResultSet rs = ptm.executeQuery();
                if(rs.next()){
                    int stock = rs.getInt("stock");
                    if(item.getQuantity() > stock) return false;
                }else return false;
            }
        }catch(Exception e){
            System.out.println(e.toString());
            e.printStackTrace();
        }
        return true;
    }
    
    public void saveOrders(List<OrderDTO> orders){
        String order_sql = "insert into orders(user_id, prod_id, quantity, order_time) values (?,?,?,?)";
        String stock_sql = "update products set stock = stock - ? where prod_id = ?";
        try{
           Connection conn = DBUtils.getConnection();
           PreparedStatement order_ptm = conn.prepareStatement(order_sql);
           PreparedStatement stock_ptm = conn.prepareStatement(stock_sql);
           for(OrderDTO order: orders){
               order_ptm.setString(1, order.getUser_id());
               order_ptm.setString(2, order.getProd_id());
               order_ptm.setInt(3, order.getQuantity());
               order_ptm.setTimestamp(4, order.getOrder_time());
               order_ptm.addBatch();
               
               stock_ptm.setInt(1, order.getQuantity());
               stock_ptm.setString(2, order.getProd_id());
               stock_ptm.addBatch();
           }
           order_ptm.executeBatch();
           stock_ptm.executeBatch();
        }catch(Exception e){
            System.out.println(e.toString());
            e.printStackTrace();
        }
    }
    
    public List<OrderHistoryDTO> getHistoryItems(String user_id){
        String sql = "select order_time, p.image,p.prod_name , quantity, p.price from orders o join products p on p.prod_id = o.prod_id where user_id = ?";
        List<OrderHistoryDTO> history = new ArrayList<>();
        try(Connection conn = DBUtils.getConnection();
                PreparedStatement ptm = conn.prepareStatement(sql)){
            ptm.setString(1, user_id);
            ResultSet rs = ptm.executeQuery();
            while(rs.next()){
                Timestamp order_time = rs.getTimestamp("order_time");
                String image = rs.getString("image");
                String name = rs.getString("prod_name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");          
                history.add(new OrderHistoryDTO(order_time, image, name, quantity, price));
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return history;
    }
}
