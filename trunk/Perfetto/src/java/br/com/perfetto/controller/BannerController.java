package br.com.perfetto.controller;

import br.com.perfetto.entidades.Banner;
import br.com.perfetto.model.BannerDao;
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
/**
 *
 * @author Ricardo
 */
public class BannerController extends HttpServlet {

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
        
        String action = request.getParameter("action");
        String incluir = "incluir";
        String editar = "editar";
        String deletar = "deletar";
        
        if(incluir.equals(action)){
            this.insertBanner(request, response);
        }else if(editar.equals(action)){
            this.editBanner(request, response);
        }else if(deletar.equals(action)){
            this.deleteBanner(request, response);
        }        
    }    

    private void insertBanner(HttpServletRequest request, HttpServletResponse response) throws IOException, InterruptedException {
        PrintWriter out = response.getWriter();
        Banner banner = new Banner();
        BannerDao bannerDao = new BannerDao();
       
        String path = "images/banner/";
        int resizeWidth = 1000;
        int thumbWidth = 350;
        
        String itemName = Aplication.upload(request, path);
        Aplication.resizeIt(path, itemName, resizeWidth, "");
        Aplication.resizeIt(path, itemName, thumbWidth, "thumb_");
        
        banner.setImage_path(itemName);

        bannerDao.insert(banner);

        out.print("<p class=\"verde\">Banner inserido com sucesso!</p>");
        
        //out.print(Aplication.getCropImageProperties("images/banner/" +itemName, 1000, 250));
                    
        out.close();
    }
    
    private void editBanner(HttpServletRequest request, HttpServletResponse response) throws IOException, InterruptedException {
        PrintWriter out = response.getWriter();
        Banner banner = new Banner();
        BannerDao bannerDao = new BannerDao();
        
        String path = "images/banner/";
        int resizeWidth = 1000;
        int thumbWidth = 350;
        
        String itemName = Aplication.upload(request, path);
        Aplication.resizeIt(path, itemName, resizeWidth, "");
        Aplication.resizeIt(path, itemName, thumbWidth, "thumb_");         
        
        banner.setId(Integer.parseInt(request.getParameter("id")));
        banner.setImage_path(itemName);

        bannerDao.edit(banner);

        out.print("<img src=\""+path+"thumb_"+itemName+"\" alt=\"\" />");
        
        out.close();
    }
    
    private void deleteBanner(HttpServletRequest request, HttpServletResponse response){        
        BannerDao bannerDao = new BannerDao();
        Banner banner = new Banner();
        
        banner.setId(Integer.parseInt(request.getParameter("id")));
        
        bannerDao.delete(banner);
    }

    public ArrayList<Banner> getBanners() {

        BannerDao bannerDao = new BannerDao();

        return bannerDao.getAllBanners();
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
            Logger.getLogger(BannerController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(BannerController.class.getName()).log(Level.SEVERE, null, ex);
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
