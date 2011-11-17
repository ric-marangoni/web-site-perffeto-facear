<%@page import="br.com.perfetto.controller.BannerController"%>
<%@page import="br.com.perfetto.entidades.Banner"%>
<%@page import="java.util.*"%>

<%
    //VARIÁVEIS E OBJETOS
    BannerController editBanner = new BannerController();
%>

<div id="banner-editar" class="window">
    <!-- Botão para fechar a janela tem class="close" -->
    <a href="#" class="close"><img src="images/sistema/close.png" alt="" /></a>    
    <h2>Editar banner</h2>    
    
    <% ArrayList<Banner> listaEditBanner = editBanner.getBanners();%>
    <%if (listaEditBanner.size() > 0) {%>
        <form>        
            <div class="painel-rolagem">
                <ul class="editar-banner">
                    <%for (int i = 0; i < listaEditBanner.size(); i++) {%>
                    <%int id = listaEditBanner.get(i).getId();%>
                    <%String image_banner = listaEditBanner.get(i).getImage_path();%>                    
                    <li>
                        <div class="ajax-msg"></div>
                        <div class="ajax-trade-image<%out.print(id);%>">
                            <img class="banner-image" src="<%out.print(image_banner);%>" alt="" /> 
                        </div>
                        <input type="button" class="ajax-submit banner-editar btn-alterar" id="banner-editar-<%out.print(id);%>" value="Trocar imagem" />   
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
        upload.ajaxUpload('BannerController', 'editar', 'banner-editar', '.ajax-trade-image');              
    });
</script>
