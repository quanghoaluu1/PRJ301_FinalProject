/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.utils.DBUtils;

/**
 *
 * @author quang
 */
public class UserDAO {

    public UserDTO checkLogin(String userID, String password) throws SQLException {
        String sql = "select user_name, role from users where user_id = ? and password = ?";
        UserDTO user = null;

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ptm = conn.prepareStatement(sql);
            ptm.setString(1, userID);
            ptm.setString(2, password);
            ResultSet rs = ptm.executeQuery();
            while (rs.next()) {

                String user_name = rs.getString("user_name");
                String role = rs.getString("role");
                user = new UserDTO(userID, user_name, role, password);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
        return user;
    }

    public boolean checkUserIDExist(String userID) {
        String sql = "select * from users where user_id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ptm = conn.prepareStatement(sql);
            ptm.setString(1, userID);
            ResultSet rs = ptm.executeQuery();
            return rs.next();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return false;
    }
    
    public boolean createUser(UserDTO user){
        String sql = "insert into users(user_id, user_name, role, password) values (?,?,?,?)";
        boolean check = false;
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ptm = conn.prepareStatement(sql);
            ptm.setString(1, user.getUser_id());
            ptm.setString(2, user.getUser_name());
            ptm.setString(3, user.getRole());
            ptm.setString(4, user.getPassword());
            check = ptm.executeUpdate() > 0;
            
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return check;
    }
    
   public List<UserDTO> getUserByName(String name){
       String sql = "select * from users where user_name like ?";
       List<UserDTO> list = new ArrayList<>();
       try(Connection conn = DBUtils.getConnection();
               PreparedStatement ptm = conn.prepareStatement(sql)){
           ptm.setString(1, '%' + name +'%');
           ResultSet rs = ptm.executeQuery();
           while(rs.next()){
               list.add(new UserDTO(rs.getString("user_id"), rs.getString("user_name"), rs.getString("role"), rs.getString("password")));
           }
       }catch(Exception e){
           System.out.println(e.getMessage());
       }
       return list;
   }
   public List<UserDTO> getAllUser(){
       String sql = "select * from users";
       List<UserDTO> list = new ArrayList<>();
       try(Connection conn = DBUtils.getConnection();
               PreparedStatement ptm = conn.prepareStatement(sql)){
           ResultSet rs = ptm.executeQuery();
           while(rs.next()){
               list.add(new UserDTO(rs.getString("user_id"), rs.getString("user_name"), rs.getString("role"), rs.getString("password")));
           }
       }catch(Exception e){
           System.out.println(e.getMessage());
       }
       return list;
   
   }
   
   public boolean deleteUser(String id){
       String sql = "delete from users where user_id = ?";
       boolean check = false;
        try(Connection conn = DBUtils.getConnection();
               PreparedStatement ptm = conn.prepareStatement(sql)){
           ptm.setString(1, id);
           check = ptm.executeUpdate() > 0;
       }catch(Exception e){
           System.out.println(e.getMessage());
       }
        return check;
   }
   
   public boolean editUser(UserDTO user){
       String sql = "update users set user_name = ?, role = ? where user_id = ?";
       boolean check = false;
       try(Connection conn = DBUtils.getConnection();
               PreparedStatement ptm = conn.prepareStatement(sql)){
           ptm.setString(1, user.getUser_name());
           ptm.setString(2, user.getRole());
           ptm.setString(3, user.getUser_id());
           check = ptm.executeUpdate() > 0;
       }catch(Exception e){
           System.out.println(e.getMessage());
       }
       return check;
   }
}
