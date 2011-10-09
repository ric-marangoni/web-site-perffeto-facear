<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="css/estilo.css" type="text/css" rel="stylesheet" />
        <link href="css/ui-lightness/jquery-ui.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="js/jQuery.js"></script>
        <script type="text/javascript" src="js/jQueryUI.js"></script>
        <script type="text/javascript" src="js/jquery.cycle.js"></script>
        <script type="text/javascript" src="js/carrosel.js"></script>
        <script type="text/javascript" src="js/util.js" ></script>
        <script type="text/javascript" src="js/mousewheel.js" ></script>
        <link rel="icon" href="images/logo-perfetto-fav-icon.gif" type="image/x-icon"/>
        <!--[if IE 6]>
            <link href="css/ie6.css" rel="stylesheet" type="text/css" />
        <![endif]-->
        <title>Perfetto Academia</title>
    </head>
    <body>        
        <div id="topo">
            <img src="images/topo.jpg" alt="Perfetto Academia" title="Perfetto Academia" />
        </div>        
        <div id="bg-menu">
            <ul id="menu">
                <li class="menu-right"></li>			
                <li class="menu-left"></li>
                <li><a href="#">HOME</a></li>
                <li><a href="index.jsp?pagina=historia">A PERFETTO</a></li>
                <li><a href="paginas/modalidades.html">MODALIDADES</a></li>
                <li><a href="paginas/horarios.html">HORÁRIOS</a></li>
                <li><a href="#">GALERIA</a>
                    <ul>
                        <li><a href="#" rel="tooltip" title="Ooops! Esta opção está inativa por enquanto">VIDEOS</a></li>
                        <li><a href="#" rel="tooltip" title="Ooops! Esta opção está inativa por enquanto">FOTOS</a></li>
                    </ul>
                </li>
                <li><a style="border: 0;" href="paginas/contato.html">CONTATO</a></li>			
            </ul>		
        </div>       	
        <div id="wrap">
             <%
                String url = request.getParameter("pagina");
                
                if(url == null){                    
                %>
                    <jsp:include page="paginas/home.jsp" flush="true" />
                <%
                }else{
                
                %>
                    <jsp:include page="paginas/.jsp" flush="true" />
                <%  
                }                
             %>
        </div><!-- wrap -->
        <div id="rodape">
            <div id="rodape-centro">                	
                <div class="institucional">                    
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">A Perfetto</a></li>
                        <li><a href="#">Modalidades</a></li>
                        <li><a href="#">Horários</a></li>
                        <li><a href="#">Galeria de Videos</a></li>
                        <li><a href="#">Galeria de Fotos</a></li>
                        <li style="background: none;"><a href="#">Contato</a></li>									
                    </ul>
                </div> 
            </div>
            <div class="clear"></div>
            <div class="copy-right">
                <div class="rodape-autor">
                    <span>Desenvolvido por <strong>ELR Web Systems</strong></span>
                </div>
                <span>Todos os direitos reservados</span>			
            </div>
        </div>
    </body>
</html>
