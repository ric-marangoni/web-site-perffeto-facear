<div class="horario-toolbar">
    <ul>
        <li class="add">
            <a href="javascript:void(0)" id="horario-incluir-noite" name="horario-incluir">incluir horário</a>     
        </li>        
</div>

<script type="text/javascript">
    jQuery(document).ready(function(){
        jQuery('#horario-incluir-noite').click(function(){
            var trID = jQuery('#noite tr').last().attr('id');
            trID = trID.split("-");
            trID = trID[1] * 1 + 1;
            
            jQuery('#noite').append('\
                <tr id="noite-'+trID+'">\
                    <td>\
                        <input type="text" class="horario-temp" name="horario" />\
                        <input type="hidden" class="id-temp" name="id" value="0" />\
                        <div class="preenche-espaco">Horário</div>\
                    </td>\
                    <td class="atach-color" id="td-noite-'+trID+'">\
                        <input type="text" class="segunda-temp" name="segunda-temp" value="-" />\
                        <input type="hidden" class="cor-segunda-temp" value="333333" />\
                        <p>Alterar cor:</p>\
                 		<div id="colorSelector">\
                            <div></div>\
                        </div>\
						<br />\
						Cor atual: <span class="cor-hex">333333</span>\
                    </td>\
                    <td class="atach-color" id="td-noite-'+trID+1+'">\
                        <input type="text" class="terca-temp" name="terca-temp" value="-" />\
                        <input type="hidden" class="cor-terca-temp" value="333333" />\
                        <p>Alterar cor:</p>\
						<div id="colorSelector">\
                            <div></div>\
                        </div>\
						<br />\
						Cor atual: <span class="cor-hex">333333</span>\
                    </td>\\n\
                    <td class="atach-color" id="td-noite-'+trID+2+'">\
                        <input type="text" class="quarta-temp" name="quarta-temp" value="-" />\
                        <input type="hidden" class="cor-quarta-temp" value="333333" />\
                        <p>Alterar cor:</p>\
						<div id="colorSelector">\
                            <div></div>\
                        </div>\
						<br />\
						Cor atual: <span class="cor-hex">333333</span>\
                    </td>\
                    <td class="atach-color" id="td-noite-'+trID+3+'">\
                        <input type="text" class="quinta-temp" name="quinta-temp" value="-" />\
                        <input type="hidden" class="cor-quinta-temp" value="333333" />\
                        <p>Alterar cor:</p>\
						<div id="colorSelector">\
                            <div></div>\
                        </div>\
						<br />\
						Cor atual: <span class="cor-hex">333333</span>\
                   </td>\
                    <td class="atach-color" id="td-noite-'+trID+4+'">\
                        <input type="text" class="sexta-temp" name="sexta-temp" value="-" />\
                        <input type="hidden" class="cor-sexta-temp" value="333333" />\
                        <p>Alterar cor:</p>\
						<div id="colorSelector">\
                            <div></div>\
                        </div>\
						<br />\
						Cor atual: <span class="cor-hex">333333</span>\
                    </td>\
                    <td class="atach-color" id="td-noite-'+trID+5+'">\
                        <input type="text" class="sabado-temp" name="sabado-temp" value="-" />\
                        <input type="hidden" class="cor-sabado-temp" value="333333" />\
                        <p>Alterar cor:</p>\
						<div id="colorSelector">\
                            <div></div>\
                        </div>\
						<br />\
						Cor atual: <span class="cor-hex">333333</span>\
                    </td>\
                    <td class="ultimo">\
                        <input type="button" id="form-noite-'+trID+'" class="btn-horario-gravar" value="gravar" />\
                    </td>\
                    <td class="no-show">\
                        <form name="form-noite-'+trID+'">\
                            <input type="hidden" class="id" name="id" />\
                            <input type="hidden" name="periodo" value="3" />\
                            <input type="text" class="horario" name="horario" />\
                            <input type="text" class="segunda" name="segunda" value="-" />\\n\
                            <input type="text" class="cor-segunda" name="cor-segunda" />\
                            <input type="text" class="terca" name="terca" value="-" />\
                            <input type="text" class="cor-terca" name="cor-terca" />\
                            <input type="text" class="quarta" name="quarta" value="-" />\\n\
                            <input type="text" class="cor-quarta" name="cor-quarta" />\
                            <input type="text" class="quinta" name="quinta" value="-" />\\n\
                            <input type="text" class="cor-quinta" name="cor-quinta" />\
                            <input type="text" class="sexta" name="sexta" value="-" />\\n\
                            <input type="text" class="cor-sexta" name="cor-sexta" />\
                            <input type="text" class="sabado" name="sabado" value="-" />\\n\
                            <input type="text" class="cor-sabado" name="cor-sabado" />\
                        </form>\
                    </td>\
               </tr>\
            ');
        
            jQuery('.atach-color').each(function(){
                var tdID = jQuery(this).attr('id');

                $('#'+tdID + ' #colorSelector').ColorPicker({
                    color: '#333',
                    onShow: function (colpkr) {
                        $(colpkr).fadeIn(500);
                        return false;
                    },
                    onHide: function (colpkr) {
                        $(colpkr).fadeOut(500);
                        return false;
                    },
                    onChange: function (hsb, hex, rgb) {
                        $('#'+tdID + ' #colorSelector div').css('backgroundColor', '#' + hex);
                        $('#'+tdID + ' input').css('color', '#' + hex);
                        $('#'+tdID + ' input').eq(1).val(hex);
                        $('#'+tdID + ' .cor-hex').css('color', '#' + hex);
                        $('#'+tdID + ' .cor-hex').html(hex);
                    }
                });
            });
        });        
    });
</script>