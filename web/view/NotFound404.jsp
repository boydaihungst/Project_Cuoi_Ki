<%-- 
    Document   : NotFound404
    Created on : Jul 12, 2018, 3:16:41 PM
    Author     : DrAgOn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>404 not found</title>
         <jsp:include page="/templates/libs.jsp"></jsp:include>
        <style>
            .notfound{
                width: 100%;
                text-align: center;
                padding:0;
                margin:0;
                position: fixed;
                top:25%;
                /*left:5%*/
                font-size: 60px !important;
            }
        </style>
    </head>
    <body>
        <div class="container-body">
            <div class="container-fluid header">
                <jsp:include page="/templates/header.jsp"></jsp:include>
                </div>
                <div class="notfound">
                    <p>404<br>NOT<br>FOUND</p>
            </div>
        </div>

    </body>
</html>
