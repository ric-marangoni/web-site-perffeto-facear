<%@page import="br.com.perfetto.entidades.HomeVideo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.perfetto.controller.HomeVideoController"%>
<%
    //VARIÁVEIS E OBJETOS
    HomeVideoController editVideo = new HomeVideoController();
%>

<div id="home-video-editar" class="window">
    <!-- Botão para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Editar Video</h2>    
    
    <% ArrayList<HomeVideo> listaEditVideo = editVideo.getVideos();%>
    <%if (listaEditVideo.size() > 0) {%>
    <select class="select-edit" id="edit-home-video" name="edit-home-video">
        <option value="0" selected>Selecione um video</option>    
        <%for (int i = 0; i < listaEditVideo.size(); i++) {%>
            <%int id = listaEditVideo.get(i).getId();%>            
            <%String titulo_video = listaEditVideo.get(i).getTitulo();%>          
            <option value="<%out.print(id);%>"><%out.print(titulo_video);%></option>                       
        <%}%>    
    </select>
    <form id="form-home-video-editar">
        <span>Título:</span>
        <input type="text" name="titulo-home-video-editar" id="titulo-home-video-editar" class="medio" value="" />
        <span>URL Vídeo:</span>
        <input type="text" name="pre-url-video-editar" id="pre-url-video-editar" class="medio" value="" />        
        <input type="hidden" name="url-video-editar" id="url-video-editar" class="medio" value="" />        
        <input type="hidden" name="url-thumb-editar" id="url-thumb-editar" class="medio" value="" />
        <span>Descrição: </span>
        <textarea cols="36" rows="4" class="medio" name="descricao-video-editar" id="descricao-video-editar"></textarea>
        <br />
        <br />
        <br />
        <input type="button" id="video-ajax-submit-editar" class="ajax-submit home-video-ajax-submit" value="enviar" />        
        <div class="clear"></div>        
    </form>    
    <div class="ajax-msg"></div>
     <%}else{%>
     <h3>Você não possui trainer adicionado.</h3>     
     <%}%>    
    <div class="clear"></div>
    
</div>

<!-- Não remova o div#mask, pois ele é necessário para preencher toda a janela -->
<div id="mask"></div>


<script type="text/javascript">    
    jQuery(document).ready(function(){        
        jQuery('#edit-home-video').change(function(){            
            if(jQuery(this).val() != 0){                
                jQuery.ajax({
                    url: 'HomeVideoController?action=preEdit',
                    type: 'post',
                    data: 'id='+jQuery('#edit-home-video').val(),
                    beforeSend: function(){
                        ajaxLoader.show();
                    },
                    success: function(response){
                        
                        video = jQuery.parseJSON(response);
                        
                        var url = video.url_video.split("/");                       
                        
                        jQuery('#titulo-home-video-editar').val(video.titulo);                        
                        jQuery('#pre-url-video-editar').val('http://youtu.be/'+url[4]);                        
                        jQuery('#descricao-video-editar').val(video.descricao);                        
                                               
                        ajaxLoader.hide();
                        jQuery('#form-home-video-editar').fadeIn();                        
                    }            
                });      
            }            
        });
                
        jQuery('#video-ajax-submit-editar').click(function(){            
            
            var input_video = jQuery('#pre-url-video-editar').val().split("/");
            
            var params = {
                video_id: jQuery('#edit-home-video').val(),
                video_titulo: jQuery('#titulo-home-video-editar').val(),
                video_url: 'http://www.youtube.com/embed/'+input_video[3],
                video_url_thumb: 'http://i2.ytimg.com/vi/'+input_video[3]+'/default.jpg',
                video_descricao: jQuery('#descricao-video-editar').val()
            };
            
            ajax.normalRequest('HomeVideoController', 'editar', params, '.ajax-msg');            
        });   
        
    });
</script>