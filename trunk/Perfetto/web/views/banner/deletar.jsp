<%@page import="br.com.perfetto.controller.BannerController"%>
<%@page import="br.com.perfetto.entidades.Banner"%>
<%@page import="java.util.*"%>

<%
    //VARIÁVEIS E OBJETOS
    BannerController deleteBanner = new BannerController();
%>

<div id="banner-excluir" class="window">
    <!-- Botão para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Excluir banner</h2>    
    
    <% ArrayList<Banner> listaDeleteBanner = deleteBanner.getBanners();%>
    <%if (listaDeleteBanner.size() > 0) {%>
        <form>        
            <div class="painel-rolagem">                
                <ul class="editar-banner">
                    <%for (int i = 0; i < listaDeleteBanner.size(); i++) {%>
                    <%int id = listaDeleteBanner.get(i).getId();%>
                    <%String image_banner = listaDeleteBanner.get(i).getImage_path();%>                    
                    <li id="item-banner-excluir-<%out.print(id);%>">
                        <div class="ajax-msg"></div>
                        <img class="banner-image" src="<%out.print(image_banner);%>" alt="" />                         
                        <input type="button" class="ajax-submit btn-alterar banner-excluir" id="banner-excluir-<%out.print(id);%>" value="Excluir imagem" />   
                    </li>        
                    <%}%>
                </ul>
            </div>
        </form>
     <%}else{%>
     <h3>Você não possui banner adicionado.</h3>     
     <%}%>    
    <div class="clear"></div>
    
</div>

<!-- Não remova o div#mask, pois ele é necessário para preencher toda a janela -->
<div id="mask"></div>


<script type="text/javascript">    
    jQuery(document).ready(function(){        
        jQuery('.banner-excluir').click(function(){            
            if(window.confirm("Tem certeza que deseja excluir essa imagem?")){
                var paramId = jQuery(this).attr('id').split("-");
                var id = paramId[2];
                ajax.deleteRequest('BannerController', 'deletar', id, 'item-banner-excluir-');
            }
        });
    });
</script>
