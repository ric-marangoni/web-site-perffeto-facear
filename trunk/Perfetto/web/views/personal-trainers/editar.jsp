<%@page import="br.com.perfetto.controller.PersonalController"%>
<%@page import="br.com.perfetto.entidades.Personal"%>
<%@page import="java.util.*"%>

<%
    //VARIÁVEIS E OBJETOS
    PersonalController editPersonal = new PersonalController();
%>

<div id="personal-editar" class="window">
    <!-- Botão para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Editar personal</h2>    
    
    <% ArrayList<Personal> listaEditPersonal = editPersonal.getTrainers();%>
    <%if (listaEditPersonal.size() > 0) {%>
    <select class="select-edit" id="edit-personal" name="edit-personal">
        <option value="0" selected>Selecione um personal trainer</option>    
        <%for (int i = 0; i < listaEditPersonal.size(); i++) {%>
            <%int id = listaEditPersonal.get(i).getId();%>            
            <%String nome_trainer = listaEditPersonal.get(i).getNome();%>          
            <option value="<%out.print(id);%>"><%out.print(nome_trainer);%></option>                       
        <%}%>    
    </select>
    <form class="pre-edit-personal">
        <span>Nome:</span>
        <input type="text" name="nome-personal-editar" id="nome-personal-editar" class="medio" value="" />
        <span>Modalidade: </span>
        <input type="text" name="modalidade-personal-rditar" id="modalidade-personal-editar" class="medio" value="" />
        <span>Imagem: </span>
        <div class="campo-upload">Buscar imagem...</div>
        <input type="button" name="btn-imagem-personal-editar" class="ajax-submit personal-editar" id="btn-imagem-personal-editar" value="selecionar arquivo" />
        <br />
        <br />
        <br />
        <input type="button" id="personal-ajax-submit-editar" class="ajax-submit personal-ajax-submit" value="enviar" />
        <input type="hidden" name="id-personal" id="id-personal" />
        <div class="clear"></div>
        <div class="preview">
            <h3>Preview</h3>

            <div id="personal-preview">
                <div class="preview-personal-imagem-editar">
                    <img src="images/sistema/personal-preview.gif" />
                </div>
                <div id="preview-personal-nome-editar" class="nome-personal">
                    <a href="javascript:void(0)"></a>                                
                </div>                           
                <div id="preview-personal-modalidade-editar" class="area-personal"></div>
            </div>
        </div>
    </form>    
    <div class="ajax-msg"></div>
     <%}else{%>
     <h3>Você não possui trainer adicionado.</h3>     
     <%}%>    
    <div class="clear"></div>
    
</div>

<!-- Não remova o div#mask, pois ele é necessário para preencher toda a janela -->
<div id="mask"></div>


<script type="text/javascript">    
    jQuery(document).ready(function(){        
        jQuery('#edit-personal').change(function(){
            if(jQuery(this).val() != 0){
                jQuery.ajax({
                    url: 'PersonalController?action=preEdit',
                    type: 'post',
                    data: 'id='+jQuery('#edit-personal').val(),
                    beforeSend: function(){
                        ajaxLoader.show();
                    },
                    success: function(response){
                        
                        personal = jQuery.parseJSON(response);
                        
                        jQuery('#nome-personal-editar').val(personal.nome);                        
                        jQuery('#modalidade-personal-editar').val(personal.area);
                        jQuery('#id-personal').val(personal.id);
                        
                        jQuery('#preview-personal-nome-editar a').html(personal.nome);                        
                        jQuery('#preview-personal-modalidade-editar').html(personal.area);
                        
                        jQuery('.preview-personal-imagem-editar img').attr('src', 'images/trainers/thumb_'+personal.imagem);
                        
                        ajaxLoader.hide();
                        jQuery('.pre-edit-personal').fadeIn();
                        ajax.uploadRequest('PersonalController', 'upload', 'personal-editar', '.preview-personal-imagem-editar');              
                    }            
                });      
            }            
        });

        jQuery('#nome-personal-editar').keyup(function(){
            jQuery('#preview-personal-nome-editar a').html(jQuery(this).val());          
        }); 
        
        jQuery('#modalidade-personal-editar').keyup(function(){
            jQuery('#preview-personal-modalidade-editar').html(jQuery(this).val());          
        });
        
        jQuery('#personal-ajax-submit-editar').click(function(){
            var image = jQuery('#imagem-personal').val() == undefined ? personal.imagem : jQuery('#imagem-personal').val();
                       
            var params = {
                personal_id: jQuery('#id-personal').val(),
                personal_nome: jQuery('#nome-personal-editar').val(),
                personal_modalidade: jQuery('#modalidade-personal-editar').val(),
                personal_imagem: image
            };
            
            ajax.normalRequest('PersonalController', 'editar', params, '.ajax-msg');            
        });   
        
    });
</script>