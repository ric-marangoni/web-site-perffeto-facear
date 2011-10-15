package br.com.perfetto.model;

import br.com.perfetto.entidades.Admin;
import java.io.PrintWriter;

public class AdminDao extends DAO {
    
    public boolean login(Admin admin){
        
        PrintWriter out = null; 
        boolean sucess = false;
        
        try{
            openDataBase();
            String SQL = "SELECT * FROM admin WHERE login = ? AND senha = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, admin.getLogin());  
            pstmt.setString(2, admin.getSenha());            
            rs = pstmt.executeQuery();
            
            if(rs.first()){
                sucess = true;
            }
                        
        }catch(Exception e){
            out.print("Desculpe-nos o transtorno mais ocorreu o seguinte erro: "+e.getMessage());
            return false;
        }finally{
            closeDataBase();
        }        
        
        return sucess;
         
    }
}
