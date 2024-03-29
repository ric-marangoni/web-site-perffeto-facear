<%@page import="br.com.perfetto.controller.BannerController"%>
<%@page import="br.com.perfetto.entidades.Banner"%>
<%@page import="java.util.*"%>

<%
    //VARI�VEIS E OBJETOS
    BannerController deleteBanner = new BannerController();
%>

<div id="banner-excluir" class="window">
    <!-- Bot�o para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Excluir banner</h2>    
    
    <% ArrayList<Banner> listaDeleteBanner = deleteBanner.getBanners();%>
    <%if (listaDeleteBanner.size() > 0) {%>
        <form>        
            <div class="painel-rolagem">                
                <div class="ajax-msg"></div>
                <ul class="editar">
                    <%for (int i = 0; i < listaDeleteBanner.size(); i++) {%>
                    <%int id = listaDeleteBanner.get(i).getId();%>
                    <%String image_banner = listaDeleteBanner.get(i).getImage_path();%>                    
                    <li id="item-banner-excluir-<%out.print(id);%>">                        
                        <img class="banner-image-thumb" src="images/banner/thumb_<%out.print(image_banner);%>" alt="" />                         
                        <input type="button" class="ajax-submit btn-excluir banner-excluir" id="banner-excluir-<%out.print(id);%>" value="Excluir imagem" />   
                    </li>        
                    <%}%>
                </ul>
            </div>
        </form>
     <%}else{%>
     <h3>Voc� n�o possui banner adicionado.</h3>     
     <%}%>    
    <div class="clear"></div>
    
</div>

<!-- N�o remova o div#mask, pois ele � necess�rio para preencher toda a janela -->
<div id="mask"></div>


<script type="text/javascript">    
    jQuery(document).ready(function(){        
        jQuery('.banner-excluir').click(function(){            
            if(window.confirm("Tem certeza que deseja excluir essa imagem?")){
                var paramId = jQuery(this).attr('id').split("-");
                var id = paramId[2];
                ajax.deleteRequest('BannerController', id, 'item-banner-excluir-');
            }
        });
    });
</script>
