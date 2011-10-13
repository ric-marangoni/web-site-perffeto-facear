<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bem Vindo Administrador</title>
        <link href="css/admin.css" type="text/css" rel="stylesheet" />
    </head>
    <body>
        <div id="login">
            <form action="../controllers/loginController.jsp" method="post">
                <legend>Bem Vindo</legend>
                <span>Login:</span>
                <input type="text" name="login" />
                <span>Senha:</span>
                <input type="password" name="senha" />
                <input type="submit" class="btn" value="Entrar" />
            </form>            
        </div>
    </body>
</html>
