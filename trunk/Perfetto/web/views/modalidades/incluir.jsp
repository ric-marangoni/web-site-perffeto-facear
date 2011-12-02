<div id="modalidade-incluir" class="window">
    <!-- Botão para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Incluir Modalidade</h2>    

    <form>
        <span>Título</span>
        <input type="text" name="titulo-modalidade" id="titulo-modalidade" class="medio" value="" />
        <span>Imagem: </span>
        <div class="campo-upload">Buscar imagem...</div>
        <input type="button" name="btn-imagem-modalidade" class="ajax-submit modalidade-incluir" id="btn-imagem-modalidade" value="selecionar arquivo" />
        <div class="clear"></div>
        <span>Descrição: </span>
        <div class="preview-modalidade-imagem">
            <img src="images/sistema/modalidade-preview.gif" />
        </div>
        <textarea cols="80" rows=""  name="descricao-modalidade" id="descricao-modalidade"></textarea>        
        <br />
        <br />
        <br />
        <input type="button" id="modalidade-ajax-submit" class="ajax-submit" value="enviar" />        
        <div class="clear"></div>        
    </form>    
    <div class="ajax-msg"></div>


</div>

<!-- Não remova o div#mask, pois ele é necessário para preencher toda a janela -->
<div id="mask"></div>

<script type="text/javascript">
    jQuery(document).ready(function(){
        ajax.uploadRequest('ModalidadeController', 'upload', 'modalidade-incluir', '.preview-modalidade-imagem');
                        
        jQuery('#modalidade-ajax-submit').click(function(){
            var image = jQuery('#modalidade-imagem').val();
            
            var descricao = jQuery('#descricao-modalidade').val().split("\n\n");
            var descricaoFormatada = "";
            
            for(var i = 0; i < descricao.length; i++){
                descricaoFormatada += '<p>'+descricao[i]+'</p>';
            }
            
            descricao = descricaoFormatada.split("\n");
            descricaoFormatada = "";
            for(var i = 0; i < descricao.length; i++){
                descricaoFormatada += descricao[i]+'<br />';
            }
            
            descricaoFormatada = descricaoFormatada.replace("<p></p>", "");
            
            
            var params = {
                modalidade_titulo: jQuery('#titulo-modalidade').val(),                
                modalidade_imagem: image,
                modalidade_descricao: descricaoFormatada
            };
            
            ajax.normalRequest('ModalidadeController', 'incluir', params, '.ajax-msg');            
        });      
    });    
   
</script>