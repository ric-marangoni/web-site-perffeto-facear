<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        
        <!-- LINK ARQUIVOS CSS -->
        <link href="css/estilo.css" type="text/css" rel="stylesheet" />
        <link href="css/Jcrop.css" type="text/css" rel="stylesheet" />
        <link href="css/ui-lightness/jquery-ui.css" type="text/css" rel="stylesheet" /> 
        <link href="css/personal-trainers.css" type="text/css" rel="stylesheet" />
        <link href="css/modalidades.css" type="text/css" rel="stylesheet" />
        <link href="css/alunos-destaque.css" type="text/css" rel="stylesheet" />
        <link href="css/home-videos.css" type="text/css" rel="stylesheet" />
        
        <!-- LINK ARQUIVOS JAVASCRIPT -->
        <script type="text/javascript" src="js/jQuery.js"></script>
        <script type="text/javascript" src="js/jQueryUI.js"></script>
        <script type="text/javascript" src="js/jquery.cycle.js"></script>
        <script type="text/javascript" src="js/carrosel.js"></script>
        <script type="text/javascript" src="js/util.js" ></script>
        <script type="text/javascript" src="js/mousewheel.js" ></script>
        <script type="text/javascript" src="js/modal.js" ></script>
        <script type="text/javascript" src="js/ajaxLoader.js" ></script>
        <script type="text/javascript" src="js/AjaxUpload.js" ></script>        
        <script type="text/javascript" src="js/ajax.js" ></script>                
        <script type="text/javascript" src="js/Jcrop.js" ></script>       
        
        <link rel="icon" href="images/logo-perfetto-fav-icon.gif" type="image/x-icon"/>
        <!--[if IE 6]>
            <link href="css/ie6.css" rel="stylesheet" type="text/css" />
        <![endif]-->
        <title>Perfetto Academia</title>
    </head>
    <body>        
        <div id="topo">
            <%if (session.getAttribute("logado") != null) {%>                                   
            <div class="toolbar-admin">            
                <form action="AdminController" method="post">
                    <input type="submit" value="desativar painéis administrativos" />
                    <input type="hidden" name="action" value="0" />                
                </form>                        
            </div>
            <%}%>
            <img src="images/topo.jpg" class="banner-crop" alt="Perfetto Academia" />
        </div>        
        <div id="bg-menu">
            <ul id="menu">
                <li class="menu-right"></li>			
                <li class="menu-left"></li>
                <li><a href="index.jsp?pagina=home">HOME</a></li>
                <li><a href="index.jsp?pagina=historia">A PERFETTO</a></li>
                <li><a href="index.jsp?pagina=modalidades">MODALIDADES</a></li>
                <li><a href="index.jsp?pagina=horarios">HORÁRIOS</a></li>
                <li><a href="#">GALERIA</a>
                    <ul>
                        <li><a href="#" rel="tooltip" title="Ooops! Esta opção está inativa por enquanto">VIDEOS</a></li>
                        <li><a href="#" rel="tooltip" title="Ooops! Esta opção está inativa por enquanto">FOTOS</a></li>
                    </ul>
                </li>
                <li><a style="border: 0;" href="index.jsp?pagina=contato">CONTATO</a></li>			
            </ul>		
        </div>       	
        <div id="wrap">
             <%                
                String url = request.getParameter("pagina");
                String file = "paginas/home.jsp";
                
                if(url != null && url != ""){
                    file = "paginas/"+url+".jsp";                
                }                
             %>                
             <jsp:include page="<%=file%>" flush="true"/>
             
        </div><!-- wrap -->
        <div id="rodape">
            <div id="rodape-centro">                	
                <div class="institucional">                    
                    <ul>
                        <li><a href="index.jsp?pagina=home">Home</a></li>
                        <li><a href="index.jsp?pagina=historia">A Perfetto</a></li>
                        <li><a href="index.jsp?pagina=modalidades">Modalidades</a></li>
                        <li><a href="index.jsp?pagina=horarios">Horários</a></li>
                        <li><a href="#">Galeria de Videos</a></li>
                        <li><a href="#">Galeria de Fotos</a></li>
                        <li style="background: none;"><a href="index.jsp?pagina=contato">Contato</a></li>									
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
