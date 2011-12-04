<%@page import="br.com.perfetto.entidades.HomeVideo"%>
<%@page import="br.com.perfetto.controller.HomeVideoController"%>
<%@page import="java.util.*"%>

<%
    //VARIÁVEIS E OBJETOS
    HomeVideoController deleteVideo = new HomeVideoController();
%>

<div id="home-video-excluir" class="window">
    <!-- Botão para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Excluir Video</h2>    
    
    <% ArrayList<HomeVideo> listaDeleteVideo = deleteVideo.getVideos();%>
    <%if (listaDeleteVideo.size() > 0) {%>
        <form>        
            <div class="painel-rolagem">                                
                <ul class="editar">
                    
                    <%for (int i = 0; i < listaDeleteVideo.size(); i++) {%>
                    <%int id = listaDeleteVideo.get(i).getId();%>
                    <%String video_titulo = listaDeleteVideo.get(i).getTitulo();%>                    
                    <%String video_descricao = listaDeleteVideo.get(i).getDescricao();%>
                    <%String video_thumb = listaDeleteVideo.get(i).getUrl_thumb_video();%>
                    
                    <li id="item-homevideo-excluir-<%out.print(id);%>">                           
                        <div class="thumb">
                            <img src="<%out.print(video_thumb);%>" alt="" />
                        </div>
                        <div class="descricao">
                            <h3><%out.print(video_titulo);%></h3>
                            <p><%out.print(video_descricao);%></p>
                        </div>                        
                        <input type="button" class="ajax-submit btn-excluir home-video-excluir" id="homevideo-excluir-<%out.print(id);%>" value="Exluir Video" />   
                    </li>        
                    <%}%>
                </ul>
            </div>
            <div class="ajax-msg"></div>
        </form>
     <%}else{%>
     <h3>Você não possui video adicionado.</h3>     
     <%}%>    
    <div class="clear"></div>
    
</div>

<!-- Não remova o div#mask, pois ele é necessário para preencher toda a janela -->
<div id="mask"></div>


<script type="text/javascript">    
    jQuery(document).ready(function(){        
        jQuery('.home-video-excluir').click(function(){            
            if(window.confirm("Tem certeza que deseja excluir esse video?")){
                var paramId = jQuery(this).attr('id').split("-");
                var id = paramId[2];
                ajax.deleteRequest('HomeVideoController', id, 'item-homevideo-excluir-');
            }
        });
    });
</script>
