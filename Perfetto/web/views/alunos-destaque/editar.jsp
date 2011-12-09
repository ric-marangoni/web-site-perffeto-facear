<%@page import="br.com.perfetto.entidades.Aluno"%>
<%@page import="br.com.perfetto.controller.AlunoController"%>
<%@page import="java.util.*"%>

<%
    //VARIÁVEIS E OBJETOS
    AlunoController editAluno = new AlunoController();
%>

<div id="aluno-editar" class="window">
    <!-- Botão para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Editar aluno</h2>    
    
    <% ArrayList<Aluno> listaEditAluno = editAluno.getAlunos();%>
    <%if (listaEditAluno.size() > 0) {%>
    <select class="select-edit" id="edit-aluno" name="edit-aluno">
        <option value="0" selected>Selecione um personal aluno</option>    
        <%for (int i = 0; i < listaEditAluno.size(); i++) {%>
            <%int id = listaEditAluno.get(i).getId();%>            
            <%String nome_aluno = listaEditAluno.get(i).getNome();%>          
            <option value="<%out.print(id);%>"><%out.print(nome_aluno);%></option>                       
        <%}%>    
    </select>
    <%}%>
    <form class="pre-edit-aluno">        
        <span>Nome:</span>
        <input type="text" name="nome-aluno-editar" id="nome-aluno-editar" class="medio" />
        <span>Imagem: </span>
        <div class="campo-upload">Buscar imagem...</div>
        <input type="button" name="imagem-aluno-editar" class="ajax-submit aluno-editar" id="imagem-aluno-editar" value="buscar arquivo" />
        <br />
        <br />
        <br />
        <input type="button" id="aluno-ajax-submit" class="ajax-submit alunos-ajax-submit" value="enviar" />
    </form> 
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
    <div class="clear"></div>
    
     
    <div class="ajax-msg"></div>
   
    
    
</div>

<!-- Não remova o div#mask, pois ele é necessário para preencher toda a janela -->
<div id="mask"></div>


<script type="text/javascript">    
    jQuery(document).ready(function(){        
        jQuery('#edit-aluno').change(function(){
            if(jQuery(this).val() != 0){
                jQuery.ajax({
                    url: 'AlunoController?action=preEdit',
                    type: 'post',
                    data: 'id='+jQuery('#edit-aluno').val(),
                    beforeSend: function(){
                        ajaxLoader.show();
                    },
                    success: function(response){
                        
                        aluno = jQuery.parseJSON(response);
                        
                        jQuery('#nome-aluno-editar').val(aluno.nome);                       
                        
                        jQuery('.nome-aluno a').html(aluno.nome);                        
                        
                        
                        jQuery('.resposta img').attr('src', 'images/alunos/'+aluno.imagem);
                        
                        ajaxLoader.hide();
                        jQuery('.pre-edit-aluno').fadeIn();
                        ajax.uploadRequest('AlunoController', 'upload', 'aluno-editar', '.preview-personal-imagem-editar');              
                    }            
                });      
            }            
        });

        jQuery('#nome-aluno-editar').keyup(function(){
            jQuery('.nome-aluno a').html(jQuery(this).val());          
        });          
        
        jQuery('#aluno-ajax-submit-editar').click(function(){
            var image = jQuery('#imagem-aluno').val() == undefined ? aluno.imagem : jQuery('#imagem-aluno').val();
                       
            var params = {
                aluno_id: jQuery('#edit-aluno').val(),
                aluno_nome: jQuery('#nome-aluno-editar').val(),
                aluno_imagem: image
            };
            
            ajax.normalRequest('AlunoController', 'editar', params, '.ajax-msg');            
        });   
        
    });
</script>