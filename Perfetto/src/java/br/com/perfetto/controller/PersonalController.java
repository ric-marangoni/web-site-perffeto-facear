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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        
        if(incluir.equals(action)){
            this.insertPersonal(request, response);
        }else if(editar.equals(action)){
            //this.editBanner(request, response);
        }else if(deletar.equals(action)){
            //this.deleteBanner(request, response);
        }else{
            this.upload(request, response);
        }
    }
    
    private void upload(HttpServletRequest request, HttpServletResponse response) throws IOException, InterruptedException {
        PrintWriter out = response.getWriter();
        
        String path = "images/trainers/";
        int resizeWidth = 1000;
        int thumbWidth = 109;
        
        String itemName = Aplication.upload(request, path, resizeWidth, thumbWidth); 

        out.print("<img src=\""+path + "thumb_"+itemName+"\" />");
                    
        out.close();
    }

    private void insertPersonal(HttpServletRequest request, HttpServletResponse response) throws IOException, InterruptedException {
        PrintWriter out = response.getWriter();
        
        Personal personal = new Personal();
        PersonalDao personalDao = new PersonalDao();
                
        personal.setNome(request.getParameter("personal_nome"));
        personal.setArea(request.getParameter("personal_modalidade"));
        personal.setImage_path(request.getParameter("personal_imagem"));
        
        personalDao.insert(personal);
        
        out.print("Personal trainer inserido com sucesso");
        
        //Personal personal = new Personal();
        /*BannerDao bannerDao = new BannerDao();
       
        String path = "images/banner/";
        int resizeWidth = 1000;
        int thumbWidth = 350;
        
        String itemName = Aplication.upload(request, path, resizeWidth, thumbWidth); 
        
        banner.setImage_path(itemName);

        bannerDao.insert(banner);

        out.print("<p class=\"verde\">Banner inserido com sucesso!</p>");
        
        //out.print(Aplication.getCropImageProperties("images/banner/" +itemName, 1000, 250));
                    
        out.close();*/
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
