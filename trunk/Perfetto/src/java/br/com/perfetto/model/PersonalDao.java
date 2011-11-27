/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.model;

import br.com.perfetto.entidades.Personal;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

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
    
    public void deleteTrainer(Personal personal){
        
        PrintWriter out = null; 
        
        try{
            openDataBase();
            String SQL = "DELETE FROM personal_trainers WHERE id_personal_trainers = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setInt(1, personal.getId());
            pstmt.execute();
        }catch(Exception ex){
            out.print("Desculpe-nos o transtorno mais ocorreu o seguinte erro: "+ex.getMessage());            
        }finally{
            closeDataBase();
        }        
        
    }
    
    public ArrayList<Personal> getAllTrainers(){
        PrintWriter out = null; 
        ArrayList<Personal> listaPersonal = new ArrayList<Personal>();
        
        try{
            openDataBase();
            String SQL = "SELECT * FROM personal_trainers";
            pstmt = con.prepareStatement(SQL);            
            rs = pstmt.executeQuery(SQL);
            
            while(rs.next()){
                Personal personal = new Personal();
                personal.setId(rs.getInt("id_personal_trainers"));
                personal.setNome(rs.getString("nome"));
                personal.setArea(rs.getString("area"));
                personal.setImage_path(rs.getString("image_path"));
                listaPersonal.add(personal);
            }
                        
        }catch(Exception e){
            out.print("Desculpe-nos o transtorno mais ocorreu o seguinte erro: "+e.getMessage());            
        }finally{
            closeDataBase();
        }
        
        return listaPersonal;
    }
}
