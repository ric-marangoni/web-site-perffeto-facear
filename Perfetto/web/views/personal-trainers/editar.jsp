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
        <option value="0" selected="selected">Selecione um personal trainer</option>    
        <%for (int i = 0; i < listaEditPersonal.size(); i++) {%>
            <%int id = listaEditPersonal.get(i).getId();%>            
            <%String nome_trainer = listaEditPersonal.get(i).getNome();%>          
            <option value="<%out.print(id);%>"><%out.print(nome_trainer);%></option>                       
        <%}%>    
    </select>
    <form class="pre-edit-personal">
        <span>Nome:</span>
        <input type="text" name="nome-personal" id="nome-personal-editar" class="medio" value="" />
        <span>Modalidade: </span>
        <input type="text" name="modalidade-personal" id="modalidade-personal-editar" class="medio" value="" />
        <span>Imagem: </span>
        <div class="campo-upload">Buscar imagem...</div>
        <input type="button" name="btn-imagem-personal" class="ajax-submit personal-editar" id="btn-imagem-personal" value="selecionar arquivo" />
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
                        alert(response);
                        ajaxLoader.hide();
                        jQuery('.pre-edit-personal').fadeIn();
                        ajax.uploadRequest('PersonalController', 'upload', 'personal-editar', '.preview-personal-imagem');              
                    }            
                });      
            }            
        });        
    });
</script>