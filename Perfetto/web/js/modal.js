$(document).ready(function() {
 
    //seleciona os elementos a com atributo name="modal"
    $('a[name=modal]').click(function(e) {
        //cancela o comportamento padrão do link
        e.preventDefault();
 
        //armazena o atributo href do link
        var id = $(this).attr('href');
 
        //armazena a largura e a altura da tela
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
 
        //Define largura e altura do div#mask iguais ás dimensões da tela
        $('#mask').css({
            width: maskWidth,
            height: maskHeight,
            opacity: 0.8
        });
 
        //efeito de transição
        $('iframe').hide();
        $('#mask').fadeIn();
        
 
        //armazena a largura e a altura da janela
        var winH = $(window).height();
        var winW = $(window).width();
        var scrollTop = $(window).scrollTop()
        
        //centraliza na tela a janela popup
        $(id).css('top',  (winH/2 - $(id).height()/2) + scrollTop);
        $(id).css('left', winW/2 - $(id).width()/2);
        //efeito de transição
        $(id).fadeIn();
        
        
        
    });
 
    //se o botãoo fechar for clicado
    $('.window .close').click(function (e) {
        //cancela o comportamento padrão do link
        e.preventDefault();
        $('#mask, .window').hide();
        $('iframe').show();
        window.location.reload();
    });
 
    //se div#mask for clicado
    /*$('#mask').click(function () {
        $(this).hide();
        $('.window').hide();
        $('iframe').show();
        window.location.reload();
    });*/
});
    