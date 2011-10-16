<div id="banner">
    <%if (session.getAttribute("logado") != null) {%>            
    <div class="banner-toolbar">
        <ul>
            <li class="add">
                <a href="#banner-incluir" name="modal">incluir banner</a>     
            </li>
            <li class="editar">
                <a href="#banner-incluir" name="modal">editar banner</a>     
            </li>
            <li class="excluir">
                <a href="#banner-incluir" name="modal">excluir banner</a>     
            </li>
        </ul>
    </div>    
    <%}%>
    <ul class="banner">
        <li><img src="images/banner/musculacao.jpg" alt="Musculação" /></li>
        <li><img src="images/banner/muay-thai.jpg" alt="Musculação" /></li>				
    </ul>	
    <div class="pager"></div>    
</div>
<div class="border-shadow"></div>

<!-- AQUI ESTÃO AS JANELAS MODAL DO BANNER -->
<%if (session.getAttribute("logado") != null) {%>            
<%@include file="../views/banner/incluir.jsp" %>
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
