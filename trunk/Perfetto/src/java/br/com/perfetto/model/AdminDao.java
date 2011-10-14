package br.com.perfetto.model;

import java.io.PrintWriter;

public class AdminDao extends DAO {
    
    public boolean tryLogin(String login, String senha){
        
        PrintWriter out = null; 
        
        try{
            openDataBase();
            
        }catch(Exception e){
            out.print("Desculpe-nos pelo transtorno mais ocorreu o seguinte erro: "+e.getMessage());
        }finally{
            closeDataBase();
        }        
                
        
        return true;
    } 
    
}
