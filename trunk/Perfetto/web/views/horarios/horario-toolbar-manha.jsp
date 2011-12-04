<div class="horario-toolbar">
    <ul>
        <li class="add">
            <a href="javascript:void(0)" id="horario-incluir-manha" name="horario-incluir">incluir horário</a>     
        </li>        
</div>

<script type="text/javascript">
    jQuery(document).ready(function(){
        jQuery('#horario-incluir-manha').click(function(){
            jQuery('#manha').append('\
                   <tr>\
                        <td><input type="text" name="horario" class="horario" /></td>\
                        <td><input type="text" name="segunda" value="-" /></td>\
                        <td><input type="text" name="terca" value="-" /></td>\
                        <td><input type="text" name="quarta" value="-" /></td>\
                        <td><input type="text" name="quinta" value="-" /></td>\
                        <td><input type="text" name="sexta" value="-" /></td>\
                        <td><input type="text" name="sabado" value="-" /></td>\
                        <td class="ultimo">\
                            <input type="button" class="btn-horario-gravar" value="gravar" />\
                        </td>\
                   </tr>\
            ');                
        });        
    });
</script>