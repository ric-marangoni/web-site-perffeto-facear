<div id="home-video-incluir" class="window">
    <!-- Bot�o para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Incluir V�deo</h2>    

    <form id="form-home-video">
        <span>T�tulo:</span>
        <input type="text" name="titulo-home-video" id="titulo-home-video" class="medio" value="" />
        <span>URL V�deo:</span>
        <input type="text" name="pre-url-video" id="pre-url-video" class="medio" value="" />
        <input type="hidden" name="url-video" id="url-video" class="medio" value="" />        
        <input type="hidden" name="url-thumb" id="url-thumb" class="medio" value="" />
        <span>Descri��o: </span>
        <textarea cols="36" rows="4" class="medio" name="descricao-video" id="descricao-video"></textarea>
        <br />
        <br />
        <br />
        <input type="button" id="video-ajax-submit" class="ajax-submit" value="enviar" />        
        <div class="clear"></div>        
    </form>    
    <div class="ajax-msg"></div>


</div>

<!-- N�o remova o div#mask, pois ele � necess�rio para preencher toda a janela -->
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