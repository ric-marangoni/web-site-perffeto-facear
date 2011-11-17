var upload = {
    ajaxUpload: function(action, method, list, itemResposta){
        jQuery('.'+list).each(function(){            
            var btnUpload = jQuery(this).attr('id');              
            var param = btnUpload.split("-");
            var id = "";
            
            if(!isNaN(param[2])){
                id = param[2];                
            }            
            
            var status = jQuery(itemResposta+id);
            
            new AjaxUpload(btnUpload, {
                action: action+'?action='+method+'&id='+id,
                name: btnUpload,
                onSubmit: function(file, ext){
                    if (! (ext && /^(jpg|png|jpeg|gif)$/.test(ext))){                        
                        status.html('<p class="vermelho">Apenas JPG, PNG ou GIF são permitidos</p>');
                        return false;
                    }
                    ajaxLoader.show(); 
                },
                onComplete: function(file, response){
                    ajaxLoader.hide();                                     
                    status.html(response);
                }
            });
        });        
    }    
}