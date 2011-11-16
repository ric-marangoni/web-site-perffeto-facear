package br.com.perfetto.controller;

import br.com.perfetto.entidades.Banner;
import br.com.perfetto.model.BannerDao;
import br.com.perfetto.util.Aplication;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

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
            throws ServletException, IOException {
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

    private void insertBanner(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (!isMultipart) {
            out.print("Não foi possível fazer requisição!" + request);
        } else {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            Banner banner = new Banner();
            BannerDao bannerDao = new BannerDao();
            List items = null;

            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e) {
                out.print(e.getMessage());
            }

            try {

                Iterator itr = items.iterator();

                FileItem item = (FileItem) itr.next();

                String itemName = (new File(item.getName()).getName());

                File savedFile = new File(Aplication.getBasePath() + "images/banner/" + itemName);

                item.write(savedFile);  // upload realizado

                banner.setImage_path("images/banner/" + itemName);

                bannerDao.insert(banner);

                out.print("Banner inserido com sucesso!");

            } catch (Exception e) {
                out.print(e.getMessage());
            }
        }
        out.close();
    }
    
    private void editBanner(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (!isMultipart) {
            out.print("Não foi possível fazer requisição!" + request);
        } else {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            Banner banner = new Banner();
            BannerDao bannerDao = new BannerDao();
            List items = null;

            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e) {
                out.print(e.getMessage());
            }

            try {

                Iterator itr = items.iterator();

                FileItem item = (FileItem) itr.next();

                String itemName = (new File(item.getName()).getName());

                File savedFile = new File(Aplication.getBasePath() + "images/banner/" + itemName);

                item.write(savedFile);  // upload realizado

                banner.setId(Integer.parseInt(request.getParameter("id")));
                banner.setImage_path("images/banner/" + itemName);

                bannerDao.edit(banner);

                out.print("<img src=\"images/banner/" + itemName + "\" />");

            } catch (Exception e) {
                out.print(e.getMessage());
            }
        }
        out.close();
    }
    
    private void deleteBanner(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        BannerDao bannerDao = new BannerDao();
        Banner banner = new Banner();
        
        banner.setId(Integer.parseInt(request.getParameter("id")));
        
        bannerDao.delete(banner);
        
        out.print("Banner excluído com sucesso!");
        
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
