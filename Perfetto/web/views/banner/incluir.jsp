<div id="banner-incluir" class="window">
    <!-- Botão para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Incluir novo banner</h2>    

    <form>
        <span>Buscar imagem no computador:</span>        
        <input type="button" name="ajax-submit" class="ajax-submit banner-incluir" id="incluir-banner" value="selecionar arquivo" />        
    </form>
    <div class="clear"></div>
    <div class="ajax-msg"></div>
</div>

<div class="window-crop"></div> 

<!-- Não remova o div#mask, pois ele é necessário para preencher toda a janela -->
<div id="mask"></div>


<script type="text/javascript">
    jQuery(document).ready(function(){
        ajax.uploadRequest('BannerController', 'incluir', 'banner-incluir', '.ajax-msg');
    });
</script>
