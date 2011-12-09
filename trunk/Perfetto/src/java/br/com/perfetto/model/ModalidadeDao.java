/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.model;

import br.com.perfetto.entidades.Modalidade;
import java.util.ArrayList;

/**
 *
 * @author Samela
 */
public class ModalidadeDao extends DAO {
    
    public void insert(Modalidade modalidade){
        
        try{
            openDataBase();
            String SQL = "INSERT INTO modalidade SET titulo = ?, descricao = ?, path_image = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, modalidade.getTitulo());
            pstmt.setString(2, modalidade.getDescricao());
            pstmt.setString(3, modalidade.getPath_image());
            pstmt.execute();
            
        }catch(Exception ex){
        
        }finally{
            closeDataBase();
        }
        
    }
    
    public void edit(Modalidade modalidade){
        try{
            openDataBase();
            String SQL = "UPDATE modalidade SET titulo = ?, descricao = ?, path_image = ?, WHERE = id_modalidade = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, modalidade.getTitulo());
            pstmt.setString(2, modalidade.getDescricao());
            pstmt.setString(3, modalidade.getPath_image());
            pstmt.setInt(4, modalidade.getId());
            pstmt.execute();
            
        }catch(Exception ex){
        
        }finally{
            closeDataBase();
        }
    }  
    
    public void delete(int id){
         try{
            openDataBase();
            String SQL = "DELETE FROM modalidade WHERE = id_modalidade = ?";
            pstmt = con.prepareStatement(SQL);            
            pstmt.setInt(1, id);
            pstmt.execute();
            
        }catch(Exception ex){
        
        }finally{
            closeDataBase();
        }
    }

    public ArrayList<Modalidade> getModalidades() {
        ArrayList<Modalidade> listaModalidade = new ArrayList<Modalidade>();
        
        try{
            openDataBase();
            String SQL = "SELECT * FROM modalidade";
            pstmt = con.prepareStatement(SQL);            
            rs = pstmt.executeQuery(SQL);
            
            while(rs.next()){
                Modalidade modalidade = new Modalidade();
                modalidade.setId(rs.getInt("id_modalidade"));
                modalidade.setTitulo(rs.getString("titulo"));                
                modalidade.setPath_image(rs.getString("path_image"));
                modalidade.setDescricao(rs.getString("descricao"));
                listaModalidade.add(modalidade);
            }
            
        }catch(Exception ex){
            
        }finally{
            closeDataBase();            
        }    
        
        return listaModalidade;
    }
    
    public Modalidade getModalidadeById(int id){
        Modalidade modalidade = new Modalidade();
        
        try{
            openDataBase();
            String SQL = "SELECT * FROM modalidade WHERE id_modalidade = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            
            if(rs.first()){                                
                modalidade.setTitulo(rs.getString("titulo"));
                modalidade.setPath_image(rs.getString("path_image"));
                modalidade.setDescricao(rs.getString("descricao"));                
            }
        }catch(Exception ex){
        
        }finally{
            closeDataBase();
        }
        
        return modalidade;           
    }
   
}
