<%@page import="br.com.perfetto.entidades.HomeVideo"%>
<%@page import="br.com.perfetto.controller.HomeVideoController"%>
<%@page import="br.com.perfetto.entidades.Personal"%>
<%@page import="br.com.perfetto.controller.PersonalController"%>
<%@page import="br.com.perfetto.controller.BannerController"%>
<%@page import="br.com.perfetto.entidades.Banner"%>
<%@page import="java.util.*"%>

<%
    //VARI�VEIS E OBJETOS
    BannerController banner = new BannerController();
    PersonalController personal = new PersonalController();
    HomeVideoController video = new HomeVideoController();
    AlunoController aluno = new AlunoController();
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
    <% if(session.getAttribute("logado") != null){  %>
    <%@include file="../views/home-videos/home-videos-toolbar.jsp"%>
    <% } %>
    <div class="video"></div>
    <p class="prev"><a href="#">prev</a></p>
    <% ArrayList<HomeVideo> listaVideo = video.getVideos(); %>    
    <div class="carrossel">
    <%if(listaVideo.size() > 0){%>    
        <ul>
            <%for(int i = 0; i < listaVideo.size(); i++){%>
            <li>
                <div class="thumb">
                    <a href="<%out.print(listaVideo.get(i).getUrl_video());%>">
                        <img src="<%out.print(listaVideo.get(i).getUrl_thumb_video());%>" alt="" />
                    </a>
                </div>
                <div class="descricao">
                    <h3><%out.print(listaVideo.get(i).getTitulo());%></h3>
                    <p>
                        <a href="<%out.print(listaVideo.get(i).getUrl_video());%>">
                            <%out.print(listaVideo.get(i).getDescricao());%>
                        </a>
                    </p>
                </div>
            </li>
            <%}%>                                                                               
        </ul>
        <%}%>
    </div>                
    <p class="next"><a href="#">next</a></p>
</div>
    
<!-- AQUI EST�O AS JANELAS MODAL DOS VIDEOS DA HOME -->
<%if(session.getAttribute("logado")!= null){%>
<%@include file="../views/home-videos/incluir.jsp"%>
<%@include file="../views/home-videos/editar.jsp"%>
<%@include file="../views/home-videos/deletar.jsp"%>
<%}%>


<div id="trainers">
    <%if(session.getAttribute("logado") != null){%>
    <%@include file="../views/personal-trainers/personal-toolbar.jsp"%>
    <%}%>
    <h2>Personal <%if(session.getAttribute("logado") == null){%>Trainers<%}%></h2>
    <% ArrayList<Personal> listaPersonal = personal.getTrainers(); %>
    <% if(listaPersonal.size() > 0){ %>
        <%for(int i = 0; i < listaPersonal.size(); i++){%>
            <ul>
                <li class="showImage">            
                    <img src="images/trainers/thumb_<%out.print(listaPersonal.get(i).getImage_path());%>" alt="" />
                    <div class="nome-personal">
                        <a href="javascript:void(0)"><%out.print(listaPersonal.get(i).getNome());%></a>                                
                    </div>            
                    <div class="area-personal"><%out.print(listaPersonal.get(i).getArea());%></div>
                </li>        
            </ul>   
        <%}%>
    <%}%>
</div>
    
<!-- AQUI EST�O AS JANELAS MODAL DOS TRAINERS -->
<%if (session.getAttribute("logado") != null) {%>            
<%@include file="../views/personal-trainers/incluir.jsp" %>
<%@include file="../views/personal-trainers/editar.jsp" %>
<%@include file="../views/personal-trainers/deletar.jsp" %>
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
    <h2>Alunos <%if(session.getAttribute("logado") == null){%>Destaque<%}%></h2>
    <%if(session.getAttribute("logado") != null){%>
    <%@include file="../views/alunos-destaque/alunos-toolbar.jsp"%>
    <%}%>
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

<%if(session.getAttribute("logado") != null){%>
<%@include file="../views/alunos-destaque/incluir.jsp" %>
<%@include file="../views/alunos-destaque/editar.jsp" %>
<%}%>
    
    