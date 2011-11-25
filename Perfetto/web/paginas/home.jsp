<%@page import="br.com.perfetto.controller.BannerController"%>
<%@page import="br.com.perfetto.entidades.Banner"%>
<%@page import="java.util.*"%>

<%
    //VARI�VEIS E OBJETOS
    BannerController banner = new BannerController();
%>

<div id="banner">
    <%if (session.getAttribute("logado") != null) {%>            
        <%@include file="../views/banner/banner-toolbar.jsp" %>
    <%}%>

    <% ArrayList<Banner> listBanner = banner.getBanners();%>
    <%if (listBanner.size() > 0) {%>
        <ul class="banner">
            <%for (int i = 0; i < listBanner.size(); i++) {%>
            <li><img src="images/banner/<%out.print(listBanner.get(i).getImage_path());%>" alt="" /></li>        
            <%}%>
        </ul>
        <%if (listBanner.size() > 1) {%>
            <div class="pager"></div>
        <%}%>
    <%}%>


</div>
<div class="border-shadow"></div>

<!-- AQUI EST�O AS JANELAS MODAL DO BANNER -->
<%if (session.getAttribute("logado") != null) {%>            
<%@include file="../views/banner/incluir.jsp" %>
<%@include file="../views/banner/editar.jsp" %>
<%@include file="../views/banner/deletar.jsp" %>
<%}%>
<!-- FIM JANELAS MODAL -->

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
                    <h3>Roberto Gerv�sio</h3>
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
                    <h3>Michel Tel�</h3>
                    <p><a href="http://www.youtube.com/embed/hcm55lU9knw">A� se eu te pego!</a></p>
                </div>
            </li>                                                                     
        </ul>                    
    </div>                
    <p class="next"><a href="#">next</a></p>
</div>
<div id="trainers">
    <%if(session.getAttribute("logado") != null){%>
    <%@include file="../views/personal-trainers/personal-toolbar.jsp"%>
    <%}%>
    <h2>Personal <%if(session.getAttribute("logado") == null){%>Trainers<%}%></h2>
    <ul>
        <li>
            <img src="images/trainers/trainers1.jpg" alt="" />
            <p>Neno - Muscula��o</p>
        </li>
        <li>
            <img src="images/trainers/trainers2.jpg" alt="" />
            <p>Neno - Muscula��o</p>
        </li>
        <li>
            <img src="images/trainers/trainers3.jpg" alt="" />
            <p>Neno - Muscula��o</p>
        </li>
        <li>
            <img src="images/trainers/trainers4.jpg" alt="" />
            <p>Neno - Muscula��o</p>
        </li>
        <li>
            <img src="images/trainers/trainers3.jpg" alt="" />
            <p>Neno - Muscula��o</p>
        </li>
        <li>
            <img src="images/trainers/trainers4.jpg" alt="" />
            <p>Neno - Muscula��o</p>
        </li>
    </ul>
</div>
    
<!-- AQUI EST�O AS JANELAS MODAL DO BANNER -->
<%if (session.getAttribute("logado") != null) {%>            
<%@include file="../views/personal-trainers/incluir.jsp" %>
<%//@include file="../views/banner/editar.jsp" %>
<%//@include file="../views/banner/deletar.jsp" %>
<%}%>
<!-- FIM JANELAS MODAL -->
    
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
