/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.model;

import br.com.perfetto.entidades.Modalidade;

/**
 *
 * @author Samela
 */
public class ModalidadeDao extends DAO {
    
    public void insert(Modalidade modalidade){
        
        try{
            openDataBase();
            String SQL = "INSERT INTO modalidade SET titulo = ?, descricao = ?, path_image = ?, ordem = 1";
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
    
}
