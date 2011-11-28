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
        <form>        
            <div class="painel-rolagem">
                <div class="ajax-msg"></div>
                <ul class="editar">
                    <%for (int i = 0; i < listaEditPersonal.size(); i++) {%>
                    <%int id = listaEditPersonal.get(i).getId();%>
                    <%String image_trainers = listaEditPersonal.get(i).getImage_path();%>    
                    <%String nome_trainer = listaEditPersonal.get(i).getNome();%>
                    <%String modalidade_trainer = listaEditPersonal.get(i).getArea();%>
                    
                    <li>                        
                        <div class="ajax-trade-image<%out.print(id);%>">
                            <img class="banner-image-thumb" src="images/trainers/thumb_<%out.print(image_trainers);%>" alt="" /> 
                        </div>
                        <p><b>Nome: </b><%out.print(nome_trainer);%></p>
                        <p><b>Modalidade: </b><%out.print(modalidade_trainer);%></p>
                        <input type="button" class="ajax-submit trainer-editar btn-alterar" id="personal-editar-<%out.print(id);%>" value="Trocar imagem" />   
                    </li>        
                    <%}%>
                </ul>
            </div>
        </form>
     <%}else{%>
     <h3>Você não possui trainer adicionado.</h3>     
     <%}%>    
    <div class="clear"></div>
    
</div>

<!-- Não remova o div#mask, pois ele é necessário para preencher toda a janela -->
<div id="mask"></div>


<script type="text/javascript">    
    jQuery(document).ready(function(){        
        ajax.uploadRequest('PersonalController', 'editar', 'trainer-editar', '.ajax-trade-image');              
    });
</script>
