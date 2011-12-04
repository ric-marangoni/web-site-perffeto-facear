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
                <td style="text-align: center;">
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
                <td style="text-align: center;">
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
                <td style="text-align: center;">
                    <input type="button" class="btn-horario-gravar" value="gravar" />
                    <input type="button" class="btn-horario-deletar" value="deletar" />
                </td>
                <%}%>
            </tr>

            <tr>
                <td>10h30 - 11h30</td>
                <td><span>-</span></td>
                <td><span>-</span></td>
                <td><span>-</span></td>
                <td><span>-</span></td> 
                <td><span>-</span></td>
                <td class="danca-salao">Dança de Salão</td>
                <%if(session.getAttribute("logado") != null){%>
                <td style="text-align: center;">
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
            </tr>
            <tr>
                <td><span>-</span></td>
                <td><span>-</span></td>
                <td><span>-</span></td>
                <td><span>-</span></td>
                <td><span>-</span></td>
                <td><span>-</span></td>
                <td><span>-</span></td>
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
            </tr>
            <tr>
                <td>18h20 - 19h20</td> 
                <td class="pump">Body Jump</td> 
                <td class="jump">Power Jump</td>
                <td class="pump">Body Jump</td>  
                <td class="jump">Power Jump</td> 
                <td class="pump">Body Jump</td> 
                <td><span>-</span></td>
            </tr>
            <tr>
                <td>19h30 - 20h30</td>
                <td class="jump">Power Jump</td> 
                <td class="pump">Body Jump</td>
                <td class="jump">Power Jump</td>  
                <td class="pump">Body Jump</td> 
                <td class="jump">Power Jump</td>
                <td><span>-</span></td>
            </tr> 
            <tr>
                <td>20h40 - 21h20</td> 
                <td><span>-</span></td>
                <td class="spinning">Spinning</td>  
                <td><span>-</span></td> 
                <td class="spinning">Spinning</td> 
                <td><span>-</span></td>
                <td><span>-</span></td>
            </tr>
            <tr>
                <td>20h30 - 22h00</td> 
                <td class="muay-thai">Mhuay Thai</td>  
                <td><span>-</span></td> 
                <td class="muay-thai">Mhuay Thai</td> 
                <td><span>-</span></td>
                <td class="muay-thai">Mhuay Thai</td>
                <td><span>-</span></td>
            </tr>

            <tr>
                <td>20h30 - 21h30</td>  
                <td><span>-</span></td>  
                <td><span>-</span></td>
                <td><span>-</span></td>
                <td class="danca-salao">Dança de Salão</td>
                <td><span>-</span></td>
                <td><span>-</span></td>
            </tr>
        </table>
    </div>                
</div>