/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.controller;

import br.com.perfetto.entidades.HomeVideo;
import br.com.perfetto.model.HomeVideoDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ederon Bruno
 */
@WebServlet(name = "HomeVideoController", urlPatterns = {"/HomeVideoController"})
public class HomeVideoController extends HttpServlet {

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
            //this.editBanner(request, response);
        }else{
            //this.delete(request);
        }
        
    }
    
    private void insert(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        PrintWriter out = response.getWriter();
        
        HomeVideo video = new HomeVideo();
        HomeVideoDao videoDao = new HomeVideoDao();
        
        String titulo = request.getParameter("titulo-home-video");
        String url_video = request.getParameter("url-video");
        String url_uthumb_video = request.getParameter("url-thumb");
        String descricao = request.getParameter("descricao-video");
        
        try{
        
            if(titulo.isEmpty()){
                throw new Exception("<p class=\"vermelho\">Por favor dê um título ao video</p>");
            }else{
                video.setTitulo(titulo);        
            }
            
            if(url_video.isEmpty()){
                throw new Exception("<p class=\"vermelho\">Por favor coloque a url do video</p>");
            }else{
                video.setUrl_video(url_video);        
            }
            
            if(url_uthumb_video.isEmpty()){
                throw new Exception("<p class=\"vermelho\">Por favor escolha uma imagem para o video</p>");
            }else{
                video.setUrl_thumb_video(url_uthumb_video);   
            }
            
            if(descricao.isEmpty()){
                throw new Exception("<p class=\"vermelho\">Por favor coloque alguma descrição</p>");
            }else{
                video.setDescricao(descricao);
            }
            
            videoDao.insert(video);
            out.print("<p class=\"verde\">Video inserido com sucesso</p>");
            
        }catch(Exception ex){
            out.print(ex.getMessage());
        }finally{
            out.close();
        }        
    }
    
    public ArrayList<HomeVideo> getVideos(){
        return new HomeVideoDao().getVideos();   
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
