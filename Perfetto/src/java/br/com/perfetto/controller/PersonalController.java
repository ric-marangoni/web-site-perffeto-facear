/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.controller;

import br.com.perfetto.entidades.Personal;
import br.com.perfetto.model.PersonalDao;
import br.com.perfetto.util.Aplication;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import  javax.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;


/**
 *
 * @author LÍDIA
 */
public class PersonalController extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InterruptedException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String action = request.getParameter("action");
        String incluir = "incluir";
        String editar = "editar";
        String deletar = "deletar";
        String upload = "upload";
        String preEdit = "preEdit";
        
        if(incluir.equals(action)){
            this.insert(request, response);
        }else if(editar.equals(action)){
            this.edit(request, response);
        }else if(deletar.equals(action)){
            this.deleteTrainer(request);
        }else if(preEdit.equals(action)){
            this.getTrainerById(request, response);
        }else{
            this.upload(request, response);
        }
    }
    
    private void upload(HttpServletRequest request, HttpServletResponse response) throws IOException, InterruptedException {
        PrintWriter out = response.getWriter();
        
        String path = "images/trainers/";        
        int resizeWidth = 500;
        int thumbWidth = 106;
        
        String itemName = Aplication.upload(request, path);        
        Aplication.resizeIt(path, itemName, resizeWidth, "");
        Aplication.thumbnailIt(path, itemName, thumbWidth, "thumb_");
        

        out.print(""
                + "<img src=\""+path + "thumb_"+itemName+"\" />"
                + "<input type=\"hidden\" id=\"imagem-personal\" value=\""+itemName+"\"/>");
                    
        out.close();
    }

    private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException, InterruptedException {
        PrintWriter out = response.getWriter();
        
        Personal personal = new Personal();
        PersonalDao personalDao = new PersonalDao();
        String personalNome = request.getParameter("personal_nome");        
        String personalArea = request.getParameter("personal_modalidade");
        String personalImagem = request.getParameter("personal_imagem");
        
        try{        
            if(!personalNome.isEmpty()){
                personal.setNome(personalNome);
            }else{
                throw new Exception("<p class=\"vermelho\">Por favor informe o nome do personal</p>");
            }
            
            if(!personalArea.isEmpty()){
                personal.setArea(personalArea);
            }else{
                throw new Exception("<p class=\"vermelho\">Por favor informe a área de atuação do personal</p>");
            }
            
            if(personalImagem != null){
                personal.setImage_path(personalImagem);
            }else{
                throw new Exception("<p class=\"vermelho\">Por favor escolha uma imagem para o personal</p>");
            }            

            personalDao.insert(personal);

            out.print("<p class=\"verde\">Trainer inserido com sucesso</p>");        
            
        }catch(Exception ex){
            out.print(ex.getMessage());
        }
        
    }
    
    private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException{
        PrintWriter out = response.getWriter();
        
        Personal personal = new Personal();
        PersonalDao personalDao = new PersonalDao();        
        String personalNome = request.getParameter("personal_nome");        
        String personalArea = request.getParameter("personal_modalidade");
        String personalImagem = request.getParameter("personal_imagem");        
        personal.setId(Integer.parseInt(request.getParameter("personal_id")));
        
        
        try{
            if(!personalNome.isEmpty()){
                personal.setNome(personalNome);
            }else{
                throw new Exception("<p class=\"vermelho\">Por favor informe o nome do personal</p>");
            }
            
            if(!personalArea.isEmpty()){
                personal.setArea(personalArea);
            }else{
                throw new Exception("<p class=\"vermelho\">Por favor informe a área de atuação do personal</p>");
            }
            
            if(personalImagem != null){
                personal.setImage_path(personalImagem);
            }else{
                throw new Exception("<p class=\"vermelho\">Por favor escolha uma imagem para o personal</p>");
            }   
            
            personalDao.edit(personal);
            out.print("<p class=\"verde\">Trainer editado com sucesso</p>");
            
        }catch(Exception ex){
            out.print(ex.getMessage());
        }finally{
            out.close();
        }
        
    }
    
    private void deleteTrainer(HttpServletRequest request){
        Personal personal = new Personal();
        PersonalDao personalDao = new PersonalDao();
        
        personal.setId(Integer.parseInt(request.getParameter("id")));
        
        personalDao.delete(personal);
    }
    
    public ArrayList<Personal> getTrainers(){
        
        PersonalDao personalDao = new PersonalDao();
        
        return personalDao.getAllTrainers();
        
    }
    
    private void getTrainerById(HttpServletRequest request, HttpServletResponse response) throws IOException{        
        PrintWriter out = response.getWriter();
        
        PersonalDao personalDao = new PersonalDao();
        
        Personal personal = personalDao.getTrainerById(Integer.parseInt(request.getParameter("id")));
        
        try{
            JSONObject jPersonal = new JSONObject();
            
            jPersonal.put("id", personal.getId());
            jPersonal.put("nome", personal.getNome());
            jPersonal.put("imagem", personal.getImage_path());
            jPersonal.put("area", personal.getArea());
            out.print(jPersonal);
        }catch(JSONException ex){
            out.print(ex);
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
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(PersonalController.class.getName()).log(Level.SEVERE, null, ex);
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
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(PersonalController.class.getName()).log(Level.SEVERE, null, ex);
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
