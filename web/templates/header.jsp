<%-- 
    Document   : header
    Created on : Jun 25, 2018, 11:47:27 AM
    Author     : DrAgOn
--%>

<%@page import="model.Account"%>
<%@page import="model.Gender"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            ArrayList<Gender> cats = (ArrayList<Gender>) request.getAttribute("cats");

            Account account = (Account) session.getAttribute("account");
            
           String[] alphabet ={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
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
                background: springgreen; 
            }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: chartreuse; 
            }
            body{
                min-height: 100%;
                background-color: black;
                color: white;

            }
            a{
                text-decoration: none !important;
                color:white;
            }
            a:hover, a:focus,button:active,button:focus{
                outline: none !important;
            }
            .container-body{
                background: url('<%= request.getContextPath()%>/img/background.jpg') fixed no-repeat center !important;
                margin: auto;
                width: 100%;
            }
            .top-row{
                    min-height: 1080px
                }
            .row{
                margin: 0;
                padding:0;
            }
            .container-body>.container-fluid{

            }
            .container-body>.container-fluid,.container-body>.container{
                display: flex;
                justify-content: center; 
                background-color: black;
                /*margin-bottom: 20px;*/
                padding:0;
            }
            .header{
                margin-bottom: 20px;
                z-index:1500;
            }
            .navbar-brand{
                padding:0;
            }
            .anime-type-drop-box{
                border:1px solid springgreen;
                border-top:none;
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
            .dropdown:hover>.dropdown-menu
            ,.dropdown:focus>.dropdown-menu{
                display: block;
                /*margin-top: 0;*/
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
                z-index: 2000;
                width: 100%;
                border-bottom: 1px chartreuse solid;  
                display: flex;
                justify-content: center;

            }
            span.glyphicon{
                padding-right: 5px;
            }
            .navbar-collapse{
                padding-top: 53px;
            }
            .login-form{
                display:none;
                border: 1px chartreuse solid; 
                z-index:1003;
                position: fixed;
                top:200px;
                padding: 15px 25px 25px;
                width: 350px;
                /*width:0;*/
                background-color: black;

            }
            .login-form>.btn-close{
                background: url("<%= request.getContextPath()%>/img/close.png") no-repeat left center  !important;
                width: 20px;
                height: 20px;
                position: absolute;
                top:-10px;
                right: -10px;
                z-index:3000;
            }
            .login-form input{
                padding:15px ;
                color:black;
                outline:none;
                width: 100%;
                height: 30px;
                border-radius: 5px;
                margin-bottom: 10px;
            }
            .login-form button{
                width: 40%;
            }
            .login-form>.title{
                margin-top: 10px;
                margin-bottom: 15px;
                font-size: 22px;
            }
            .login-form>#respond{
                display: none;
                color:red;
            }
            .login-form>#respond2{
                display: none;
                color:red;
            }
            .search-result-box{
                position: fixed;
                top: 45px;
                margin-left: 10px;
                padding-right: 10px;
                padding-top: 0px;
                width: 400px;
                max-height: 480px;
                height: auto;
                border: 1px chartreuse solid;
                background: black;
                opacity: 0.9;
                overflow: auto;
                display:none;
            }
            .search-result-box .item-icon{
                padding:0 !important;
                width: auto !important;
            }
            .search-item{
                float:left;
                width: 100%;
                margin: 5px !important;
                border-bottom: 1px navy solid;
            }
            .search-item:hover,.search-item:focus{
                color:white !important;
                box-shadow:0px 0px 10px 5px chartreuse;
            }
            .search-result-box .item-title{
                padding-left:10px;
                color: chartreuse;
            }
            .search-result-box .item-content{
                padding-left:10px;
                color: oldlace;
                max-height: 82px;
                min-height: 82px;
                overflow: hidden;
                text-overflow:hidden;
            }
            .search-result-box .row-item-content{
                overflow: hidden;
            }
            .img-icon{
                width: 100%;
                height: 100%;
            }
            .item-border-right{
                position: relative;
                width: 100px;
                height: 100px;
                overflow: hidden;
            }
            /*center big button videojs css*/
            .vjs-default-skin .vjs-big-play-button {
                height: 1.5em;
                width: 1.5em;
                border-radius: 50%;
                left: 50%;
                top: 50%;
                margin-left: -0.75em;
                margin-top: -0.75em;
            }
            .vjs-tech { object-fit: cover; }
            .video-wrap-root{
                padding:0;
            }
            .video-wrap{
                width: 100%;
                border: 1px solid darkslategrey;
            }
            .overlay{
                display:none;
                position: fixed;
                top: 0; 
                left: 0;
                right: 0;
                bottom: 0;
                background-color: rgba(0,0,0,0.8);
                z-index:99;
                width: 100%;
                height: 100%;
            }
            .overflow-ellipsis{
                height: 100%;
                position: absolute;
            }
            .overflow-ellipsis p{
                display: -webkit-box;
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
                /*                    line-height: normal;*/
            }
        </style>
    </head>
    <body>
        <div class="navbar-container">
            <div class=" container" >
                <button type="button" class="glyphicon glyphicon-th navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                </button>
                <div class="navbar-brand"><a href="<%= request.getContextPath()%>/homepage"><img width="auto" height="53px" src="<%= request.getContextPath()%>/img/logo.png" alt="logo" />ANIME</a></div>
                <!--search form-->
                <form class="navbar-form navbar-left search-form" action="">
                    <div class="search-result-box ">

                    </div>
                    <div class="input-group">
                        <input id="search-input" type="text" class="form-control" placeholder="Tìm kiếm" onkeyup="search_by_name(this.value)"/>
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
                    <li id="reg-btn"><a href="" onclick="return false;"><span class="glyphicon glyphicon-log-in"></span>Đăng kí</a></li>
                </ul>
                <%} else {%>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="" onclick="return false;"><span class="glyphicon glyphicon-user"></span><%= account.getUsername()%></a></li>
                    <li><a href="" onclick="return false;"><span class="glyphicon glyphicon-list-alt"></span>Anime đang theo dõi</a></li>
                    <li id="logout-btn"><a href="" onclick="return false;"><span class="glyphicon glyphicon-log-out"></span>Đăng xuất</a></li>
                </ul>
                <%}%>
            </div>
            <!--login-->
            <form class="text-center login-form" id="login-form"  action="" onsubmit="return false;" method="post">
                <a href="" onclick="return false;" class="btn-close" ></a>
                <div class="title">Đăng nhập</div>
                <input name="username" type="text" placeholder="Tên đăng nhập"/>
                <input name="password" type="password" placeholder="Mật khẩu"/>
                <div id="respond">Sai tài khoản hoặc mật khẩu</div>
                <button type="submit" class="btn btn-primary">Đăng nhập</button>
                <button type="button" class="btn btn-primary" onclick="$('#reg-btn').click()">Đăng kí</button>
            </form>
            <!--dang ki from-->
            <form class="text-center login-form" id="reg-form"  action="" onsubmit="return false;" method="post">
                <a href="" onclick="return false;" class="btn-close" ></a>
                <div class="title">Đăng kí</div>
                <input name="username" type="text" placeholder="Tên đăng nhập"/>
                <input name="password" type="password" placeholder="Mật khẩu"/>
                <input name="password2" type="password" placeholder="Nhập lại mật khẩu"/>
                <input name="email" type="email" placeholder="Email"/>
                <p id="respond2"></p>
                <button type="submit" class="btn btn-primary ">Đăng kí</button>
                <button type="button" class="btn btn-primary "  onclick="$('#login-btn').click()">Đăng nhập</button>

            </form>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li >
                    <a class="nav-title" href="<%= request.getContextPath()%>/homepage" >Trang chủ</a>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle nav-title" href="<%= request.getContextPath() %>/Filter?">Anime theo năm
                    </a>
                    <ul class="dropdown-menu anime-type-drop-box">
                        <li>
                            <div class="row">
                                <% for (int i = 2010; i < 2019; i++) {%>
                                <a class="col-sm-3" href="<%= request.getContextPath() %>/Filter?year=<%= i %>">Năm <%=i%></a>
                                <%}
                                %>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle nav-title" href="<%= request.getContextPath() %>/Filter?">Thể loại</a>
                    <ul class="dropdown-menu anime-type-drop-box">
                        <li>
                            <div class="row">
                                <% for (int i = 0; i < cats.size(); i++) {%>
                                <a class="col-sm-3" href="<%= request.getContextPath() %>/Filter?gender=<%=cats.get(i).getCatId()%>"><span class="glyphicon glyphicon-triangle-right"></span><span><%= cats.get(i).getCatName()%></span></a>
                                        <%}
                                        %>
                            </div>
                        </li>
                    </ul>
                </li>
                <li><a href="<%= request.getContextPath() %>/Filter?type=1">Anime Blu-ray</a></li>
                <li class="dropdown"><a href="<%= request.getContextPath()%>/anime-collection?filter=alphabet">Danh sách anime</a>
                    <ul class="dropdown-menu anime-type-drop-box">
                        <li>
                            <div class="row">
                                <% for (int i = 0; i < alphabet.length; i++) {%>
                                <a class="col-sm-3" href="<%= request.getContextPath()%>/anime-collection?filter=alphabet&keyword=<%= alphabet[i] %>"><span class="glyphicon glyphicon-triangle-right"></span><span><%= alphabet[i]%></span></a>
                                        <%}
                                        %>
                            </div>
                        </li>
                    </ul></li>
                <li><a href="<%= request.getContextPath()%>/anime-collection?filter=update-recent">Anime mới cập nhật</a></li>
                <li><a href="#">Lịch Chiếu anime</a></li>
            </ul>
        </div>

        <script>
            $(document).ready(function () {

                //overflow-multiline-ellipsis
                lineclamp();
                $(window).resize(function () {
                    lineclamp();
                });
                //slider
                $(".owl-carousel").owlCarousel({
                    lazyLoad: true,
                    lazyLoadEager: 1,
                    loop: true,
                    margin: 0,
                    autoplay: true,
                    autoplayTimeout: 3000,
                    autoplayHoverPause: true,
                    nav: false,
                    dots: false,
                    items: 1,
                    center: true,
                    autoHeight: false
                });
                //login
                $("#login-form>.btn-close").click(function () {
                    show_login_box();
//                    $('.overlay').hide();
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
                //reg
                $("#reg-form>.btn-close").click(function () {
                    show_reg_box();
//                    $('.overlay').hide();
                });
                $("#reg-btn").click(function () {
                    show_reg_box();
                });
                $("#reg-form>input").change(function () {
                    $("#reg-form>#respond2").hide();
                });
                $("#reg-form").submit(function () {
                    reg();
                });
                //hide search box khi ma click out
                $(document.body).click(function (e) {
                    var $box = $('#search-input');
                    if (e.target.id !== 'search-input' && !$.contains($box[0], e.target))
                        $(".search-result-box").hide();
                });
            });
            //main funtion
            function show_login_box() {
                if ($('#reg-form').css('display') !== 'none') {
                    $("#reg-form").toggle("fast");
                }
                $('.overlay').show();
                $("#login-form>#respond").hide();
                $("#login-form").toggle("fast", function () {
                    if ($('#reg-form').css('display') == 'none' && $('#login-form').css('display') == 'none') {
                        $('.overlay').hide();
                        //show khi ma nut tat den dang bat o trang xem video
                        if ($('#light-btn').length != 0 && $('#light-btn').css('zIndex') != 'auto') {
                            $('.overlay').show();
                        }
                    }
                });
            }
            ;
            function show_reg_box() {
                if ($('#login-form').css('display') !== 'none') {
                    $("#login-form").toggle("fast");
                }
                $('.overlay').show();
                $("#reg-form>#respond2").hide();
                $("#reg-form").toggle("fast", function () {
                    if ($('#reg-form').css('display') == 'none' && $('#login-form').css('display') == 'none') {
                        $('.overlay').hide();
                        //show khi ma nut tat den dang bat o trang xem video
                        if ($('#light-btn').length != 0 && $('#light-btn').css('zIndex') != 'auto') {
                            $('.overlay').show();
                        }
                    }
                });

            }
            ;
            //search = ajax
            function search_by_name(value) {
                if (value.length < 2) {
                    $(".search-result-box").hide();
                    return false;
                } else {
                    if ($(".search-result-box").css('display') === 'none') {
                        $(".search-result-box").show();
                    }
                }
                var xhttp;
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        var obj = JSON.parse(this.responseText);
                        $(".search-result-box").empty();
                        if (obj.length <= 0) {
                            $(".search-result-box").text("Không tìm thấy");
                            return true;
                        }
                        var i;
                        for (i in obj) {
                            console.log(obj[i]);
                            $(".search-result-box").append('<a class=" search-item"  href="<%= request.getContextPath()%>/anime/view?aniid=' + obj[i].aniId + '">' +
                                    '<div class="col-sm-4 item-icon">' +
                                    ' <div class="item-border-right item">' +
                                    '<img class="img-responsive img-icon img-icon-left"  src="<%= request.getContextPath()%>/' + obj[i].picture + '" alt="icon-item"/>' +
                                    ' </div>' +
                                    '</div>' +
                                    '<div class="col-sm-8 ">' +
                                    '<div class="row">' +
                                    ' <div class="col-sm-12 item-title">' + obj[i].aniName + '</div>' +
                                    '</div>' +
                                    '<div class="row row-item-content">' +
                                    '<div class="col-sm-12 item-content">' +
                                    obj[i].desc +
                                    '</div>' +
                                    '</div>' +
                                    '</div>' +
                                    '</a>');
                        }
                    }
                };
                xhttp.open("GET", "<%=request.getContextPath()%>/tim-kiem?animename=" + value, true);
                xhttp.send();
            }
            ;
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
            }
            ;
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
            }
            ;
            function reg() {
                var un, pw, pw2, em;
                un = document.getElementsByName('username')[1].value;
                pw = document.getElementsByName('password')[1].value;
                pw2 = document.getElementsByName('password2')[0].value;
                em = document.getElementsByName('email')[0].value;
                var xhttp;
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        if (this.responseText !== "true") {
                            $("#respond2").empty();
                            $("#respond2").append(this.responseText);
                            $("#respond2").show();
                        } else {
                            window.location.reload();
                        }
                    }
                };
                xhttp.open("POST", "<%=request.getContextPath()%>/tai-khoan/reg", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("username=" + un + "&password=" + pw + "&password2=" + pw2 + "&email=" + em);
            }
            ;
            //overflow-multiline-ellipsis
            function lineclamp() {
                $('.overflow-ellipsis').each(function (index) {
                    var p = $(this).children('p');
                    var lineheight = parseFloat(p.css('line-height'));
                    var parentheight = $(this).height();
                    var calc = parseInt(parentheight / lineheight);
                    p.css({"-webkit-line-clamp": "" + calc + ""});
                });
            }
        </script> 
    </body>
</html>
