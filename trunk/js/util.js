jQuery(document).ready(
	function(){		
	    		
		var Banner = jQuery('#banner ul');
		var primeiroVideo = jQuery('.descricao a').eq(0).attr('href');;        
        
        jQuery('.video').html(geraFrameTag(primeiroVideo));
        
        jQuery('.descricao a, .thumb a').click(function(){
            var link = jQuery(this).attr('href');
            var tagVideo = geraFrameTag(link);
            jQuery('.video').html(tagVideo);
            return false;
        });
        
        /*jQuery('#alunos-destaque .slider').slider({
            orientation: 'vertical',            
            animated: true
        });*/
        
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
    
function geraFrameTag(link){
    return "<iframe width=\"315\" height=\"300\" src=\""+link+"\" frameborder=\"0\"></iframe>";
}
    