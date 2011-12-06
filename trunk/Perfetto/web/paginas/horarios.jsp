<%@page import="br.com.perfetto.entidades.Horario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.perfetto.controller.HorarioController"%>

<%
    //OBJETOS
    HorarioController horario = new HorarioController();
%>

<div id="conteudo">
    <h1>Horários</h1>
    <br />
    <p>
        <strong><b class="vermelho">Importante:</b> O horário de funcionamento da academia é de segunda a quinta 
            das 07:00 às 23:30, sexta das 07:00 às 22:30 e sábado das 07:00 às 15:00.</strong>
    </p>
    <div class="horarios">
        <%if (session.getAttribute("logado") != null) {%>
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
                <%if (session.getAttribute("logado") != null) {%>
                <th><span>Ações</span></th>
                <%}%>
            </tr>
            <%ArrayList<Horario> listaManha = horario.getHorarios(1);%>
            <%if(listaManha.size() > 0){%>
            <%for(int i = 0; i < listaManha.size(); i++){%>
            <tr id="manha-<%out.print(listaManha.get(i).getId());%>">
                <td>
                    <%if(session.getAttribute("logado") != null) {%>
                    <input type="text" class="horario-temp" name="horario" value="<%out.print(listaManha.get(i).getHorario());%>" />
                    <input type="hidden" class="id-temp" name="id" value="<%out.print(listaManha.get(i).getId());%>" />
                    <div class="preenche-espaco">Horário</div>
                    <%} else {%>
                        <%out.print(listaManha.get(i).getHorario());%>
                    <%}%>
                </td> 
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-manha-<%out.print(listaManha.get(i).getId());%>-<%out.print(listaManha.get(i).getId());%>">
                    <input type="text" style="color: #<%out.print(listaManha.get(i).getCor_segunda());%>" class="segunda-temp" name="segunda-temp" value="<%out.print(listaManha.get(i).getSegunda());%>" />
                    <input type="hidden" class="cor-segunda-temp" value="<%out.print(listaManha.get(i).getCor_segunda());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listaManha.get(i).getCor_segunda());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listaManha.get(i).getCor_segunda());%> !important" class="cor-hex">
                        <%out.print(listaManha.get(i).getCor_segunda());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listaManha.get(i).getCor_segunda());%>">
                        <%out.print(listaManha.get(i).getSegunda());%>
                    </span>
                    <%}%>
                </td>
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-manha-<%out.print(listaManha.get(i).getId());%>-<%out.print(listaManha.get(i).getId()+1);%>">
                    <input type="text" style="color: #<%out.print(listaManha.get(i).getCor_terca());%>" class="terca-temp" name="terca-temp" value="<%out.print(listaManha.get(i).getTerca());%>" />
                    <input type="hidden" class="cor-terca-temp" value="<%out.print(listaManha.get(i).getCor_segunda());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listaManha.get(i).getCor_terca());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listaManha.get(i).getCor_terca());%> !important" class="cor-hex">
                        <%out.print(listaManha.get(i).getCor_terca());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listaManha.get(i).getCor_terca());%>">
                        <%out.print(listaManha.get(i).getTerca());%>
                    </span>
                    <%}%>
                </td>
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-manha-<%out.print(listaManha.get(i).getId());%>-<%out.print(listaManha.get(i).getId()+2);%>">
                    <input type="text" style="color: #<%out.print(listaManha.get(i).getCor_quarta());%>" class="quarta-temp" name="quarta-temp" value="<%out.print(listaManha.get(i).getQuarta());%>" />
                    <input type="hidden" class="cor-quarta-temp" value="<%out.print(listaManha.get(i).getCor_quarta());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listaManha.get(i).getCor_quarta());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listaManha.get(i).getCor_quarta());%> !important" class="cor-hex">
                        <%out.print(listaManha.get(i).getCor_quarta());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listaManha.get(i).getCor_quarta());%>">
                        <%out.print(listaManha.get(i).getQuarta());%>
                    </span>
                    <%}%>
                </td>
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-manha-<%out.print(listaManha.get(i).getId());%>-<%out.print(listaManha.get(i).getId()+3);%>">
                    <input type="text" style="color: #<%out.print(listaManha.get(i).getCor_quinta());%>" class="quinta-temp" name="quinta-temp" value="<%out.print(listaManha.get(i).getQuinta());%>" />
                    <input type="hidden" class="cor-quinta-temp" value="<%out.print(listaManha.get(i).getCor_quinta());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listaManha.get(i).getCor_quinta());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listaManha.get(i).getCor_quinta());%> !important" class="cor-hex">
                        <%out.print(listaManha.get(i).getCor_quinta());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listaManha.get(i).getCor_quinta());%>">
                        <%out.print(listaManha.get(i).getQuinta());%>
                    </span>
                    <%}%>
                </td>
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-manha-<%out.print(listaManha.get(i).getId());%>-<%out.print(listaManha.get(i).getId()+4);%>">
                    <input type="text" style="color: #<%out.print(listaManha.get(i).getCor_sexta());%>" class="sexta-temp" name="sexta-temp" value="<%out.print(listaManha.get(i).getSexta());%>" />
                    <input type="hidden" class="cor-sexta-temp" value="<%out.print(listaManha.get(i).getCor_sexta());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listaManha.get(i).getCor_sexta());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listaManha.get(i).getCor_sexta());%> !important" class="cor-hex">
                        <%out.print(listaManha.get(i).getCor_sexta());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listaManha.get(i).getCor_sexta());%>">
                        <%out.print(listaManha.get(i).getSexta());%>
                    </span>
                    <%}%>
                </td>
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-manha-<%out.print(listaManha.get(i).getId());%>-<%out.print(listaManha.get(i).getId()+5);%>">
                    <input type="text" style="color: #<%out.print(listaManha.get(i).getCor_sabado());%>" class="sabado-temp" name="sabado-temp" value="<%out.print(listaManha.get(i).getSabado());%>" />
                    <input type="hidden" class="cor-sabado-temp" value="<%out.print(listaManha.get(i).getCor_sabado());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listaManha.get(i).getCor_sabado());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listaManha.get(i).getCor_sabado());%> !important" class="cor-hex">
                        <%out.print(listaManha.get(i).getCor_sabado());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listaManha.get(i).getCor_sabado());%>">
                        <%out.print(listaManha.get(i).getSabado());%>
                    </span>
                    <%}%>
                </td>
                <%if (session.getAttribute("logado") != null) {%>
                <td class="ultimo">
                    <input type="button" id="form-manha-<%out.print(listaManha.get(i).getId());%>" class="btn-horario-gravar" value="gravar" />
                    <input type="button" id="delete-manha-<%out.print(listaManha.get(i).getId());%>" class="btn-horario-deletar" value="deletar" />
                </td>
                <%}%>
                <td class="no-show">
                    <form name="form-manha-<%out.print(listaManha.get(i).getId());%>">
                        <input type="hidden" class="id" name="id" />
                        <input type="hidden" name="periodo" value="1" />
                        <input type="text" class="horario" name="horario" />
                        <input type="text" class="segunda" name="segunda" value="-" />
                        <input type="text" class="cor-segunda" name="cor-segunda" />
                        <input type="text" class="terca" name="terca" value="-" />
                        <input type="text" class="cor-terca" name="cor-terca" />
                        <input type="text" class="quarta" name="quarta" value="-" />
                        <input type="text" class="cor-quarta" name="cor-quarta" />
                        <input type="text" class="quinta" name="quinta" value="-" />
                        <input type="text" class="cor-quinta" name="cor-quinta" />
                        <input type="text" class="sexta" name="sexta" value="-" />
                        <input type="text" class="cor-sexta" name="cor-sexta" />
                        <input type="text" class="sabado" name="sabado" value="-" />
                        <input type="text" class="cor-sabado" name="cor-sabado" />
                    </form>
                </td>
            </tr>
            <%}%>
            <%} else {%>
            <tr id="manha-100">
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
            </tr>
            <%}%>
        </table>
    </div>
    <div class="horarios">
        <%if (session.getAttribute("logado") != null) {%>
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
                <%if (session.getAttribute("logado") != null) {%>
                <th><span>Ações</span></th>
                <%}%>
            </tr>
            <%ArrayList<Horario> listatarde = horario.getHorarios(2);%>
            <%if(listatarde.size() > 0){%>
            <%for(int i = 0; i < listatarde.size(); i++){%>
            <tr id="tarde-<%out.print(listatarde.get(i).getId());%>">
                <td>
                    <%if(session.getAttribute("logado") != null) {%>
                    <input type="text" class="horario-temp" name="horario" value="<%out.print(listatarde.get(i).getHorario());%>" />
                    <input type="hidden" class="id-temp" name="id" value="<%out.print(listatarde.get(i).getId());%>" />
                    <div class="preenche-espaco">Horário</div>
                    <%} else {%>
                        <%out.print(listatarde.get(i).getHorario());%>
                    <%}%>
                </td> 
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-tarde-<%out.print(listatarde.get(i).getId());%>-<%out.print(listatarde.get(i).getId());%>">
                    <input type="text" style="color: #<%out.print(listatarde.get(i).getCor_segunda());%>" class="segunda-temp" name="segunda-temp" value="<%out.print(listatarde.get(i).getSegunda());%>" />
                    <input type="hidden" class="cor-segunda-temp" value="<%out.print(listatarde.get(i).getCor_segunda());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listatarde.get(i).getCor_segunda());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listatarde.get(i).getCor_segunda());%> !important" class="cor-hex">
                        <%out.print(listatarde.get(i).getCor_segunda());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listatarde.get(i).getCor_segunda());%>">
                        <%out.print(listatarde.get(i).getSegunda());%>
                    </span>
                    <%}%>
                </td>
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-tarde-<%out.print(listatarde.get(i).getId());%>-<%out.print(listatarde.get(i).getId()+1);%>">
                    <input type="text" style="color: #<%out.print(listatarde.get(i).getCor_terca());%>" class="terca-temp" name="terca-temp" value="<%out.print(listatarde.get(i).getTerca());%>" />
                    <input type="hidden" class="cor-terca-temp" value="<%out.print(listatarde.get(i).getCor_segunda());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listatarde.get(i).getCor_terca());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listatarde.get(i).getCor_terca());%> !important" class="cor-hex">
                        <%out.print(listatarde.get(i).getCor_terca());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listatarde.get(i).getCor_terca());%>">
                        <%out.print(listatarde.get(i).getTerca());%>
                    </span>
                    <%}%>
                </td>
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-tarde-<%out.print(listatarde.get(i).getId());%>-<%out.print(listatarde.get(i).getId()+2);%>">
                    <input type="text" style="color: #<%out.print(listatarde.get(i).getCor_quarta());%>" class="quarta-temp" name="quarta-temp" value="<%out.print(listatarde.get(i).getQuarta());%>" />
                    <input type="hidden" class="cor-quarta-temp" value="<%out.print(listatarde.get(i).getCor_quarta());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listatarde.get(i).getCor_quarta());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listatarde.get(i).getCor_quarta());%> !important" class="cor-hex">
                        <%out.print(listatarde.get(i).getCor_quarta());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listatarde.get(i).getCor_quarta());%>">
                        <%out.print(listatarde.get(i).getQuarta());%>
                    </span>
                    <%}%>
                </td>
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-tarde-<%out.print(listatarde.get(i).getId());%>-<%out.print(listatarde.get(i).getId()+3);%>">
                    <input type="text" style="color: #<%out.print(listatarde.get(i).getCor_quinta());%>" class="quinta-temp" name="quinta-temp" value="<%out.print(listatarde.get(i).getQuinta());%>" />
                    <input type="hidden" class="cor-quinta-temp" value="<%out.print(listatarde.get(i).getCor_quinta());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listatarde.get(i).getCor_quinta());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listatarde.get(i).getCor_quinta());%> !important" class="cor-hex">
                        <%out.print(listatarde.get(i).getCor_quinta());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listatarde.get(i).getCor_quinta());%>">
                        <%out.print(listatarde.get(i).getQuinta());%>
                    </span>
                    <%}%>
                </td>
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-tarde-<%out.print(listatarde.get(i).getId());%>-<%out.print(listatarde.get(i).getId()+4);%>">
                    <input type="text" style="color: #<%out.print(listatarde.get(i).getCor_sexta());%>" class="sexta-temp" name="sexta-temp" value="<%out.print(listatarde.get(i).getSexta());%>" />
                    <input type="hidden" class="cor-sexta-temp" value="<%out.print(listatarde.get(i).getCor_sexta());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listatarde.get(i).getCor_sexta());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listatarde.get(i).getCor_sexta());%> !important" class="cor-hex">
                        <%out.print(listatarde.get(i).getCor_sexta());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listatarde.get(i).getCor_sexta());%>">
                        <%out.print(listatarde.get(i).getSexta());%>
                    </span>
                    <%}%>
                </td>
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-tarde-<%out.print(listatarde.get(i).getId());%>-<%out.print(listatarde.get(i).getId()+5);%>">
                    <input type="text" style="color: #<%out.print(listatarde.get(i).getCor_sabado());%>" class="sabado-temp" name="sabado-temp" value="<%out.print(listatarde.get(i).getSabado());%>" />
                    <input type="hidden" class="cor-sabado-temp" value="<%out.print(listatarde.get(i).getCor_sabado());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listatarde.get(i).getCor_sabado());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listatarde.get(i).getCor_sabado());%> !important" class="cor-hex">
                        <%out.print(listatarde.get(i).getCor_sabado());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listatarde.get(i).getCor_sabado());%>">
                        <%out.print(listatarde.get(i).getSabado());%>
                    </span>
                    <%}%>
                </td>
                <%if (session.getAttribute("logado") != null) {%>
                <td class="ultimo">
                    <input type="button" id="form-tarde-<%out.print(listatarde.get(i).getId());%>" class="btn-horario-gravar" value="gravar" />
                    <input type="button" id="delete-tarde-<%out.print(listatarde.get(i).getId());%>" class="btn-horario-deletar" value="deletar" />
                </td>
                <%}%>
                <td class="no-show">
                    <form name="form-tarde-<%out.print(listatarde.get(i).getId());%>">
                        <input type="hidden" class="id" name="id" />
                        <input type="hidden" name="periodo" value="2" />
                        <input type="text" class="horario" name="horario" />
                        <input type="text" class="segunda" name="segunda" value="-" />
                        <input type="text" class="cor-segunda" name="cor-segunda" />
                        <input type="text" class="terca" name="terca" value="-" />
                        <input type="text" class="cor-terca" name="cor-terca" />
                        <input type="text" class="quarta" name="quarta" value="-" />
                        <input type="text" class="cor-quarta" name="cor-quarta" />
                        <input type="text" class="quinta" name="quinta" value="-" />
                        <input type="text" class="cor-quinta" name="cor-quinta" />
                        <input type="text" class="sexta" name="sexta" value="-" />
                        <input type="text" class="cor-sexta" name="cor-sexta" />
                        <input type="text" class="sabado" name="sabado" value="-" />
                        <input type="text" class="cor-sabado" name="cor-sabado" />
                    </form>
                </td>
            </tr>            
            <%}%>
            <%} else {%>
            <tr id="tarde-100">
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <%if (session.getAttribute("logado") != null) {%>
                <td>-</td>
                <%}%>
            </tr>
            <%}%>
        </table>
    </div>
    <div class="horarios">
        <%if (session.getAttribute("logado") != null) {%>
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
                <%if (session.getAttribute("logado") != null) {%>
                <th><span>Ações</span></th>
                <%}%>
            </tr>
            <%ArrayList<Horario> listanoite = horario.getHorarios(3);%>
            <%if(listanoite.size() > 0){%>
            <%for(int i = 0; i < listanoite.size(); i++){%>
            <tr id="noite-<%out.print(listanoite.get(i).getId());%>">
                <td>
                    <%if(session.getAttribute("logado") != null) {%>
                    <input type="text" class="horario-temp" name="horario" value="<%out.print(listanoite.get(i).getHorario());%>" />
                    <input type="hidden" class="id-temp" name="id" value="<%out.print(listanoite.get(i).getId());%>" />
                    <div class="preenche-espaco">Horário</div>
                    <%} else {%>
                        <%out.print(listanoite.get(i).getHorario());%>
                    <%}%>
                </td> 
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-noite-<%out.print(listanoite.get(i).getId());%>-<%out.print(listanoite.get(i).getId());%>">
                    <input type="text" style="color: #<%out.print(listanoite.get(i).getCor_segunda());%>" class="segunda-temp" name="segunda-temp" value="<%out.print(listanoite.get(i).getSegunda());%>" />
                    <input type="hidden" class="cor-segunda-temp" value="<%out.print(listanoite.get(i).getCor_segunda());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listanoite.get(i).getCor_segunda());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listanoite.get(i).getCor_segunda());%> !important" class="cor-hex">
                        <%out.print(listanoite.get(i).getCor_segunda());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listanoite.get(i).getCor_segunda());%>">
                        <%out.print(listanoite.get(i).getSegunda());%>
                    </span>
                    <%}%>
                </td>
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-noite-<%out.print(listanoite.get(i).getId());%>-<%out.print(listanoite.get(i).getId()+1);%>">
                    <input type="text" style="color: #<%out.print(listanoite.get(i).getCor_terca());%>" class="terca-temp" name="terca-temp" value="<%out.print(listanoite.get(i).getTerca());%>" />
                    <input type="hidden" class="cor-terca-temp" value="<%out.print(listanoite.get(i).getCor_segunda());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listanoite.get(i).getCor_terca());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listanoite.get(i).getCor_terca());%> !important" class="cor-hex">
                        <%out.print(listanoite.get(i).getCor_terca());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listanoite.get(i).getCor_terca());%>">
                        <%out.print(listanoite.get(i).getTerca());%>
                    </span>
                    <%}%>
                </td>
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-noite-<%out.print(listanoite.get(i).getId());%>-<%out.print(listanoite.get(i).getId()+2);%>">
                    <input type="text" style="color: #<%out.print(listanoite.get(i).getCor_quarta());%>" class="quarta-temp" name="quarta-temp" value="<%out.print(listanoite.get(i).getQuarta());%>" />
                    <input type="hidden" class="cor-quarta-temp" value="<%out.print(listanoite.get(i).getCor_quarta());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listanoite.get(i).getCor_quarta());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listanoite.get(i).getCor_quarta());%> !important" class="cor-hex">
                        <%out.print(listanoite.get(i).getCor_quarta());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listanoite.get(i).getCor_quarta());%>">
                        <%out.print(listanoite.get(i).getQuarta());%>
                    </span>
                    <%}%>
                </td>
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-noite-<%out.print(listanoite.get(i).getId());%>-<%out.print(listanoite.get(i).getId()+3);%>">
                    <input type="text" style="color: #<%out.print(listanoite.get(i).getCor_quinta());%>" class="quinta-temp" name="quinta-temp" value="<%out.print(listanoite.get(i).getQuinta());%>" />
                    <input type="hidden" class="cor-quinta-temp" value="<%out.print(listanoite.get(i).getCor_quinta());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listanoite.get(i).getCor_quinta());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listanoite.get(i).getCor_quinta());%> !important" class="cor-hex">
                        <%out.print(listanoite.get(i).getCor_quinta());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listanoite.get(i).getCor_quinta());%>">
                        <%out.print(listanoite.get(i).getQuinta());%>
                    </span>
                    <%}%>
                </td>
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-noite-<%out.print(listanoite.get(i).getId());%>-<%out.print(listanoite.get(i).getId()+4);%>">
                    <input type="text" style="color: #<%out.print(listanoite.get(i).getCor_sexta());%>" class="sexta-temp" name="sexta-temp" value="<%out.print(listanoite.get(i).getSexta());%>" />
                    <input type="hidden" class="cor-sexta-temp" value="<%out.print(listanoite.get(i).getCor_sexta());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listanoite.get(i).getCor_sexta());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listanoite.get(i).getCor_sexta());%> !important" class="cor-hex">
                        <%out.print(listanoite.get(i).getCor_sexta());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listanoite.get(i).getCor_sexta());%>">
                        <%out.print(listanoite.get(i).getSexta());%>
                    </span>
                    <%}%>
                </td>
                <td
                    <%if(session.getAttribute("logado") != null) {%>
                    class="atach-color"
                    id="td-noite-<%out.print(listanoite.get(i).getId());%>-<%out.print(listanoite.get(i).getId()+5);%>">
                    <input type="text" style="color: #<%out.print(listanoite.get(i).getCor_sabado());%>" class="sabado-temp" name="sabado-temp" value="<%out.print(listanoite.get(i).getSabado());%>" />
                    <input type="hidden" class="cor-sabado-temp" value="<%out.print(listanoite.get(i).getCor_sabado());%>" />
                    <p>Alterar cor:</p>
                    <div id="colorSelector">
                        <div style="background-color: #<%out.print(listanoite.get(i).getCor_sabado());%>"></div>
                    </div>
                    <br />
                    Cor atual: <span style="color: #<%out.print(listanoite.get(i).getCor_sabado());%> !important" class="cor-hex">
                        <%out.print(listanoite.get(i).getCor_sabado());%>
                    </span>
                    <%} else {%>
                    <span style="font-weight: bold; color: #<%out.print(listanoite.get(i).getCor_sabado());%>">
                        <%out.print(listanoite.get(i).getSabado());%>
                    </span>
                    <%}%>
                </td>
                <%if (session.getAttribute("logado") != null) {%>
                <td class="ultimo">
                    <input type="button" id="form-noite-<%out.print(listanoite.get(i).getId());%>" class="btn-horario-gravar" value="gravar" />
                    <input type="button" id="delete-noite-<%out.print(listanoite.get(i).getId());%>" class="btn-horario-deletar" value="deletar" />
                </td>
                <%}%>
                <td class="no-show">
                    <form name="form-noite-<%out.print(listanoite.get(i).getId());%>">
                        <input type="hidden" class="id" name="id" />
                        <input type="hidden" name="periodo" value="3" />
                        <input type="text" class="horario" name="horario" />
                        <input type="text" class="segunda" name="segunda" value="-" />
                        <input type="text" class="cor-segunda" name="cor-segunda" />
                        <input type="text" class="terca" name="terca" value="-" />
                        <input type="text" class="cor-terca" name="cor-terca" />
                        <input type="text" class="quarta" name="quarta" value="-" />
                        <input type="text" class="cor-quarta" name="cor-quarta" />
                        <input type="text" class="quinta" name="quinta" value="-" />
                        <input type="text" class="cor-quinta" name="cor-quinta" />
                        <input type="text" class="sexta" name="sexta" value="-" />
                        <input type="text" class="cor-sexta" name="cor-sexta" />
                        <input type="text" class="sabado" name="sabado" value="-" />
                        <input type="text" class="cor-sabado" name="cor-sabado" />
                    </form>
                </td>
            </tr>
            <%}%>
            <%} else {%>
            <tr id="noite-100">
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
            </tr>
            <%}%>
        </table>
    </div>    
    <div style="display: none;" class="ajax-msg"></div>    
