<%@page import="br.com.perfetto.model.AdminDao" %>

<%
    String login = request.getParameter("login");
    String senha = request.getParameter("senha");
    
    if(login == ""){
        out.print("Por favor informe seu login");
    }else if(senha == ""){
        out.print("Por favor informe sua senha");
    }else{
        AdminDao ad = new AdminDao();
        response.sendRedirect("/Perfetto/index.jsp");
    }
%>