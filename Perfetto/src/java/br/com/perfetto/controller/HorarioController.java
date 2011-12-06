/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.controller;

import br.com.perfetto.entidades.Horario;
import br.com.perfetto.model.HorarioDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ricardo
 */
public class HorarioController extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
                
        String action = request.getParameter("action");
        String incluir = "incluir";
        String editar = "editar";
        String deletar = "deletar";
        
        if(incluir.equals(action)){
            this.insert(request, response);
        }else if(editar.equals(action)){
            this.edit(request, response);
        }else if(deletar.equals(action)){
            this.delete(request, response);
        }
        
    }
    
    private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException{
        
        PrintWriter out = response.getWriter();
        
        Horario horario = new Horario();
        String strHorario = request.getParameter("horario");
        
        try{
            if(strHorario.isEmpty()){
                throw new Exception("<p class=\"vermelho\">Por favor preencha o campo horario</p>");
            }else{
                horario.setHorario(strHorario);
                horario.setPeriodo(Integer.parseInt(request.getParameter("periodo")));
                horario.setSegunda(request.getParameter("segunda"));
                horario.setTerca(request.getParameter("terca"));
                horario.setQuarta(request.getParameter("quarta"));
                horario.setQuinta(request.getParameter("quinta"));
                horario.setSexta(request.getParameter("sexta"));
                horario.setSabado(request.getParameter("sabado"));
                horario.setCor_segunda(request.getParameter("cor-segunda"));
                horario.setCor_terca(request.getParameter("cor-terca"));
                horario.setCor_quarta(request.getParameter("cor-quarta"));
                horario.setCor_quinta(request.getParameter("cor-quinta"));
                horario.setCor_sexta(request.getParameter("cor-sexta"));
                horario.setCor_sabado(request.getParameter("cor-sabado"));
                new HorarioDao().insert(horario);
                out.print("<p class=\"verde\">Horario inserido com sucesso</p>");
            }
        }catch(Exception ex){
            out.print(ex.getMessage());
        }
        
    }
    
    private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException{
        
        PrintWriter out = response.getWriter();
        
        Horario horario = new Horario();
        String strHorario = request.getParameter("horario");
        
        try{
            if(strHorario.isEmpty()){
                throw new Exception("<p class=\"vermelho\">Por favor preencha o campo horario</p>");
            }else{
                horario.setId(Integer.parseInt(request.getParameter("id")));
                horario.setHorario(strHorario);
                horario.setPeriodo(Integer.parseInt(request.getParameter("periodo")));
                horario.setSegunda(request.getParameter("segunda"));
                horario.setTerca(request.getParameter("terca"));
                horario.setQuarta(request.getParameter("quarta"));
                horario.setQuinta(request.getParameter("quinta"));
                horario.setSexta(request.getParameter("sexta"));
                horario.setSabado(request.getParameter("sabado"));
                horario.setCor_segunda(request.getParameter("cor-segunda"));
                horario.setCor_terca(request.getParameter("cor-terca"));
                horario.setCor_quarta(request.getParameter("cor-quarta"));
                horario.setCor_quinta(request.getParameter("cor-quinta"));
                horario.setCor_sexta(request.getParameter("cor-sexta"));
                horario.setCor_sabado(request.getParameter("cor-sabado"));
                new HorarioDao().edit(horario);
                out.print("<p class=\"verde\">Horario inserido com sucesso</p>");
            }
        }catch(Exception ex){
            out.print(ex.getMessage());
        }        
    }
    
    private void delete(HttpServletRequest request, HttpServletResponse response){
        new HorarioDao().delete(Integer.parseInt(request.getParameter("id")));
    }
    
    public ArrayList<Horario> getHorarios(int periodo){
        return new HorarioDao().getHorarios(periodo);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
