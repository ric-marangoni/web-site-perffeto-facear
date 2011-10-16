<div id="banner-incluir" class="window">
    <!-- Botão para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Incluir novo banner</h2>
    
    <form action="" method="post">
        <span>Buscar imagem no computador:</span>
        <input type="file" size="27" name="path_image" />
        <input type="button" name="ajax-submit" id="ajax-submit" value="enviar" />
    </form>
    <div class="clear"></div>
    <div class="ajax-msg"></div>
</div>

<!-- Não remova o div#mask, pois ele é necessário para preencher toda a janela -->
<div id="mask"></div>

<script type="text/javascript">
    jQuery('#ajax-submit').click(function(){
        jQuery.ajax({
            url: "BannerController",
            method: 'post',
            beforeSend: function(){
                ajaxLoader.show();                
            },
            success: function(response){
                ajaxLoader.hide();
                jQuery('.ajax-msg').html(response);
            }
        });        
    });    
</script>