<%@page import="br.com.perfetto.controller.PersonalController"%>
<%@page import="br.com.perfetto.entidades.Personal"%>
<%@page import="java.util.*"%>

<%
    //VARIÁVEIS E OBJETOS
    PersonalController deletePersonal = new PersonalController();
%>

<div id="personal-excluir" class="window">
    <!-- Botão para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Excluir personal</h2>    
    
    <% ArrayList<Personal> listaDeletePersonal = deletePersonal.getTrainers();%>
    <%if (listaDeletePersonal.size() > 0) {%>
        <form>        
            <div class="painel-rolagem">                
                <div class="ajax-msg"></div>
                <ul class="editar">
                    
                    <%for (int i = 0; i < listaDeletePersonal.size(); i++) {%>
                    <%int id = listaDeletePersonal.get(i).getId();%>
                    <%String image_trainer = listaDeletePersonal.get(i).getImage_path();%>                    
                    <%String nome_trainer = listaDeletePersonal.get(i).getNome();%>
                    <%String modalidade_trainer = listaDeletePersonal.get(i).getArea();%>
                    
                    <li id="item-personal-excluir-<%out.print(id);%>">                           
                        <img src="images/trainers/thumb_<%out.print(image_trainer);%>" alt="" />
                        <p><b>Nome: </b><%out.print(nome_trainer);%></p>
                        <p><b>Modalidade: </b><%out.print(modalidade_trainer);%></p>
                        <input type="button" class="ajax-submit btn-excluir personal-excluir" id="personal-excluir-<%out.print(id);%>" value="Excluir trainer" />   
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
        jQuery('.personal-excluir').click(function(){            
            if(window.confirm("Tem certeza que deseja excluir esse trainer?")){
                var paramId = jQuery(this).attr('id').split("-");
                var id = paramId[2];
                ajax.deleteRequest('PersonalController', id, 'item-personal-excluir-');
            }
        });
    });
</script>
