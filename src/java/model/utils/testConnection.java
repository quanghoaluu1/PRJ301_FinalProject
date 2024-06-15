/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.utils;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author quang
 */
public class testConnection {
    public static void main(String[] args) {
            String url= "jdbc:sqlserver://HOA-PC\\HOAQUANG:1433;databaseName=FinalProject";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                System.out.println("Trying to connect");
                Connection connection = DriverManager.getConnection(url, "sa", "123456");

                System.out.println("Connection Established Successfull and the DATABASE NAME IS:"
                        + connection.getMetaData().getDatabaseProductName());
            } catch (Exception e) {
System.out.println("Unable to make connection with DB");
                e.printStackTrace();
            }
        }
}
