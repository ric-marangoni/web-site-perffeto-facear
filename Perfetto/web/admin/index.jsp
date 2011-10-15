<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bem Vindo Administrador</title>
        <link href="${path}css/admin.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <div id="login">
            <form action="../AdminController" method="post">
                <legend>Bem Vindo</legend>
                <span>Login:</span>
                <input type="text" name="login" />
                <span>Senha:</span>
                <input type="password" name="senha" />
                <input type="hidden" name="action" value="1" />
                <input type="submit" class="btn" value="Entrar" />
            </form>
            ${msgErro}
        </div>
    </body>
</html>
