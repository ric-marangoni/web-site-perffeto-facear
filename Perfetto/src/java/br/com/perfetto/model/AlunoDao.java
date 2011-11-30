/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.model;

import br.com.perfetto.entidades.Aluno;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

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
    public void deleteDestaque(Aluno aluno){
        
        PrintWriter out = null; 
        
        try{
            openDataBase();
            String SQL = "DELETE FROM alunos_destaque WHERE id_alunos_destaque = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setInt(1, aluno.getId());
            pstmt.execute();
        }catch(Exception ex){
            out.print("Desculpe-nos o transtorno mais ocorreu o seguinte erro: "+ex.getMessage());            
        }finally{
            closeDataBase();
        }        
        
    }
    
    public ArrayList<Aluno> getAllDestaque(){
        PrintWriter out = null; 
        ArrayList<Aluno> listaAluno = new ArrayList<Aluno>();
        
        try{
            openDataBase();
            String SQL = "SELECT * FROM personal_trainers";
            pstmt = con.prepareStatement(SQL);            
            rs = pstmt.executeQuery(SQL);
            
            while(rs.next()){
                Aluno aluno = new Aluno();
                aluno.setId(rs.getInt("id_alunos_destaque"));
                aluno.setNome(rs.getString("nome"));
                aluno.setImage_path(rs.getString("image_path"));
                listaAluno.add(aluno);
            }
                        
        }catch(Exception e){
            out.print("Desculpe-nos o transtorno mais ocorreu o seguinte erro: "+e.getMessage());            
        }finally{
            closeDataBase();
        }
        
        return listaAluno;
    }
}
