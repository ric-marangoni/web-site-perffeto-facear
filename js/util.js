jQuery(document).ready(
	function(){		
	    		
		var Banner = jQuery('#banner ul');
		
        jQuery('.descricao a').click(function(){
            var link = jQuery(this).attr('href');
            var tagVideo = "<iframe width=\"315\" height=\"300\" src=\""+link+"\" frameborder=\"0\"></iframe>";
            jQuery('.video').html(tagVideo);
            return false;
        });
        
		if(Banner.length > 0){
				Banner.cycle({
				fx: 'fade',
				speed: 1000,
				timeout: 5000,				
				pager: '.pager'
			});
		}

        jQuery('.carrossel').jCarouselLite({
            vertical: true,
            visible: 3,            
            speed: 700,
            circular: true,
            btnPrev: '.prev',
            btnNext: '.next'
        });   
   
		jQuery("*[rel=tooltip]").hover(
			function(e){
				 jQuery("body").append('<div class="tooltip">'+jQuery(this).attr('title')+'</div>');
				 jQuery('.tooltip').css({
					 top : e.pageY - 60,
					 left : e.pageX - 90
				 }).fadeIn();
				  
			}, function(){
				  jQuery('.tooltip').remove();
			}).mousemove(function(e){
			  jQuery('.tooltip').css({
				top : e.pageY - 60,
				left : e.pageX - 90
			});
		});			
	}
);