<div id="banner-incluir" class="window">
    <!-- Bot�o para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Incluir novo banner</h2>    

    <form>
        <span>Buscar imagem no computador:</span>        
        <input type="button" name="ajax-submit" class="ajax-submit" id="ajax-submit" value="selecionar arquivo" />        
    </form>
    <div class="clear"></div>
    <div class="ajax-msg"></div>
</div>

<!-- N�o remova o div#mask, pois ele � necess�rio para preencher toda a janela -->
<div id="mask"></div>


<script type="text/javascript">
    jQuery(document).ready(function(){
        upload.ajaxUpload('BannerController', 'incluir');
    });
</script>
