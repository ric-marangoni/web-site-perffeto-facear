<%@page contentType="text/html" pageEncoding="UTF-8"%>
<?xml version="1.0" encoding="UTF-8" ?>
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
                <li><a href="paginas/historia.html">A PERFETTO</a></li>
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
             <div id="banner">
                <ul>
                    <li><img src="images/banner/musculacao.jpg" alt="Musculação" /></li>
                    <li><img src="images/banner/muay-thai.jpg" alt="Musculação" /></li>				
                </ul>	
                <div class="pager"></div>			
            </div>
            <div class="border-shadow"></div>
            <div id="bloco-destaque">
                <h2>Videos</h2>
                <div class="video"></div>
                <p class="prev"><a href="#">prev</a></p>
                <div class="carrossel">                    
                    <ul>
                        <li>
                            <div class="thumb">
                                <a href="http://www.youtube.com/embed/K82jW0G_4nU">
                                    <img src="images/carrossel/teste1.jpg" alt="" />
                                </a>
                            </div>
                            <div class="descricao">
                                <h3>Roberto Gervásio</h3>
                                <p>
                                    <a href="http://www.youtube.com/embed/K82jW0G_4nU">
                                        NABBA BRASIL 2010 
                                    </a>
                                </p>
                            </div>
                        </li>
                        <li>
                            <div class="thumb">
                                <a href="http://www.youtube.com/embed/iy4mXZN1Zzk">
                                    <img src="images/carrossel/teste4.jpg" alt="" />
                                </a>
                            </div>
                            <div class="descricao">
                                <h3>Robbie Williams</h3>
                                <p>
                                    <a href="http://www.youtube.com/embed/iy4mXZN1Zzk">
                                        Feel
                                    </a>
                                </p>
                            </div>                            
                        </li>                        
                        <li>
                            <div class="thumb">
                                <a href="http://www.youtube.com/embed/hcm55lU9knw">
                                    <img src="images/carrossel/teste2.jpg" alt="" />
                                </a>
                            </div>
                            <div class="descricao">
                                <h3>Michel Teló</h3>
                                <p><a href="http://www.youtube.com/embed/hcm55lU9knw">Aí se eu te pego!</a></p>
                            </div>
                        </li>                                                                     
                    </ul>                    
                </div>                
                <p class="next"><a href="#">next</a></p>
            </div>
            <div id="trainers">
                <h2>Personal Trainers</h2>
                <ul>
                    <li>
                        <img src="images/trainers/trainers1.jpg" alt="" />
                        <p>Neno - Musculação</p>
                    </li>
                    <li>
                        <img src="images/trainers/trainers2.jpg" alt="" />
                        <p>Neno - Musculação</p>
                    </li>
                    <li>
                        <img src="images/trainers/trainers3.jpg" alt="" />
                        <p>Neno - Musculação</p>
                    </li>
                    <li>
                        <img src="images/trainers/trainers4.jpg" alt="" />
                        <p>Neno - Musculação</p>
                    </li>
                    <li>
                        <img src="images/trainers/trainers3.jpg" alt="" />
                        <p>Neno - Musculação</p>
                    </li>
                    <li>
                        <img src="images/trainers/trainers4.jpg" alt="" />
                        <p>Neno - Musculação</p>
                    </li>
                </ul>
            </div>            
            <div id="home-modalidades">
				<h2>Modalidades</h2>
				<ul>
					<li>
						<a href="#">
							<img src="images/modalidades/spinning.jpg" alt="" />							
						</a>
                        <div><a href="#">Spinning</a></div>
					</li>
					<li>
						<a href="#">
							<img src="images/modalidades/jump-home.jpg" alt="" />							
						</a>						
                        <div><a href="#">Power Jump</a></div>
                    </li>
					<li>
						<a href="#">
							<img src="images/modalidades/Muay-thai.jpg" alt="" />							
						</a>						
                        <div><a href="#">Muay Thai</a></div>
					</li>					
					<li>
						<a href="#">
							<img src="images/modalidades/pump-home.jpg" alt="" />														
						</a>						
                        <div><a href="#">Body Pump</a></div>
					</li>
				</ul>
                <a href="paginas/modalidades.html" class="mais-modalidades">Veja todas as modalidades</a>
			</div>
			<div id="alunos-destaque">
                <h2>Alunos Destaque</h2>				
                <div id="scroll-pane">
                    <div id="scroll-content">
                        <div class="scroll-content-item">
                            <img src="images/trainers/trainers1.jpg" alt="" />
                            <div class="nome-aluno">
                                <a href="#">Exemplo 1</a>
                            </div>
                        </div>
                        <div class="scroll-content-item">
                            <img src="images/trainers/trainers4.jpg" alt="" />
                            <div class="nome-aluno">
                                <a href="#">Exemplo 2</a>
                            </div>
                        </div>
                        <div class="scroll-content-item">
                            <img src="images/trainers/trainers3.jpg" alt="" />
                            <div class="nome-aluno">
                                <a href="#">Exemplo 3</a>
                            </div>
                        </div>
                        <div class="scroll-content-item">
                            <img src="images/trainers/trainers1.jpg" alt="" />
                            <div class="nome-aluno">
                                <a href="#">Exemplo 1</a>
                            </div>
                        </div>
                        <div class="scroll-content-item">
                            <img src="images/trainers/trainers4.jpg" alt="" />
                            <div class="nome-aluno">
                                <a href="#">Exemplo 2</a>
                            </div>
                        </div>
                        <div class="scroll-content-item">
                            <img src="images/trainers/trainers3.jpg" alt="" />
                            <div class="nome-aluno">
                                <a href="#">Exemplo 3</a>
                            </div>
                        </div>
                        <div class="scroll-content-item">
                            <img src="images/trainers/trainers1.jpg" alt="" />
                            <div class="nome-aluno">
                                <a href="#">Exemplo 1</a>
                            </div>
                        </div>
                        <div class="scroll-content-item">
                            <img src="images/trainers/trainers4.jpg" alt="" />
                            <div class="nome-aluno">
                                <a href="#">Exemplo 2</a>
                            </div>
                        </div>
                        <div class="scroll-content-item">
                            <img src="images/trainers/trainers3.jpg" alt="" />
                            <div class="nome-aluno">
                                <a href="#">Exemplo 3</a>
                            </div>
                        </div>
                        <div class="scroll-content-item">
                            <img src="images/trainers/trainers1.jpg" alt="" />
                            <div class="nome-aluno">
                                <a href="#">Exemplo 1</a>
                            </div>
                        </div>
                        <div class="scroll-content-item">
                            <img src="images/trainers/trainers4.jpg" alt="" />
                            <div class="nome-aluno">
                                <a href="#">Exemplo 2</a>
                            </div>
                        </div>
                        <div class="scroll-content-item">
                            <img src="images/trainers/trainers3.jpg" alt="" />
                            <div class="nome-aluno">
                                <a href="#">Exemplo 3</a>
                            </div>
                        </div>
                    </div>                                   
                </div>
            </div>            
			<div class="clear"></div>
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
