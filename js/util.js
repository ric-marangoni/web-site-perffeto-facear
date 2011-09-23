jQuery(document).ready(
	function(){		
	    		
		var Banner = jQuery('#banner ul');
		
		if(Banner.length > 0){
				Banner.cycle({
				fx: 'fade',
				speed: 1000,
				timeout: 5000,
				prev : '.slide-prev',
				next : '.slide-next',
				pager: '.pager'
			});
		}

        jQuery('.carrossel').jCarouselLite({
            vertical: true,
            visible: 3,
            auto: 4000,
            speed: 700,
            circular: true
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