jQuery(document).ready(
    function(){			    		
        var Banner = jQuery('#banner ul.banner');
        var primeiroVideo = jQuery('.descricao a').eq(0).attr('href');        
        
        jQuery('.video').html(geraFrameTag(primeiroVideo));
        
        jQuery('.descricao a, .thumb a').click(function(){
            var link = jQuery(this).attr('href');
            var tagVideo = geraFrameTag(link);
            jQuery('.video').html(tagVideo);
            return false;
        });
        
        jQuery('.horarios table:eq(0) tr:even').css({
            background: '#F5F5F5',
            color: '#333'
        });
        
        jQuery('.horarios table:eq(1) tr:even').css({
            background: '##F5F5F5',
            color: '#333'
        });
        
        jQuery('.horarios table:eq(2) tr:even').css({
            background: '#F5F5F5',
            color: '#333'
        });
        
                
        //change the main div to overflow-hidden as we can use the slider now
        $('#scroll-pane').css('overflow','hidden');

        //compare the height of the scroll content to the scroll pane to see if we need a scrollbar
        var difference = $('#scroll-content').height()-$('#scroll-pane').height();//eg it's 200px longer 

        if(difference > 0)//if the scrollbar is needed, set it up...
        {
            var proportion = difference / $('#scroll-content').height();//eg 200px/500px
            var handleHeight = Math.round((1-proportion)*$('#scroll-pane').height());//set the proportional height - round it to make sure everything adds up correctly later on
            handleHeight -= handleHeight%2; 

            $("#scroll-pane").after('<\div id="slider-wrap"><\div id="slider-vertical"><\/div><\/div>');//append the necessary divs so they're only there if needed
            $("#slider-wrap").height($("#scroll-pane").height());//set the height of the slider bar to that of the scroll pane


            //set up the slider 
            $('#slider-vertical').slider({
                orientation: 'vertical',
                min: 0,
                max: 100,
                value: 100,
                slide: function(event, ui) {//used so the content scrolls when the slider is dragged
                    var topValue = -((100-ui.value)*difference/100);
                    $('#scroll-content').css({
                        top:topValue
                    });//move the top up (negative value) by the percentage the slider has been moved times the difference in height
                },
                change: function(event, ui) {//used so the content scrolls when the slider is changed by a click outside the handle or by the mousewheel
                    var topValue = -((100-ui.value)*difference/100);
                    $('#scroll-content').css({
                        top:topValue
                    });//move the top up (negative value) by the percentage the slider has been moved times the difference in height
                }
            });

            //set the handle height and bottom margin so the middle of the handle is in line with the slider
            $(".ui-slider-handle").css({
                height:handleHeight,
                'margin-bottom':-0.5*handleHeight
                });

            var origSliderHeight = $("#slider-vertical").height();//read the original slider height
            var sliderHeight = origSliderHeight - handleHeight ;//the height through which the handle can move needs to be the original height minus the handle height
            var sliderMargin =  (origSliderHeight - sliderHeight)*0.5;//so the slider needs to have both top and bottom margins equal to half the difference
            $(".ui-slider").css({
                height:sliderHeight,
                'margin-top':sliderMargin
            });//set the slider height and margins

        }//end if

        //code to handle clicks outside the slider handle
        $(".ui-slider").click(function(event){//stop any clicks on the slider propagating through to the code below
            event.stopPropagation();
        });

        $("#slider-wrap").click(function(event){//clicks on the wrap outside the slider range
            var offsetTop = $(this).offset().top;//read the offset of the scroll pane
            var clickValue = (event.pageY-offsetTop)*100/$(this).height();//find the click point, subtract the offset, and calculate percentage of the slider clicked
            $("#slider-vertical").slider("value", 100-clickValue);//set the new value of the slider
        }); 

        //additional code for mousewheel
        $("#scroll-pane, #slider-wrap").mousewheel(function(event, delta){
            var speed = 5;
            var sliderVal = $("#slider-vertical").slider("value");//read current value of the slider

            sliderVal += (delta*speed);//increment the current value

            $("#slider-vertical").slider("value", sliderVal);//and set the new value of the slider

            event.preventDefault();//stop any default behaviour
        });
        
        jQuery('#formulario-contato .btn').click(function(e){
            
            var nome = jQuery('input[name="nome"]');
            var email = jQuery('input[name="email"]');
            var telefone = jQuery('input[name="telefone"]');
            var assunto = jQuery('input[name="assunto"]');
            var mensagem = jQuery('textarea[name="mensagem"]');
            
            
            if(nome.val() == ""){                
                tooltip(e, 'Por favor digite seu nome');
                nome.focus();
                return false;
            }
            
            if(email.val() == ""){                
                tooltip(e, 'Por favor digite seu email');
                email.focus();
                return false;
            }               
            
            if(assunto.val() == ""){                
                tooltip(e, 'Por favor digite seu assunto');
                assunto.focus();
                return false;
            }
            
            if(mensagem.val() == ""){                
                tooltip(e, 'Por favor digite sua mensagem');
                mensagem.focus();
                return false;
            }
            
            return true;
            
        }).mousemove(function(e){
            jQuery('.tooltip').css({
                top : e.pageY - 60,
                left : e.pageX - 90
            });            
        });
        
        jQuery('#formulario-contato').mouseleave(function(){            
            jQuery('.tooltip').fadeOut();
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
        
        jQuery("#trainers ul li").toggle(
            function(e){
                
                var pathArray = jQuery(this).children().attr('src').split("/");
                var imgArray = pathArray[2].split("thumb_");
                var img = imgArray[1];
                var path = pathArray[0]+"/"+pathArray[1]+"/";
                
                jQuery("body").append('<div class="show-image-personal"><img src="'+path+img+'" /></div>');                
                jQuery('.show-image-personal').css({
                    top : e.pageY + 30,
                    left : e.pageX - 300
                }).fadeIn();
				  
            }, function(){
                jQuery('.show-image-personal').remove();
            }).mousemove(function(e){
            jQuery('.show-image-personal').css({
                top : e.pageY + 30,
                left : e.pageX - 300
            });
        });
        
        jQuery("#trainers ul li").mouseleave(function(){
            if( jQuery('.show-image-personal').length ){
                jQuery(this).click();
            }                        
        });
        
        $('.window').draggable();
        
        $('.painel-rolagem').hover(function(){
            $('.window').draggable({ disabled: true });
        }, function(){
            $('.window').draggable({disabled: false});
        });   
    }
    );
    
function geraFrameTag(link){
    return "<iframe width=\"315\" height=\"300\" src=\""+link+"\" frameborder=\"0\"></iframe>";
}

function tooltip(e, mensagem){
    jQuery('.tooltip').remove();
    jQuery("body").append('<div class="tooltip">'+mensagem+'</div>');    
    jQuery('.tooltip').css({
        top : e.pageY - 60,
        left : e.pageX - 90
    }).fadeIn();               
}

    
