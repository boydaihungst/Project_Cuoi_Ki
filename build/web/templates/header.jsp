<%-- 
    Document   : header
    Created on : Jun 25, 2018, 11:47:27 AM
    Author     : DrAgOn
--%>

<%@page import="model.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            ArrayList<Categories> cats = (ArrayList<Categories>) request.getAttribute("cats");
        %>
        <style>
            body{
                background-color: black;
            }
            a{
                text-decoration: none;
                color:white;
            }
            .container{
                background-color: transparent;
            }
            .anime-type-drop-box{
                min-width:600px;
            }
            .anime-type-drop-box .col-sm-3{
                white-space: nowrap;
                overflow: visible;
                padding:8px;
                text-align: left;
            }
            .anime-type-drop-box .col-sm-3:focus
            ,.anime-type-drop-box .col-sm-3:hover{
                background-color: #f5f5f5;
            }
            .anime-type-drop-box .col-sm-3 a {
                font-size: 13px;
                width: 100%;
            }
            .anime-year-drop-box{
                padding:8px 0px;
                text-align: center;
            }
            .nav-title{
                font-size: 16px;
            }
            .dropdown-menu{
                background-color: black !important;
                opacity: 0.9;
            }
            .anime-type-drop-box .col-sm-3:hover{
                background-color: cornflowerblue;
                color: #111;
            }
            .navbar-toggle{
                font-size: 20px;
            }

            .search-form .input-group{
                padding-left:20px;
                margin-left: 100px;
                border:1px solid gray;
                border-radius: 20px;
                width: 100%;
            }
            .search-form .input-group input{
                color: white !important;
                padding:0;
                background-color: transparent;
                border:none;
            }
            .search-form .input-group input:focus{
                box-shadow: none;
            }
            .search-form .input-group .input-group-btn .btn{
                color: aliceblue !important;
                background-color: transparent;
                border:none;
                padding-right: 2px;

            }
            .navbar-header{
                position: fixed;
                border-bottom: 1px #43a6df solid;
                padding-right: 15px;
                background-color: black;
                z-index: 200;
                width: 1020px;

            }
            span.glyphicon{
                padding-right: 5px;
            }
            .navbar-collapse{
                padding-top: 53px;
            }
        </style>
    </head>
    <body>
        <div class="navbar-header" >
            <button type="button" class="glyphicon glyphicon-th navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <!--                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>              -->
            </button>
            <img width="100" height="auto" src="#" alt="logo" class="navbar-brand">
            <form class="navbar-form navbar-left search-form" action="">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Tìm kiếm" onkeypress="search_by_name(this.value)">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span>Đăng nhập</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-log-in"></span>Đăng kí</a></li>
            </ul>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li >
                    <a class="nav-title" href="#" >Trang chủ</a>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle nav-title" data-toggle="dropdown" href="#">Năm phát hành
                    </a>
                    <ul class="dropdown-menu anime-type-drop-box">
                        <li>
                            <div class="row">
                                <% for (int i = 2010; i < 2019; i++) {%>
                                <a class="col-sm-3" href="#">Năm <%=i%></a>
                                <%}
                                %>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle nav-title" data-toggle="dropdown" href="#">Thể loại
                    </a>
                    <ul class="dropdown-menu anime-type-drop-box">
                        <li>
                            <div class="row">
                                <% for (int i = 0; i < cats.size(); i++) {%>
                                <a class="col-sm-3"href="#"><%= cats.get(i).getCatName()%></a>
                                <%}
                                %>
                            </div>
                        </li>
                    </ul>
                </li>
                <li><a href="#">Anime Blu-ray</a></li>
                <li><a href="#">Danh Sách Anime</a></li>
                <li><a href="#">Anime Mới Cập Nhật</a></li>
                <li><a href="#">Lịch Chiếu Anime</a></li>
            </ul>
        </div>
        <script>
            function search_by_name(value) {
                var xhttp;
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        var obj = JSON.parse(this.responseText);
                        for (var item in obj) {
                             document.getElementById("search-box").innerHTML = item.aniName;
                        }
                    }
                };
                xhttp.open("GET", "<%=request.getContextPath()%>/tim-kiem?animename=" + value, true);
                xhttp.send();
            }
        </script> 
    </body>
</html>
