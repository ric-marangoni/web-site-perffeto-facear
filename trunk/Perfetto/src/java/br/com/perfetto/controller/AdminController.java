package br.com.perfetto.controller;

import br.com.perfetto.entidades.Admin;
import br.com.perfetto.model.AdminDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminController extends HttpServlet {

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
        
        Admin admin = new Admin();
        AdminDao admin_dao = new AdminDao();
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        boolean logged = false;
        
        admin.setLogin(login);
        admin.setSenha(senha);
        
        admin_dao.tryLogin(login, senha);
        
        
    }    
}
