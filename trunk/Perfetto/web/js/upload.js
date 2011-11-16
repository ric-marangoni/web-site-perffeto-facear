var upload = {
    ajaxUpload: function(action, method, list){
        jQuery('.'+list).each(function(){            
            var btnUpload = jQuery(this).attr('id');              
            var param = btnUpload.split("-");
            var id = "";
            
            if(!isNaN(param[2])){
                id = param[2];                
            }            
            
            var status = jQuery(".ajax-msg"+id);
            
            new AjaxUpload(btnUpload, {
                action: action+'?action='+method+'&id='+id,
                name: btnUpload,
                onSubmit: function(file, ext){
                    if (! (ext && /^(jpg|png|jpeg|gif)$/.test(ext))){
                        status.attr('class', 'ajax-msg vermelho');
                        status.html('Apenas JPG, PNG ou GIF são permitidos');
                        return false;
                    }
                    ajaxLoader.show(); 
                },
                onComplete: function(file, response){
                    ajaxLoader.hide();                 
                    status.attr('class', 'ajax-msg'+id);
                    status.html(response);
                }
            });
        });        
    }    
}