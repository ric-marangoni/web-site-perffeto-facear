<div id="personal-incluir" class="window">
    <!-- Botão para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Incluir Personal</h2>    

    <form>
        <span>Nome:</span>
        <input type="text" name="nome-personal" id="nome-personal" class="medio" value="" />
        <span>Modalidade: </span>
        <input type="text" name="modalidade-personal" id="modalidade-personal" class="medio" value="" />
        <span>Imagem: </span>
        <div class="campo-upload">Buscar imagem...</div>
        <input type="button" name="btn-imagem-personal" class="ajax-submit personal-incluir" id="btn-imagem-personal" value="selecionar arquivo" />
        <br />
        <br />
        <br />
        <input type="button" id="personal-ajax-submit" class="ajax-submit" value="enviar" />        
        <div class="clear"></div>
        <div class="preview">
            <h3>Preview</h3>

            <div id="personal-preview">
                <div class="preview-personal-imagem">
                    <img src="images/sistema/personal-preview.gif" />
                </div>
                <div id="preview-personal-nome" class="nome-personal">
                    <a href="javascript:void(0)"></a>                                
                </div>                           
                <div id="preview-personal-modalidade" class="area-personal"></div>
            </div>
        </div>
    </form>    
    <div class="ajax-msg"></div>


</div>

<!-- Não remova o div#mask, pois ele é necessário para preencher toda a janela -->
<div id="mask"></div>

<script type="text/javascript">
    jQuery(document).ready(function(){
        ajax.uploadRequest('PersonalController', 'upload', 'personal-incluir', '.preview-personal-imagem');
               
        jQuery('#nome-personal').keyup(function(){
            jQuery('#preview-personal-nome a').html(jQuery(this).val());          
        }); 
        
        jQuery('#modalidade-personal').keyup(function(){
            jQuery('#preview-personal-modalidade').html(jQuery(this).val());          
        });
        
        jQuery('#personal-ajax-submit').click(function(){
            var image = jQuery('#imagem-personal').val();
            
            var params = {
                personal_nome: jQuery('#nome-personal').val(),
                personal_modalidade: jQuery('#modalidade-personal').val(),
                personal_imagem: image
            };
            
            ajax.normalRequest('PersonalController', 'incluir', params, '.ajax-msg');            
        });   
    });    
   
</script>