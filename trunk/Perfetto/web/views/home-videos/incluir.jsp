<div id="home-video-incluir" class="window">
    <!-- Bot�o para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Incluir V�deo</h2>    

    <form>
        <span>T�tulo</span>
        <input type="text" name="titulo-home-video" id="titulo-modalidade" class="medio" value="" />
         <span>Descri��o: </span>
        <div class="descricao-video">
            <img src="images/sistema/modalidade-preview.gif" />
        </div>
        <textarea cols="80" rows=""  name="descricao-video" id="descricao-modalidade"></textarea>
        <span>URL V�deo:</span>
        <input type="text" name="url-video" id="titulo-modalidade" class="medio" value="" />
        <span>URL Thumb:</span>
        <input type="text" name="url-thumb" id="titulo-modalidade" class="medio" value="" />
        <br />
        <br />
        <br />
        <input type="button" id="modalidade-ajax-submit" class="ajax-submit" value="enviar" />        
        <div class="clear"></div>        
    </form>    
    <div class="ajax-msg"></div>


</div>

<!-- N�o remova o div#mask, pois ele � necess�rio para preencher toda a janela -->
<div id="mask"></div>

<script type="text/javascript">
    jQuery(document).ready(function(){
        
            //ajax.normalRequest('ModalidadeController', 'incluir', params, '.ajax-msg');            
        });      
   
   
</script>