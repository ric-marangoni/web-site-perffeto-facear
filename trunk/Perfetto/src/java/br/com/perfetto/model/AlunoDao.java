/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.model;

import br.com.perfetto.entidades.Aluno;
import java.io.PrintWriter;

/**
 *
 * @author edersonbruno
 */
public class AlunoDao extends DAO {
    public void insert(Aluno aluno){
        
        PrintWriter out = null; 
        
        try{
            openDataBase();
            String SQL = "INSERT INTO alunos_destaque SET nome = ?, image_path = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, aluno.getNome());                   
            pstmt.setString(2, aluno.getImage_path());            
            pstmt.execute();            
                        
        }catch(Exception e){
            out.print("Desculpe-nos o transtorno mais ocorreu o seguinte erro: "+e.getMessage());            
        }finally{
            closeDataBase();
        }
    }
}
