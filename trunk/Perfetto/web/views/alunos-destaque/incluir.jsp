<div id="aluno-incluir" class="window">
    <!-- Botão para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Incluir aluno</h2>    
    
    <form>
        <span>Nome:</span>
        <input type="text" name="nome-aluno" id="nome-aluno" class="medio" />
        <span>Imagem: </span>
        <div class="campo-upload">Buscar imagem...</div>
        <input type="button" name="imagem-aluno" class="ajax-submit aluno-incluir" id="imagem-aluno" value="buscar arquivo" />
        <br />
        <br />
        <br />
        <input type="button" id="aluno-ajax-submit" class="ajax-submit alunos-ajax-submit" value="enviar" />
    </form>    
    <div class="clear"></div>
    
    <div class="preview">
        <h3>Preview</h3>
        <form>
            <div class="preview-aluno">
            <div class="resposta">
              <img src="images/sistema/personal-preview.gif" />
            </div>
            <p class="nome-aluno"><a href="#"></a></p>     
            </div>
        </form>        
    </div>  
    <div class="ajax-msg"></div>
   
    
    
</div>

<!-- Não remova o div#mask, pois ele é necessário para preencher toda a janela -->
<div id="mask"></div>

<script type="text/javascript">
    jQuery(document).ready(function(){
        ajax.uploadRequest('AlunoController', 'upload', 'aluno-incluir', '.resposta');
               
        jQuery('#nome-aluno').keyup(function(){
            jQuery('.nome-aluno a').html(jQuery(this).val());          
        }); 
          
        jQuery('#aluno-ajax-submit').click(function(){
            var imageParts = jQuery('.resposta img').attr('src').split("/");
            
            var image = imageParts[2];
            
            alert(image);
            
            var params = {
                aluno_nome: jQuery('#nome-aluno').val(),
                aluno_imagem: image
            };
            
            ajax.normalRequest('AlunoController', 'incluir', params, '.ajax-msg');            
        });
        
        

       
    });    
   
</script>