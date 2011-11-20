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
                action: action+'?action=upload&id='+id,
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
                    
                    jQuery('.window-crop').html(response); 
                    
                    jQuery('.window-crop img').Jcrop({
                        minSize: [jQuery('.cropWidth').val(), jQuery('.cropHeight').val()],
                        maxSize: [jQuery('.cropWidth').val(), jQuery('.cropHeight').val()],
                        onSelect: function(c){
                          // variables can be accessed here as
                          alert('x: '+c.x+'\ny: '+c.y+'\nx2: '+c.x2+'\ny2 '+c.y2+'\nw: '+c.w+'\nh: '+c.h);
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
                    
                }
            });
        });        
    },  
    deleteRequest: function(action, method, id, itemResposta){        
        jQuery.ajax({
            url: action+'?action=delete&id='+id,
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