</div>

<script type="text/javascript">
    jQuery(document).ready(function(){
        
        jQuery('.atach-color').each(function(){
                var tdID = jQuery(this).attr('id');
                
                $('#'+tdID + ' #colorSelector').ColorPicker({
                    color: $('#'+tdID + ' .cor-hex').html(),
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
            var corsegunda = jQuery('#'+trID+' .cor-segunda-temp').val();
            var terca = jQuery('#'+trID+' .terca-temp').val();
            var corterca = jQuery('#'+trID+' .cor-terca-temp').val();
            var quarta = jQuery('#'+trID+' .quarta-temp').val();
            var corquarta = jQuery('#'+trID+' .cor-quarta-temp').val();            
            var quinta = jQuery('#'+trID+' .quinta-temp').val();
            var corquinta = jQuery('#'+trID+' .cor-quinta-temp').val();
            var sexta = jQuery('#'+trID+' .sexta-temp').val();
            var corsexta = jQuery('#'+trID+' .cor-sexta-temp').val();
            var sabado = jQuery('#'+trID+' .sabado-temp').val();
            var corsabado = jQuery('#'+trID+' .cor-sabado-temp').val();
            
            jQuery('form[name='+formName+'] .id').val(id);            
            jQuery('form[name='+formName+'] .horario').val(horario);            
            jQuery('form[name='+formName+'] .segunda').val(segunda);
            jQuery('form[name='+formName+'] .cor-segunda').val(corsegunda);
            jQuery('form[name='+formName+'] .terca').val(terca);
            jQuery('form[name='+formName+'] .cor-terca').val(corterca);
            jQuery('form[name='+formName+'] .quarta').val(quarta);
            jQuery('form[name='+formName+'] .cor-quarta').val(corquarta);
            jQuery('form[name='+formName+'] .quinta').val(quinta);
            jQuery('form[name='+formName+'] .cor-quinta').val(corquinta);
            jQuery('form[name='+formName+'] .sexta').val(sexta);
            jQuery('form[name='+formName+'] .cor-sexta').val(corsexta);
            jQuery('form[name='+formName+'] .sabado').val(sabado);
            jQuery('form[name='+formName+'] .cor-sabado').val(corsabado);
            
            var metodo = (id * 1 == 0) ? 'incluir' : 'editar';
            
            var params = jQuery('form[name='+formName+']').serialize();            
            
            ajax.normalRequest('HorarioController', metodo, params, '.ajax-msg');
            
            if(jQuery('#'+trID+' .horario-temp').val() != "" && metodo == 'incluir'){
                jQuery('#'+trID).fadeOut();
            }

        });
        
        jQuery('.btn-horario-deletar').click(function(){
            var id = jQuery(this).attr('id');
            id = id.split("-");
            periodo = id[1]+'-';
            id = id[2];
            
            if(window.confirm("Tem certeza que deseja fazer isso ?")){
                ajax.deleteRequest('HorarioController', id, periodo);
            }           
            
        });
                
    });    
</script>