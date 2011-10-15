package br.com.perfetto.controller;

import br.com.perfetto.entidades.Admin;
import br.com.perfetto.model.AdminDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        
        Admin admin = new Admin();
        AdminDao admin_dao = new AdminDao();
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        boolean logged = false;
        String msgErro = "";
        
        if(login.isEmpty()){
            msgErro = "Por favor digite seu login";
        }else if(senha.isEmpty()){
            msgErro = "Por favor digite sua senha";
        }else{
            admin.setLogin(login);
            admin.setSenha(senha);
        
            logged = admin_dao.login(admin);
        }
        
        if(logged){
            HttpSession session = request.getSession(true);
            session.setAttribute("logado", true);
            response.sendRedirect("index.jsp");
        }else{
            request.setAttribute("msgErro", msgErro);
            request.setAttribute("path", "admin/");
            request.getRequestDispatcher("admin/index.jsp").forward(request, response);            
        }
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
