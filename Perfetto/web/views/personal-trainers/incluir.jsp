<div id="personals-incluir" class="window">
    <!-- Botão para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Incluir Personal</h2>    
    
    <form>
        <span>Nome:</span>
        <input type="text" name="nome-personal" id="nome-personal" class="medio" />
        <span>Modalidade: </span>
        <input type="text" name="modalidade-personal" id="modalidade-personal" class="medio" />
        <span>Imagem: </span>
        <div class="campo-upload">Buscar imagem no computador</div>
        <input type="button" name="imagem-personal" class="ajax-submit personal-incluir" id="imagem-personal" value="buscar arquivo" />
        <br />
        <br />
        <br />
        <input type="button" id="personal-ajax-submit" class="ajax-submit" value="enviar" />
    </form>    
    <div class="clear"></div>
    
    <div class="preview">
        <h3>Preview</h3>
        <form>
            <div class="ajax-msg"><img src="images/preview.jpg" /></div>
            <p id="preview-personal-nome"></p>           
            <p id="preview-personal-modalidade"></p>
        </form>        
    </div>
    
    <div class="resposta"></div>
    
    
</div>

<!-- Não remova o div#mask, pois ele é necessário para preencher toda a janela -->
<div id="mask"></div>

<script type="text/javascript">
    jQuery(document).ready(function(){
        ajax.uploadRequest('personalController', 'upload', 'personal-incluir', '.ajax-msg');
               
        jQuery('#nome-personal').blur(function(){
            jQuery('#preview-personal-nome').html(jQuery(this).val());          
        }); 
        
        jQuery('#modalidade-personal').blur(function(){
            jQuery('#preview-personal-modalidade').html(jQuery(this).val());          
        });
        
        jQuery('#personal-ajax-submit').click(function(){
            var imageParts = jQuery('.ajax-msg img').attr('src').split("/");
            
            var image = imageParts[2];
            
            alert(image);
            
            var params = {
                personal_nome: jQuery('#nome-personal').val(),
                personal_modalidade: jQuery('#modalidade-personal').val(),
                personal_imagem: image
            };
            
            ajax.normalRequest('personalController', 'incluir', params, '.resposta');            
        });
        
        

       
    });    
   
</script>