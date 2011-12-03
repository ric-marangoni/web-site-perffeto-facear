<div id="home-video-incluir" class="window">
    <!-- Botão para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Incluir Vídeo</h2>    

    <form id="form-home-video">
        <span>Título:</span>
        <input type="text" name="titulo-home-video" id="titulo-home-video" class="medio" value="" />
        <span>URL Vídeo:</span>
        <input type="text" name="pre-url-video" id="pre-url-video" class="medio" value="" />
        <input type="hidden" name="url-video" id="url-video" class="medio" value="" />        
        <input type="hidden" name="url-thumb" id="url-thumb" class="medio" value="" />
        <span>Descrição: </span>
        <textarea cols="36" rows="4" class="medio" name="descricao-video" id="descricao-video"></textarea>
        <br />
        <br />
        <br />
        <input type="button" id="video-ajax-submit" class="ajax-submit" value="enviar" />        
        <div class="clear"></div>        
    </form>    
    <div class="ajax-msg"></div>


</div>

<!-- Não remova o div#mask, pois ele é necessário para preencher toda a janela -->
<div id="mask"></div>

<script type="text/javascript">
    jQuery(document).ready(function(){
            jQuery('#video-ajax-submit').click(function(){
                
                var input_video = jQuery('#pre-url-video').val().split("/");
                jQuery('#url-video').val('http://www.youtube.com/embed/'+input_video[3]);
                jQuery('#url-thumb').val('http://i2.ytimg.com/vi/'+input_video[3]+'/default.jpg');
                
                var dados = jQuery('#form-home-video').serialize();
                
                ajax.normalRequest('HomeVideoController', 'incluir', dados, '.ajax-msg');                  
                
            });
            
        });      
   
   
</script>