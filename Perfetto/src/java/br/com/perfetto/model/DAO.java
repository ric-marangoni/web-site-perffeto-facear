package br.com.perfetto.model;

import java.sql.*;

public class DAO {
    protected Connection con;
    protected PreparedStatement pstmt;
    protected ResultSet rs;
    
    protected void openDataBase(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:8084/perfetto";
            String user = "root";
            String password = "ideias";

            con = DriverManager.getConnection(url, user, password);
        }catch(Exception e){            
            
        }
    }
    
    protected void closeDataBase(){
        try{            
            if(con != null){
                con.close();
            }            
        }catch(Exception e){
            
        }
    }
    
}
