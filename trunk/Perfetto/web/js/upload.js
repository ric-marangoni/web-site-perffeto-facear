var upload = {
    ajaxUpload: function(action, method, param){
        jQuery('.ajax-submit').each(function(){            
            var btnUpload = jQuery(this).attr('id');  
            var status = jQuery(".ajax-msg");
            new AjaxUpload(btnUpload, {
                action: action+'?action='+method+'&id='+param,
                name: 'upload',
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
                    status.attr('class', 'ajax-msg');
                    status.html(response);
                }
            });
        });        
    }    
}