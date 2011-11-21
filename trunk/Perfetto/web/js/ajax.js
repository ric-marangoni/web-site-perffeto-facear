var ajax = {
    uploadRequest: function(action, method, list, itemResposta){
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
                    /*jQuery('.window-crop').html(response); 
                    
                    var x, y, x2, y2;                    
                    
                    jQuery('.window-crop img').Jcrop({
                        minSize: [jQuery('.cropWidth').val(), jQuery('.cropHeight').val()],
                        maxSize: [jQuery('.cropWidth').val(), jQuery('.cropHeight').val()],
                        onSelect: function(c){
                            // variables can be accessed here as
                            x  = c.x;
                            y  = c.y;
                            x2 = c.x2;
                            y2 = c.y2;
                        }
                    });
                                                                                
                    //armazena a largura e a altura da janela                    
                    var winW = $(window).width();
                    var scrollTop = $(window).scrollTop()
                    var left = (winW/2 - $('.window-crop').width()/2) + 85;
                    
                    //centraliza na tela a janela popup
                    $('.window-crop').css('top', scrollTop+75);
                    $('.window-crop').css('left', left);                                                          
                    
                    jQuery('.window').fadeOut(1000);
                    jQuery('.window-crop').fadeIn(1000);

                    jQuery('.btn-crop').click(function(){
                        
                        var params = jQuery.param(x, y, x2, y2);
                        
                        jQuery.ajax({
                            url: action+'?action='+method+'&crop=true&id='+id,
                            type: 'post',
                            data: params,
                            beforeSend: function(){
                                jQuery('.window-crop').remove();
                                jQuery('.window').fadeIn(1000);                                
                                ajaxLoader.show();
                            },
                            success: function(response){
                                ajaxLoader.hide();
                                status.html(response);                                
                            }   
                        });
                    });*/
                    
                }
            });
        });        
    },  
    deleteRequest: function(action, id, itemResposta){        
        jQuery.ajax({
            url: action+'?action=deletar&id='+id,
            type: 'post',
            beforeSend: function(){
                ajaxLoader.show();
            },
            success: function(){
                ajaxLoader.hide();
                jQuery('#'+itemResposta+id).fadeOut();
            }            
        });
        
    }    
}

