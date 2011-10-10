<% 

    String login = request.getParameter("login");
    String senha = request.getParameter("senha");
    
    session.setAttribute("usuario", login);
    
    response.sendRedirect("/Perfetto/index.jsp");

%>