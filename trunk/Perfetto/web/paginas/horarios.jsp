<div id="conteudo">
    <h1>Horários</h1>
    <br />
    <p>
        <strong><b class="vermelho">Importante:</b> O horário de funcionamento da academia é de segunda a quinta 
            das 07:00 às 23:30, sexta das 07:00 às 22:30 e sábado das 07:00 às 15:00.</strong>
    </p>
    <div class="horarios">
        <%if(session.getAttribute("logado") != null){%>
        <%@include file="../views/horarios/horario-toolbar-manha.jsp" %>
        <%}%>
        <table border="0" cellspacing="0" id="manha">
            <tr>
                <th>Manhã</th>
                <th><span>Segunda</span></th> 
                <th><span>Terça</span></th> 
                <th><span>Quarta</span></th> 
                <th><span>Quinta</span></th> 
                <th><span>Sexta</span></th>
                <th><span>Sábado</span></th>
                <%if(session.getAttribute("logado") != null){%>
                <th><span>Ações</span></th>
                <%}%>
            </tr>
            <tr>
                <td>8h00 - 8h50</td> 
                <td class="jump">Power Jump</td> 
                <td><span>-</span></td>
                <td class="jump">Power Jump</td>  
                <td><span>-</span></td> 
                <td class="jump">Power Jump</td> 
                <td><span>-</span></td>
                <%if(session.getAttribute("logado") != null){%>
                <td class="ultimo">
                    <input type="button" class="btn-horario-gravar" value="gravar" />
                    <input type="button" class="btn-horario-deletar" value="deletar" />
                </td>
                <%}%>
            </tr>
            <tr>
                <td>8h30 - 9h30</td>
                <td><span>-</span></td> 
                <td class="pump">Body Jump</td>
                <td><span>-</span></td>  
                <td class="pump">Body Jump</td> 
                <td><span>-</span></td> 
                <td><span>-</span></td>
                <%if(session.getAttribute("logado") != null){%>
                <td class="ultimo">
                    <input type="button" class="btn-horario-gravar" value="gravar" />
                    <input type="button" class="btn-horario-deletar" value="deletar" />
                </td>
                <%}%>
            </tr>
            <tr>
                <td>9h00 - 9h40</td>
                <td class="spinning">Spinning</td> 
                <td><span>-</span></td>
                <td class="spinning">Spinning</td>  
                <td><span>-</span></td> 
                <td class="spinning">Spinning</td> 
                <td><span>-</span></td>
                <%if(session.getAttribute("logado") != null){%>
                <td class="ultimo">
                    <input type="button" class="btn-horario-gravar" value="gravar" />
                    <input type="button" class="btn-horario-deletar" value="deletar" />
                </td>
                <%}%>
            </tr>

            <tr id="manha-4">
                <td>10h30 - 11h30</td>
                <td><span>-</span></td>
                <td><span>-</span></td>
                <td><span>-</span></td>
                <td><span>-</span></td> 
                <td><span>-</span></td>
                <td class="danca-salao">Dança de Salão</td>
                <%if(session.getAttribute("logado") != null){%>
                <td class="ultimo">
                    <input type="button" class="btn-horario-gravar" value="gravar" />
                    <input type="button" class="btn-horario-deletar" value="deletar" />
                </td>
                <%}%>
            </tr>
        </table>
    </div>
    <div class="horarios">
        <%if(session.getAttribute("logado") != null){%>
        <%@include file="../views/horarios/horario-toolbar-tarde.jsp" %>
        <%}%>
        <table border="0" cellspacing="0" id="tarde">
            <tr>    
                <th>Tarde</th>
                <th><span>Segunda</span></th> 
                <th><span>Terça</span></th> 
                <th><span>Quarta</span></th> 
                <th><span>Quinta</span></th> 
                <th><span>Sexta</span></th>
                <th><span>Sábado</span></th>
                <%if(session.getAttribute("logado") != null){%>
                <th><span>Ações</span></th>
                <%}%>
            </tr>
            <tr>
                <td><span>-</span></td>
                <td><span>-</span></td>
                <td><span>-</span></td>
                <td><span>-</span></td>
                <td><span>-</span></td>
                <td><span>-</span></td>
                <td><span>-</span></td>
                <%if(session.getAttribute("logado") != null){%>
                <td class="ultimo">
                    <input type="button" class="btn-horario-gravar" value="gravar" />
                    <input type="button" class="btn-horario-deletar" value="deletar" />
                </td>
                <%}%>
            </tr>
        </table>
    </div>
    <div class="horarios">
        <%if(session.getAttribute("logado") != null){%>
        <%@include file="../views/horarios/horario-toolbar-noite.jsp" %>
        <%}%>
        <table border="0" cellspacing="0" id="noite">
            <tr>
                <th>Noite</th>
                <th><span>Segunda</span></th> 
                <th><span>Terça</span></th> 
                <th><span>Quarta</span></th> 
                <th><span>Quinta</span></th> 
                <th><span>Sexta</span></th>
                <th><span>Sábado</span></th>
                <%if(session.getAttribute("logado") != null){%>
                <th><span>Ações</span></th>
                <%}%>
            </tr>
            <tr>
                <td>18h20 - 19h20</td> 
                <td class="pump">Body Jump</td> 
                <td class="jump">Power Jump</td>
                <td class="pump">Body Jump</td>  
                <td class="jump">Power Jump</td> 
                <td class="pump">Body Jump</td> 
                <td><span>-</span></td>
                <%if(session.getAttribute("logado") != null){%>
                <td class="ultimo">
                    <input type="button" class="btn-horario-gravar" value="gravar" />
                    <input type="button" class="btn-horario-deletar" value="deletar" />
                </td>
                <%}%>
            </tr>
            <tr>
                <td>19h30 - 20h30</td>
                <td class="jump">Power Jump</td> 
                <td class="pump">Body Jump</td>
                <td class="jump">Power Jump</td>  
                <td class="pump">Body Jump</td> 
                <td class="jump">Power Jump</td>
                <td><span>-</span></td>
                <%if(session.getAttribute("logado") != null){%>
                <td class="ultimo">
                    <input type="button" class="btn-horario-gravar" value="gravar" />
                    <input type="button" class="btn-horario-deletar" value="deletar" />
                </td>
                <%}%>
            </tr> 
            <tr>
                <td>20h40 - 21h20</td> 
                <td><span>-</span></td>
                <td class="spinning">Spinning</td>  
                <td><span>-</span></td> 
                <td class="spinning">Spinning</td> 
                <td><span>-</span></td>
                <td><span>-</span></td>
                <%if(session.getAttribute("logado") != null){%>
                <td class="ultimo">
                    <input type="button" class="btn-horario-gravar" value="gravar" />
                    <input type="button" class="btn-horario-deletar" value="deletar" />
                </td>
                <%}%>
            </tr>
            <tr>
                <td>20h30 - 22h00</td> 
                <td class="muay-thai">Mhuay Thai</td>  
                <td><span>-</span></td> 
                <td class="muay-thai">Mhuay Thai</td> 
                <td><span>-</span></td>
                <td class="muay-thai">Mhuay Thai</td>
                <td><span>-</span></td>
                <%if(session.getAttribute("logado") != null){%>
                <td class="ultimo">
                    <input type="button" class="btn-horario-gravar" value="gravar" />
                    <input type="button" class="btn-horario-deletar" value="deletar" />
                </td>
                <%}%>
            </tr>

            <tr>
                <td>20h30 - 21h30</td>  
                <td><span>-</span></td>  
                <td><span>-</span></td>
                <td><span>-</span></td>
                <td class="danca-salao">Dança de Salão</td>
                <td><span>-</span></td>
                <td><span>-</span></td>
                <%if(session.getAttribute("logado") != null){%>
                <td class="ultimo">
                    <input type="button" class="btn-horario-gravar" value="gravar" />
                    <input type="button" class="btn-horario-deletar" value="deletar" />
                </td>
                <%}%>
            </tr>
        </table>
    </div>    
    <div class="ajax-msg"></div>
