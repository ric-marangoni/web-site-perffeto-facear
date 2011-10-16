<div id="banner-incluir" class="window">
    <!-- Botão para fechar a janela tem class="close" -->
    <a href="#" class="close">Fechar [X]</a>
    <br />
    <b>Busque a imagem que deseja incluir:</b>
    <br />
    <br />
    <form action="" method="post">
        <input type="file" name="path_image" />
        <input type="button" name="ajax-submit" id="ajax-submit" value="enviar" />
    </form>
    <div class="msg"></div>
</div>

<!-- Não remova o div#mask, pois ele é necessário para preencher toda a janela -->
<div id="mask"></div>

<script type="text/javascript">
    jQuery('#ajax-submit').click(function(){
        jQuery.ajax({
            url: "BannerController",
            method: 'post',
            beforeSend: function(){
                
            },
            success: function(response){
                jQuery('.msg').html(response);
            }
        });        
    });    
</script>