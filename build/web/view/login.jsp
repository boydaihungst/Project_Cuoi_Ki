<%-- 
    Document   : login
    Created on : Jun 17, 2018, 9:01:28 PM
    Author     : DrAgOn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
    </head>
    <body>
        <form action="login" method="POST">
            Tên tài khoản <input type="text" name="username" required/> <br>
            Mật khẩu <input type="password" name="password" required/> <br>
            <input type="submit" name="submit" value="Đăng nhập"/>
        </form>

    </body>
</html>
