/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.model;

import br.com.perfetto.entidades.Horario;
import java.io.PrintWriter;

/**
 *
 * @author Ricardo
 */
public class HorarioDao extends DAO {
    public void insert(Horario horario){
        PrintWriter out = null;
        try{
            openDataBase();
            String SQL = "INSERT INTO horarios SET id_periodo = ?, horario = ?,";
            SQL += "segunda = ?, terca = ?, quarta = ?, quinta = ?, sexta = ?, sabado = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setInt(1, horario.getPeriodo());
            pstmt.setString(2, horario.getHorario());
            pstmt.setString(3, horario.getSegunda());
            pstmt.setString(4, horario.getTerca());
            pstmt.setString(5, horario.getQuarta());
            pstmt.setString(6, horario.getQuinta());
            pstmt.setString(7, horario.getSexta());
            pstmt.setString(8, horario.getSabado());
            pstmt.execute();
        }catch(Exception ex){
            out.print(ex.getMessage());
        }finally{
            closeDataBase();
            out.close();
        }
    }
}
