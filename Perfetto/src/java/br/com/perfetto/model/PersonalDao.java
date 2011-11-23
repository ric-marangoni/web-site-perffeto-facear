/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.model;

import br.com.perfetto.entidades.Personal;
import java.io.PrintWriter;

/**
 *
 * @author LÍDIA
 */
public class PersonalDao extends DAO {
    public void insert(Personal personal){
        
        PrintWriter out = null; 
        
        try{
            openDataBase();
            String SQL = "INSERT INTO personal_trainers SET nome = ?, area = ?, image_path = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, personal.getNome());
            pstmt.setString(2, personal.getArea());                   
            pstmt.setString(3, personal.getImage_path());            
            pstmt.execute();            
                        
        }catch(Exception e){
            out.print("Desculpe-nos o transtorno mais ocorreu o seguinte erro: "+e.getMessage());            
        }finally{
            closeDataBase();
        }
    }
}
