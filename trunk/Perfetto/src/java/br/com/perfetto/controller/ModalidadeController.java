/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.controller;

import br.com.perfetto.entidades.Modalidade;
import br.com.perfetto.model.ModalidadeDao;
import br.com.perfetto.util.Aplication;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Samela
 */
public class ModalidadeController extends HttpServlet {

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
        
        if(incluir.equals(action)){
            this.insert(request, response);
        }else if(editar.equals(action)){
            //this.editBanner(request, response);
        }else if(deletar.equals(action)){
            //this.delete(request);
        }else{
            this.upload(request, response);
        }
        
    }
    
    private void upload(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, IOException{
        PrintWriter out = response.getWriter();
        
        String path = "images/modalidades/";        
        int resizeWidth = 280;
        int cropHeight = 230;
        int thumbWidth = 224;
        
        String itemName = Aplication.upload(request, path);        
        Aplication.thumbnailIt(path, itemName, resizeWidth, "");
        Aplication.cropIt(path, itemName, resizeWidth, cropHeight);
        Aplication.thumbnailIt(path, itemName, thumbWidth, "thumb_");
        

        out.print(""
                + "<img src=\""+path + itemName+"\" />"
                + "<input type=\"hidden\" id=\"modalidade-imagem\" value=\""+itemName+"\"/>");
                    
        out.close();
    }
    
    private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException{
        PrintWriter out = response.getWriter();
        
        Modalidade modalidade = new Modalidade();
        ModalidadeDao modalidadeDao = new ModalidadeDao();
        String modalidadeTitulo = request.getParameter("modalidade_titulo");        
        String modalidadeDescricao = request.getParameter("modalidade_descricao");
        String modalidadeImagem = request.getParameter("modalidade_imagem");
        
        try{        
            if(!modalidadeTitulo.isEmpty()){
                modalidade.setTitulo(modalidadeTitulo);
            }else{
                throw new Exception("<p class=\"vermelho\">Por favor informe o título da modalidade</p>");
            }
            
            if(!modalidadeDescricao.isEmpty()){
                modalidade.setDescricao(modalidadeDescricao);
            }else{
                throw new Exception("<p class=\"vermelho\">Por favor fale um pouco sobre a nova modalidade</p>");
            }
            
            if(modalidadeImagem != null){
                modalidade.setPath_image(modalidadeImagem);
            }else{
                throw new Exception("<p class=\"vermelho\">Por favor escolha uma imagem para modalidade</p>");
            }            

            modalidadeDao.insert(modalidade);

            out.print("<p class=\"verde\">Modalidade inserida com sucesso</p>");        
            
        }catch(Exception ex){
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
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(ModalidadeController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ModalidadeController.class.getName()).log(Level.SEVERE, null, ex);
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
