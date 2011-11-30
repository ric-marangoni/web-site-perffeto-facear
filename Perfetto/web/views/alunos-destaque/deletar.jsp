<%@page import="br.com.perfetto.controller.AlunoController"%>
<%@page import="br.com.perfetto.entidades.Aluno"%>
<%@page import="java.util.*"%>

<%
    //VARIÁVEIS E OBJETOS
    AlunoController deleteAluno = new AlunoController();
%>

<div id="aluno-excluir" class="window">
    <!-- Botão para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Excluir aluno</h2>    
    
    <% ArrayList<Aluno> listaDeleteAluno = deleteAluno.getDestaque();%>
    <%if (listaDeleteAluno.size() > 0) {%>
        <form>        
            <div class="painel-rolagem">                
                <div class="ajax-msg"></div>
                <ul class="editar">
                    
                    <%for (int i = 0; i < listaDeleteAluno.size(); i++) {%>
                    <%int id = listaDeleteAluno.get(i).getId();%>
                    <%String image_destaque = listaDeleteAluno.get(i).getImage_path();%>                    
                    <%String nome_destaque = listaDeleteAluno.get(i).getNome();%>
                    
                    <li id="item-personal-excluir-<%out.print(id);%>">                           
                        <img src="images/trainers/thumb_<%out.print(image_destaque);%>" alt="" />
                        <p><b>Nome: </b><%out.print(nome_destaque);%></p>
                        <input type="button" class="ajax-submit btn-excluir aluno-excluir" id="aluno-excluir-<%out.print(id);%>" value="Excluir alunos" />   
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
        jQuery('.aluno-excluir').click(function(){            
            if(window.confirm("Tem certeza que deseja excluir esse trainer?")){
                var paramId = jQuery(this).attr('id').split("-");
                var id = paramId[2];
                ajax.deleteRequest('AlunoController', id, 'item-aluno-excluir-');
            }
        });
    });
</script>
