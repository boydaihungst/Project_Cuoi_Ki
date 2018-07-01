<%-- 
    Document   : header
    Created on : Jun 25, 2018, 11:47:27 AM
    Author     : DrAgOn
--%>

<%@page import="model.Account"%>
<%@page import="model.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            ArrayList<Categories> cats = (ArrayList<Categories>) request.getAttribute("cats");

            Account account = (Account) session.getAttribute("account");
        %>
        <style>
            /* width */
            ::-webkit-scrollbar {
                width:5px;
            }

            /* Track */
            ::-webkit-scrollbar-track {
                background: black; 
            }

            /* Handle */
            ::-webkit-scrollbar-thumb {
                background: #66ccff; 
            }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background:#66a3ff; 
            }
            body{
                background-color: black;
            }
            a{
                text-decoration: none;
                color:white;
            }
            .container-body>.container-fluid,.container-body>.container{
                display: flex;
                justify-content: center;
                background-color: black;
                margin-bottom: 20px;
                padding:0;
            }
            .navbar-brand{
                padding:0;
            }
            .anime-type-drop-box{
                min-width:600px;
            }
            .anime-type-drop-box .col-sm-3{
                white-space: nowrap;
                overflow: visible;
                padding:8px;
                padding-left: 20px;
                text-align: left;
                font-size: 14px;
            }
            .anime-type-drop-box .col-sm-3 .glyphicon-play{
                font-size: 10px;
            }

            .anime-type-drop-box .col-sm-3:focus
            ,.anime-type-drop-box .col-sm-3:hover{
                background-color: white;
                color: black;
            }
            .anime-type-drop-box .col-sm-3 a {
                font-size: 13px;
                width: 100%;
            }
            .anime-year-drop-box{
                padding:8px 0px;
                text-align: center;
            }
            .nav{
                font-size: 16px;
            }
            .dropdown-menu{
                background-color: black !important;
                opacity: 0.95;
            }
            .navbar-toggle{
                font-size: 20px;
            }
            .search-form{
                margin-left:160px;
                width: 40%;
            }
            .search-form .input-group{
                padding-left:20px;
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
            .btn{
                outline:none;
            }
            .search-form .input-group .input-group-btn .btn-default{
                color: aliceblue !important;
                background-color: transparent;
                border:none;
                padding:0;
            }
            .navbar-container{
                position: fixed;
                background-color: black;
                z-index: 200;
                width: 100%;
                border-bottom: 1px #43a6df solid;  
                display: flex;
                justify-content: center;

            }
            span.glyphicon{
                padding-right: 5px;
            }
            .navbar-collapse{
                padding-top: 53px;
            }
            #login-form{
                display:none;
                border: 1px #43a6df solid; 
                z-index:10;
                position: fixed;
                top:200px;
                padding: 15px 25px 25px;
                width: 350px;
                /*width:0;*/
                background-color: black;

            }
            #login-form>.btn-close{
                background: url("img/close.png") no-repeat left center  !important;
                width: 20px;
                height: 20px;
                position: absolute;
                top:-10px;
                right: -10px;
                z-index:9999;
            }
            #login-form input{
                padding:15px ;
                color:black;
                outline:none;
                width: 100%;
                height: 30px;
                border-radius: 5px;
                margin-bottom: 10px;
            }
            #login-form button{
                width: 40%;
            }
            #login-form>.title{
                margin-top: 10px;
                margin-bottom: 15px;
                font-size: 22px;
            }
            #login-form>#respond{
                display: none;
                color:red;
            }
        </style>
    </head>
    <body>
        <div class="navbar-container">
            <div class=" container" >
                <button type="button" class="glyphicon glyphicon-th navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                </button>
                <div class="navbar-brand"><a href="#"><img width="auto" height="53px" src="img/logo.png" alt="logo" />ANIME</a></div>

                <form class="navbar-form navbar-left search-form" action="">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Tìm kiếm" onkeyup="search_by_name(this.value)"/>
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit">
                                <i class="glyphicon glyphicon-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
                <% if (account == null) { %>
                <ul class="nav navbar-nav navbar-right">
                    <li id="login-btn"><a href="" onclick="return false;"><span class="glyphicon glyphicon-user"></span>Đăng nhập</a></li>
                    <li><a href="" onclick="return false;"><span class="glyphicon glyphicon-log-in"></span>Đăng kí</a></li>
                </ul>
                <%} else {%>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="" onclick="return false;"><span class="glyphicon glyphicon-user"></span><%= account.getUsername()%></a></li>
                    <li><a href="" onclick="return false;"><span class="glyphicon glyphicon-list-alt"></span>Anime đã lưu</a></li>
                    <li id="logout-btn"><a href="" onclick="return false;"><span class="glyphicon glyphicon-log-out"></span>Đăng xuất</a></li>
                </ul>
                <%}%>
            </div>
            <!--login-->
            <form class="text-center" id="login-form"  action="" onsubmit="return false;" method="post">
                <a href="" onclick="return false;" class="btn-close" ></a>
                <div class="title">Đăng nhập</div>
                <input name="username" type="text" placeholder="Tên đăng nhập"/>
                <input name="password" type="password" placeholder="Mật khẩu"/>
                <div id="respond">Sai tên tài khoản hoặc mật khẩu</div>
                <button type="submit" class="btn btn-primary login-btn">Đăng nhập</button>
                <button class="btn btn-primary ">Đăng kí</button>
            </form>
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
                                <a class="col-sm-3" href="#"><span class="glyphicon glyphicon-triangle-right"></span><span><%= cats.get(i).getCatName()%></span></a>
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
            //show/close login form
            $(document).ready(function () {
                $("#login-form>.btn-close").click(function () {
                    show_login_box();
                });
                $("#login-btn").click(function () {
                    show_login_box();
                });
                $("#login-form>input").change(function () {
                    $("#login-form>#respond").hide();
                });
                $("#logout-btn").click(function () {
                    logout();
                });
                $("#login-form").submit(function () {
                    login();
                });
                $("#login-form>.login-btn").click(function () {
                    login();
                });
            });
            function show_login_box() {
                if ($('#body-container').css('opacity') != 1) {
                    $('#body-container').css('opacity', '1');
                } else {
                    $('#body-container').css('opacity', '0.1');
                }
                $("#login-form").toggle("fast");
            };
            //search = ajax
            function search_by_name(value) {
                
                var xhttp;
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        
                            console.log(this.responseText);
                        var obj = JSON.parse(this.responseText);
                        for (var item in obj) {
                           // document.getElementById("search-box").innerHTML = item.aniName;
                        }
                    }
                };
                xhttp.open("GET", "<%=request.getContextPath()%>/tim-kiem?animename=" + value, true);
                xhttp.send();
            };

            function login() {
                var un, pw;
                un = document.getElementsByName('username')[0].value;
                pw = document.getElementsByName('password')[0].value;
                var xhttp;
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        console.log(this.responseText);
                        if (this.responseText === "false") {
                            $(document).ready(function () {
                                $("#login-form>#respond").show();
                            });
                        } else {
                            window.location.reload();
                        }
                    }
                };
                xhttp.open("POST", "<%=request.getContextPath()%>/tai-khoan/auth", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("username=" + un + "&password=" + pw);
            };
            function logout() {
                var xhttp;
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        console.log(this.responseText);
                        window.location.reload();
                    }
                };
                xhttp.open("GET", "<%=request.getContextPath()%>/tai-khoan/auth", true);
                xhttp.send();
            };
        </script> 
    </body>
</html>
