<div class="horario-toolbar">
    <ul>
        <li class="add">
            <a href="javascript:void(0)" id="horario-incluir-manha" name="horario-incluir">incluir horário</a>     
        </li>        
</div>

<script type="text/javascript">
    jQuery(document).ready(function(){
        jQuery('#horario-incluir-manha').click(function(){
            var trID = jQuery('#manha tr').last().attr('id');
            trID = trID.split("-");
            trID = trID[1] * 1 + 1;
            
            jQuery('#manha').append('\
                   <tr id="manha-'+trID+'">\
                        <td>\
                            <input type="text" class="horario-temp" name="horario" />\
                            <input type="hidden" class="id-temp" name="id" value="0" />\
                        </td>\
                        <td><input type="text" class="segunda-temp" name="segunda" value="-" /></td>\
                        <td><input type="text" class="terca-temp" name="terca" value="-" /></td>\
                        <td><input type="text" class="quarta-temp" name="quarta" value="-" /></td>\
                        <td><input type="text" class="quinta-temp" name="quinta" value="-" /></td>\
                        <td><input type="text" class="sexta-temp" name="sexta" value="-" /></td>\
                        <td><input type="text" class="sabado-temp" name="sabado" value="-" /></td>\
                        <td class="ultimo">\
                            <input type="button" id="form-manha-'+trID+'" class="btn-horario-gravar" value="gravar" />\
                        </td>\
                        <td class="no-show">\
                            <form name="form-manha-'+trID+'">\
                                <input type="hidden" class="id" name="id" />\
                                <input type="hidden" name="periodo" value="1" />\
                                <input type="text" class="horario" name="horario" />\
                                <input type="text" class="segunda" name="segunda" value="-" />\
                                <input type="text" class="terca" name="terca" value="-" />\
                                <input type="text" class="quarta" name="quarta" value="-" />\
                                <input type="text" class="quinta" name="quinta" value="-" />\
                                <input type="text" class="sexta" name="sexta" value="-" />\
                                <input type="text" class="sabado" name="sabado" value="-" />\
                            </form>\
                        </td>\
                   </tr>\
            ');                
        });        
    });
</script>