</div>
            
<script type="text/javascript">
    jQuery(document).ready(function(){
        
        jQuery('body').delegate('input[type=text]', 'focus', function(){            
            jQuery(this).select();
        });
        
        jQuery('body').delegate('input.horario-temp', 'focus', function(){            
            jQuery(this).mask("99h99 - 99h99",{placeholder: "_"});
        });
        
        
        jQuery('body').delegate('.btn-horario-gravar', 'click', function(){            
            var formName = jQuery(this).attr('id');
            var trID = formName.split("-");
            trID = trID[1]+'-'+trID[2];
            
            var id = jQuery('#'+trID+' .id-temp').val();           
            var horario = jQuery('#'+trID+' .horario-temp').val();
            var segunda = jQuery('#'+trID+' .segunda-temp').val();
            var terca = jQuery('#'+trID+' .terca-temp').val();
            var quarta = jQuery('#'+trID+' .quarta-temp').val();
            var quinta = jQuery('#'+trID+' .quinta-temp').val();
            var sexta = jQuery('#'+trID+' .sexta-temp').val();
            var sabado = jQuery('#'+trID+' .sabado-temp').val();
            
            jQuery('form[name='+formName+'] .id').val(id);            
            jQuery('form[name='+formName+'] .horario').val(horario);            
            jQuery('form[name='+formName+'] .segunda').val(segunda);
            jQuery('form[name='+formName+'] .terca').val(terca);
            jQuery('form[name='+formName+'] .quarta').val(quarta);
            jQuery('form[name='+formName+'] .quinta').val(quinta);
            jQuery('form[name='+formName+'] .sexta').val(sexta);
            jQuery('form[name='+formName+'] .sabado').val(sabado);
            
            var metodo = (id * 1 == 0) ? 'incluir' : 'editar';
            
            var params = jQuery('form[name='+formName+']').serialize();
            alert(params);
            alert(metodo);
            
            ajax.normalRequest('HorarioController', metodo, params, '.ajax-msg');            
        });
    });    
</script>