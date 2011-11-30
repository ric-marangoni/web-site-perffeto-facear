<%@page import="br.com.perfetto.controller.AlunoController"%>
<%@page import="br.com.perfetto.entidades.Aluno"%>
<%@page import="java.util.*"%>

<%
    //VARIÁVEIS E OBJETOS
    AlunoController editAluno = new AlunoController();
%>

<div id="aluno-editar" class="window">
    <!-- Botão para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Editar alunos</h2>    
    
    <% ArrayList<Aluno> listaEditAluno = editAluno.getDestaque();%>
    <%if (listaEditAluno.size() > 0) {%>
        <form>        
            <div class="painel-rolagem">
                <div class="ajax-msg"></div>
                <ul class="editar">
                    <%for (int i = 0; i < listaEditAluno.size(); i++) {%>
                    <%int id = listaEditAluno.get(i).getId();%>
                    <%String image_destaque = listaEditAluno.get(i).getImage_path();%>    
                    <%String nome_destaque = listaEditAluno.get(i).getNome();%>
                    
                    <li>                        
                        <div class="ajax-trade-image<%out.print(id);%>">
                            <img class="banner-image-thumb" src="images/trainers/thumb_<%out.print(image_destaque);%>" alt="" /> 
                        </div>
                        <p><b>Nome: </b><%out.print(nome_destaque);%></p>
                        <input type="button" class="ajax-submit destaque-editar btn-alterar" id="alunos-editar-<%out.print(id);%>" value="Trocar imagem" />   
                    </li>        
                    <%}%>
                </ul>
            </div>
        </form>
     <%}else{%>
     <h3>Você não possui aluno adicionado.</h3>     
     <%}%>    
    <div class="clear"></div>
    
</div>

<!-- Não remova o div#mask, pois ele é necessário para preencher toda a janela -->
<div id="mask"></div>


<script type="text/javascript">    
    jQuery(document).ready(function(){        
        ajax.uploadRequest('AlunoController', 'editar', 'destaque-editar', '.ajax-trade-image');              
    });
</script>
