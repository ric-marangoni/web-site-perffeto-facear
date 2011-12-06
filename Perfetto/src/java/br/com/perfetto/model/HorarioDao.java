/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.model;

import br.com.perfetto.entidades.Horario;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author Ricardo
 */
public class HorarioDao extends DAO {
    public void insert(Horario horario){
        
        try{
            openDataBase();
            String SQL = "INSERT INTO horarios SET id_periodo = ?, horario = ?,";
            SQL += "segunda = ?, terca = ?, quarta = ?, quinta = ?, sexta = ?, sabado = ?,";
            SQL += "cor_segunda = ?, cor_terca = ?, cor_quarta = ?, cor_quinta = ?,";
            SQL += "cor_sexta = ?, cor_sabado = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setInt(1,     horario.getPeriodo());
            pstmt.setString(2,  horario.getHorario());
            pstmt.setString(3,  horario.getSegunda());
            pstmt.setString(4,  horario.getTerca());
            pstmt.setString(5,  horario.getQuarta());
            pstmt.setString(6,  horario.getQuinta());
            pstmt.setString(7,  horario.getSexta());
            pstmt.setString(8,  horario.getSabado());
            pstmt.setString(9,  horario.getCor_segunda());
            pstmt.setString(10, horario.getCor_terca());
            pstmt.setString(11, horario.getCor_quarta());
            pstmt.setString(12, horario.getCor_quinta());
            pstmt.setString(13, horario.getCor_sexta());
            pstmt.setString(14, horario.getCor_sabado());
            pstmt.execute();
        }catch(Exception ex){
            
        }finally{
            closeDataBase();
            
        }
    }
    
    public void edit(Horario horario){
        
        try{
            openDataBase();
            String SQL = "UPDATE horarios SET id_periodo = ?, horario = ?,";
            SQL += "segunda = ?, terca = ?, quarta = ?, quinta = ?, sexta = ?, sabado = ?,";
            SQL += "cor_segunda = ?, cor_terca = ?, cor_quarta = ?, cor_quinta = ?,";
            SQL += "cor_sexta = ?, cor_sabado = ? WHERE id_horario = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setInt(1,     horario.getPeriodo());
            pstmt.setString(2,  horario.getHorario());
            pstmt.setString(3,  horario.getSegunda());
            pstmt.setString(4,  horario.getTerca());
            pstmt.setString(5,  horario.getQuarta());
            pstmt.setString(6,  horario.getQuinta());
            pstmt.setString(7,  horario.getSexta());
            pstmt.setString(8,  horario.getSabado());
            pstmt.setString(9,  horario.getCor_segunda());
            pstmt.setString(10, horario.getCor_terca());
            pstmt.setString(11, horario.getCor_quarta());
            pstmt.setString(12, horario.getCor_quinta());
            pstmt.setString(13, horario.getCor_sexta());
            pstmt.setString(14, horario.getCor_sabado());
            pstmt.setInt(15, horario.getId());
            pstmt.execute();
        }catch(Exception ex){
            
        }finally{
            closeDataBase();
            
        }
    }
    
    public ArrayList<Horario> getHorarios(int periodo){
        
        ArrayList<Horario> listaHorario =  new ArrayList<Horario>();
        
        try{
            openDataBase();
            String SQL = "SELECT * FROM horarios WHERE id_periodo = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setInt(1, periodo);
            rs = pstmt.executeQuery();
            
            while(rs.next()){
                Horario horario = new Horario();
                horario.setId(rs.getInt("id_horario"));
                horario.setPeriodo(rs.getInt("id_periodo"));
                horario.setHorario(rs.getString("horario"));
                horario.setSegunda(rs.getString("segunda"));
                horario.setTerca(rs.getString("terca"));       
                horario.setQuarta(rs.getString("quarta"));
                horario.setQuinta(rs.getString("quinta"));
                horario.setSexta(rs.getString("sexta"));
                horario.setSabado(rs.getString("sabado"));
                horario.setCor_segunda(rs.getString("cor_segunda"));
                horario.setCor_terca(rs.getString("cor_terca"));       
                horario.setCor_quarta(rs.getString("cor_quarta"));
                horario.setCor_quinta(rs.getString("cor_quinta"));
                horario.setCor_sexta(rs.getString("cor_sexta"));
                horario.setCor_sabado(rs.getString("cor_sabado"));
                listaHorario.add(horario);
            }
            
        }catch(Exception ex){
        
        }finally{
            closeDataBase();
        }
        
        return listaHorario;
        
        
    }

    public void delete(int id) {
        try{
            openDataBase();
            String SQL = "DELETE FROM horarios WHERE id_horario = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setInt(1, id);
            pstmt.execute();
        }catch(Exception ex){
            
        }finally{
            closeDataBase();
            
        }
    }
}
