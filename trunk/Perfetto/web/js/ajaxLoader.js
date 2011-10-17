var ajaxLoader = {
    show: function(){                
        var img = '<img src=\"images/ajax-loader.gif\" alt=\"\"/>';        
        jQuery('.ajax-msg').html(img);
    },
    hide: function(){
        jQuery('.ajax-msg').html('');
    }
}

