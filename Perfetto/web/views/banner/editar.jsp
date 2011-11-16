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
            <ul class="editar-banner">
                <%for (int i = 0; i < listaEditBanner.size(); i++) {%>
                <li>
                    <img src="<%out.print(listaEditBanner.get(i).getImage_path());%>" alt="" />
                    <span>Buscar imagem no computador:</span>        
                    <input type="button" class="ajax-submit" id="banner-editar<%out.print(listaEditBanner.get(i).getId());%>" value="selecionar arquivo" />   
                </li>        
                <%}%>
            </ul>
        </form>
     <%}else{%>
     <h3>Você não possui banner adicionado.</h3>     
     <%}%>            
    
    <div class="clear"></div>
    <div class="ajax-msg"></div>
</div>

<!-- Não remova o div#mask, pois ele é necessário para preencher toda a janela -->
<div id="mask"></div>


<script type="text/javascript">
    jQuery(document).ready(function(){
        upload.ajaxUpload(btn, 'BannerController', 'editar');              
    });
</script>
