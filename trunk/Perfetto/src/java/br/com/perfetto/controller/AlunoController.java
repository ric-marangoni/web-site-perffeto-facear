/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.controller;

import br.com.perfetto.entidades.Aluno;
import br.com.perfetto.model.AlunoDao;
import br.com.perfetto.util.Aplication;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author LÍDIA
 */
public class AlunoController extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InterruptedException, JSONException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String action = request.getParameter("action");
        String incluir = "incluir";
        String editar = "editar";
        String deletar = "deletar";
        String upload = "upload";
        
        if(incluir.equals(action)){
            this.insert(request, response);
        }else if(editar.equals(action)){
            //this.editBanner(request, response);
        }else if(deletar.equals(action)){
            this.delete(request);
        }else if(upload.equals(action)){
            this.upload(request, response);
        }else{
            this.getAlunoById(request, response);
        }
    }
    
    private void upload(HttpServletRequest request, HttpServletResponse response) throws IOException, InterruptedException {
        PrintWriter out = response.getWriter();
        
        String path = "images/alunos/";
        int resizeWidth = 1000;
        int thumbWidth = 106;
        
        String itemName = Aplication.upload(request, path);
        Aplication.resizeIt(path, itemName, resizeWidth, "");
        Aplication.thumbnailIt(path, itemName, thumbWidth, "thumb_");

        out.print("<img src=\""+path + "thumb_"+itemName+"\" />");
                    
        out.close();
    }

    private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException, InterruptedException {
        PrintWriter out = response.getWriter();
        
        Aluno aluno = new Aluno();
        AlunoDao alunoDao = new AlunoDao();
        String alunoNome = request.getParameter("aluno_nome");        
        String alunoImagem = request.getParameter("aluno_imagem");
        
        try{        
            if(!alunoNome.isEmpty()){
                aluno.setNome(alunoNome);
            }else{
                throw new Exception("<p class=\"vermelho\">Por favor informe o nome do aluno</p>");
            }
            
            
            if(alunoImagem != null){
                aluno.setImage_path(alunoImagem);
            }else{
                throw new Exception("<p class=\"vermelho\">Por favor escolha uma imagem para o aluno</p>");
            }            

            alunoDao.insert(aluno);

            out.print("<p class=\"verde\">Aluno inserido com sucesso</p>");        
            
        }catch(Exception ex){
            out.print(ex.getMessage());
        }
        
    }
    
    private void delete(HttpServletRequest request){
        Aluno aluno = new Aluno();
        AlunoDao alunoDao = new AlunoDao();
        
        aluno.setId(Integer.parseInt(request.getParameter("id")));
        
        alunoDao.delete(aluno);
    }
    
    public ArrayList<Aluno> getAlunos(){
        
        AlunoDao alunoDao = new AlunoDao();
        
        return alunoDao.getAlunos();
        
    }
    
    private void getAlunoById(HttpServletRequest request, HttpServletResponse response) throws IOException, JSONException{
        PrintWriter out = response.getWriter();
        
        Aluno aluno = new AlunoDao().getAlunoById(Integer.parseInt(request.getParameter("id")));
        
        JSONObject alunoJSON = new JSONObject();
        
        try{
            alunoJSON.put("id", aluno.getId());
            alunoJSON.put("nome", aluno.getNome());
            alunoJSON.put("imagem", aluno.getImage_path());
            
            out.print(alunoJSON);
        }catch(JSONException ex){
            out.print(ex.getMessage());
        }
        
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
        try {
            try {
                processRequest(request, response);
            } catch (JSONException ex) {
                Logger.getLogger(AlunoController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (InterruptedException ex) {
            Logger.getLogger(AlunoController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            try {
                processRequest(request, response);
            } catch (JSONException ex) {
                Logger.getLogger(AlunoController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (InterruptedException ex) {
            Logger.getLogger(AlunoController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
