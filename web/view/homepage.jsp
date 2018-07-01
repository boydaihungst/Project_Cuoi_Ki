<%-- 
    Document   : homepage
    Created on : Jun 24, 2018, 8:46:46 PM
    Author     : DrAgOn
--%>

<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.Anime"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            Map<String, ArrayList<Anime>> tabs_anime = (LinkedHashMap<String, ArrayList<Anime>>) request.getAttribute("3_tabs_anime");
            ArrayList<Anime> anime_most_ep = (ArrayList<Anime>) request.getAttribute("anime_most_ep");
            ArrayList<Anime> anime_most_clicked = (ArrayList<Anime>) request.getAttribute("anime_most_clicked");
        %>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Anime Online</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="shortcut icon" href="img/favicon.ico">
        <style>
            body{
                color: white;
            }
            a{
                text-decoration: none !important;
                transition: color 0.25s;
                -webkit-transition: color 0.25s; /* Safari 3.1 to 6.0 */
            }
            body a:hover{
                text-decoration: none;
            }
            ul.nav-tabs a{
                width: 100%;
                text-align: center;
            }
            .container-body{
                margin: auto;
                width: 100%;
                background-color: #171717 !important;
            }

            .tab-title{
                font-size: 16px;
            }
            .left-side .preview-item:hover .top-caption{
                display: none;
            }
            .left-side,.right-side{
                margin: 0;
                padding:0;
                width: auto;
            }
            .row{
                margin: 0;
                padding:0;
            }
            .item-border{
                position: relative;
                width: 155px !important;
                height: 217px !important;
            }

            .item-border-right{
                position: relative;
                width: 100px;
                height: 100px;
                overflow: hidden;
            }
            .bottom-caption {
                margin:0;
                padding:0;
                font-size:15px;
                background: black;
                opacity: 0.9;
                position: absolute;
                bottom: 0;
                left: 0;
                width: 100%;
            }
            .top-caption{
                margin:0;
                padding:0;
                font-size:14px;
                opacity: 0.8;
                position: absolute;
                top: 3.5%;
                left: 5%;
                width: auto;
            }
            .bottom-caption p{
                padding: 5px 5px;
            }
            .top-caption p{
                background: red;
                padding: 2px 5px;
            }
            .bottom-caption p, .top-caption p{
                color:white;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
                margin:0;
            }
            .top-caption-right{
                opacity: 1;
                font-size:12px;
                top: 0%;
                left: 0%;
            }
            .top-caption-right p{
                background: green;
            }
            .img-icon{
                width: 100%;
                height: 100%;
            }
            .img-icon-right{
                height: auto;
            }
            .preview-item{
                width: auto;
                padding:10px;
            }
            /*item info box*/
            .item-info{
                top:-99999px;
                opacity: 0;
                margin: 0;
                padding: 10px;
                box-shadow: 0 0 10px 2px #43a6df;
                position: absolute;
                width: 250px;
                height: 200px;
                background-color: rgba(0,0,0,.93);
                z-index: 100;
                transition: opacity 0.5s;
                -webkit-transition: opacity 0.5s; /* Safari 3.1 to 6.0 */
            }
            .item-info-box-left{
                right:-255px !important;
            }
            .item-info-box-right{
                left:-255px !important;
            }
            .item-info-title{
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
                font-size: 14px;
                color:#43a6df;
                border-bottom: 1px solid #43a6df;

            }
            .item-info-content{
                height: 155px;
                padding-top: 10px;
                font-size: 12px;
                color: #c5c5c5;
                text-overflow: ellipsis;
                overflow: hidden;
            }
            .left-side .preview-item:hover .item img{
                box-shadow: 0 0 10px 2px white;
            }
            .left-side .item-border{
                border:1px solid slategrey;
            }
            .left-side .preview-item:hover .item-info{
                top:4%;
                opacity: 1;
            }
            .left-side .preview-item .item-info:hover{
                top:-99999px;
                opacity: 0;
            }
            /*=======*/
            /*phan ben phai ten anime thu nho*/
            .title-anime-right{
                margin:0;
                padding:0;
                font-size:14px;
                width: 150px; 
            }
            .title-anime-right p{
                color: #43a6df;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                margin:0;
            }
            .content-anime-right{
                margin:0;
                padding:0;
                font-size:12px;
                width: 150px;
            }
            .content-anime-right p{
                color: white;
                white-space: normal;
                overflow: visible;
                text-overflow: ellipsis;
                margin:0;
            }
            .right-container:hover .content-anime-right p{
                white-space: normal;
                margin:0;
            }
            .view-more{
                font-size: 12px;
                padding-top: 15px;
                float:right;
            }
            .title-container{
                margin-top:20px;
                margin-bottom: 15px;
                color: #43a6df;
                border-bottom: 1.5px solid #43a6df!important;
            }
            .title-tab-left{
                font-size: 24px;
                padding:0;
                margin:0;
            }
            .nav-tabs{
                margin-bottom: 15px;
                border:none;
            }
            /*background-color: #43a6df;*/
            .nav-tabs>.active{
                border-bottom: 2.5px solid #43a6df!important;
            }
            .nav-tabs>li{
                border-bottom: 2.5px solid white;
                padding:0;
            }
            .title-fanpage-right{
                padding:0;
                width: auto;
                color: #43a6df;
                display: block;
                margin-left: 15px;
                margin-top: 10px;
                padding-bottom: 12px;
                margin-bottom: 10px;
                border-bottom: 2.5px solid #43a6df!important;
            }
            .left-title-anime{
                padding-bottom: 0;
                padding-top: 13px;
            }
            .col-center{
                margin:0 auto;
            }
        </style>
    </head>
    <body>
        <div class="container-body">
            <div class="container-fluid">
                <jsp:include page="/templates/header.jsp"></jsp:include>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 left-side">
                            <ul class="nav nav-tabs">
                            <li class="col-sm-4 active"><a data-toggle="tab" href="#menu0">Anime mùa mới</a></li>

                            <li class="col-sm-4"><a data-toggle="tab" href="#menu1">Anime mùa trước</a></li>
                            <li class="col-sm-4"><a data-toggle="tab" href="#menu2">Anime mới cập nhật</a></li>
                        </ul>
                        <div class="tab-content">
                            <% int m = -1;%>
                            <% for (Map.Entry<String, ArrayList<Anime>> en : tabs_anime.entrySet()) {
                            %>
                            <div id="menu<%=++m%>" class="tab-pane fade in <%= m == 0 ? "active" : ""%>">
                                <div class="row title-container ">
                                    <span class="title-tab-left col-sm-10"><%= en.getKey() %></span> <%if (en.getValue().size() > 24) {%><a href="#" class="view-more col-sm-2">Xem Thêm >></a><%}%>
                                </div>
                                <% for (int i = 0; i < 24; i++) {%>
                                <div class="row">
                                    <%for (int j = 0; j < 4; j++) {
                                            if (i >= en.getValue().size()) {
                                                break;
                                            }
                                    %>
                                    <!--item-->
                                    <div class="col-sm-3 preview-item">
                                        <a href="<%= request.getContextPath()%>/anime/view?aniid=<%= en.getValue().get(i).getAniId()%>">
                                            <div class="item-info <%= j >= 2 ? "item-info-box-right" : "item-info-box-left"%>">
                                                <div class="item-info-title">
                                                    <%= en.getValue().get(i).getAniName()%>
                                                </div>
                                                <div class="item-info-content">
                                                    <%= en.getValue().get(i).getDesc()%>
                                                </div>
                                            </div>
                                            <div class="item-border item">
                                                <div class="top-caption text-center ">
                                                    <p><%= en.getValue().get(i).getEpsRel() == 0 ? "???" : en.getValue().get(i).getEpsRel()%>/<%= en.getValue().get(i).getEpsMax() == 0 ? "???" : en.getValue().get(i).getEpsMax()%> Tap</p>
                                                </div>
                                                <img src="<%= request.getContextPath() + "/" + en.getValue().get(i).getPicture()%>" alt="" class="img-responsive img-icon ">
                                                <div class="bottom-caption text-center ">
                                                    <p><%= en.getValue().get(i).getAniName()%></p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <% i++;
                                        }%>
                                </div>
                                <!--het dong-->
                                <%   }
                                %>
                            </div>
                            <% }
                            %>
                        </div>
                        <div class="row title-container ">
                            <span class="title-tab-left col-sm-10">ANIME DÀI TẬP</span><a href="#" class="view-more col-sm-2">Xem Thêm >></a>
                        </div>
                        <!--<span class="title-container">ANIME DAI TAP</span> <a href="#" class="view-more col-sm-2">Xem Thêm >></a>-->
                        <div class="row">
                            <%for (int j = 0; j < 4; j++) {
                            %>
                            <div  class="col-sm-3 preview-item">
                                <a href="#">
                                    <div class="item-info <%= j >= 2 ? "item-info-box-right" : "item-info-box-left"%>">

                                        <div class="item-info-title">
                                            <%= anime_most_ep.get(j).getAniName()%>
                                        </div>
                                        <div class="item-info-content">
                                            <%= anime_most_ep.get(j).getDesc()%>
                                        </div>
                                    </div>
                                    <div class="item-border item">
                                        <div class="top-caption text-center ">
                                            <p><%= anime_most_ep.get(j).getEpsRel() == 0 ? "???" : anime_most_ep.get(j).getEpsRel()%>/<%= anime_most_ep.get(j).getEpsMax() == 0 ? "???" : anime_most_ep.get(j).getEpsMax()%> Tap</p>
                                        </div>
                                        <img src="<%= request.getContextPath() + "/" + anime_most_ep.get(j).getPicture()%>" alt="" class="img-responsive img-icon ">
                                        <div class="bottom-caption text-center ">
                                            <p><%= anime_most_ep.get(j).getAniName()%></p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <%}%>
                        </div>
                    </div>
                    <div  class="col-sm-4 right-side">
                        <div class="row">
                            <div class="col-sm-12 title-fanpage-right">Fanpage của website</div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 fb-page fb_iframe_widget" data-href="https://www.facebook.com/Ani4u2/" data-width="300" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="adapt_container_width=true&amp;app_id=448777685319550&amp;container_width=0&amp;hide_cover=false&amp;href=https%3A%2F%2Fwww.facebook.com%2FAni4u2%2F&amp;locale=vi_VN&amp;sdk=joey&amp;show_facepile=true&amp;small_header=false&amp;width=300"><span style="vertical-align: bottom; width: 300px; height: 196px;"><iframe name="f1602c80990609c" width="300px" height="1000px" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" title="fb:page Facebook Social Plugin" src="https://www.facebook.com/v2.10/plugins/page.php?adapt_container_width=true&amp;app_id=448777685319550&amp;channel=http%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2FxaOI6zd9HW9.js%3Fversion%3D42%23cb%3Df3193b8ef4b7ed%26domain%3Dani4u.org%26origin%3Dhttp%253A%252F%252Fani4u.org%252Ff1dff02becd9b64%26relation%3Dparent.parent&amp;container_width=0&amp;hide_cover=false&amp;href=https%3A%2F%2Fwww.facebook.com%2FAni4u2%2F&amp;locale=vi_VN&amp;sdk=joey&amp;show_facepile=true&amp;small_header=false&amp;width=300" style="border: none; visibility: visible; width: 300px; height: 196px;" class=""></iframe></span></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 title-fanpage-right">Anime được xem nhiều trong ngày</div>
                        </div>
                        <%for (int j = 0; j < anime_most_clicked.size(); j++) {%>
                        <div class="row right-container">
                            <div class="col-sm-4">
                                <div  class="preview-item">
                                    <a href="#">
                                        <div class="item-border-right item">
                                            <div class="top-caption top-caption-right text-center ">
                                                <p><%= anime_most_clicked.get(j).getEpsRel() == 0 ? "???" : anime_most_clicked.get(j).getEpsRel()%>/<%= anime_most_clicked.get(j).getEpsMax() == 0 ? "???" : anime_most_clicked.get(j).getEpsMax()%> Tap</p>
                                            </div>
                                            <img src="<%= request.getContextPath() + "/" + anime_most_clicked.get(j).getPicture()%>" alt="" class="img-responsive img-icon img-icon-right">
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-8">  
                                <div class="row">
                                    <div class="col-sm-12 preview-item left-title-anime">
                                        <div class="title-anime-right">
                                            <a href="#">
                                                <p><%= anime_most_clicked.get(j).getAniName()%></p>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 ">
                                        <div class="content-anime-right ">
                                            <a href="#">
                                                <p><%= anime_most_clicked.get(j).getDesc().length() >= 100 ? anime_most_clicked.get(j).getDesc().substring(0, 100) + "..." : anime_most_clicked.get(j).getDesc()%></p>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>                
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
