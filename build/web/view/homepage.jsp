<%-- 
    Document   : homepage
    Created on : Jun 24, 2018, 8:46:46 PM
    Author     : DrAgOn
--%>

<%@page import="model.Anime"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            ArrayList<Anime> leftAnimes = (ArrayList<Anime>) request.getAttribute("left_side_animes");
            ArrayList<Anime> downLeftAnimes = (ArrayList<Anime>) request.getAttribute("down_left_side_animes");
            ArrayList<Anime> rightAnimes = (ArrayList<Anime>) request.getAttribute("right_side_animes");
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
        <style>
            a{
                text-decoration: none !important;
            }
            body a:hover{
                text-decoration: none;
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
                width: 155px;
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
                opacity: 0.8;
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
                padding:5px;
            }
            /*phan ben phai ten anime thu nho*/
            .title-anime-right{
                margin:0;
                padding:0;
                font-size:14px;
                width: 150px; 
            }
            .title-anime-right p{
                color: captiontext;
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
                color: black;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                margin:0;
            }
            .content-anime-right p:hover{
                color: black;
                white-space: normal;
                overflow: visible;
                margin:0;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-8 left-side">
                    <% for (int i = 0; i < leftAnimes.size(); i++) {%>
                    <div class="row">
                        <%for (int j = 0; j < 4; j++) {
                                if (i >= leftAnimes.size()) {
                                    break;
                                }
                        %>
                        <div  class="col-sm-3 preview-item">
                            <a href="#">
                                <div class="item-border item">
                                    <div class="top-caption text-center ">
                                        <p><%= leftAnimes.get(i).getEpsRel() == 0 ? "???" : leftAnimes.get(i).getEpsRel()%>/<%= leftAnimes.get(i).getEpsMax() == 0 ? "???" : leftAnimes.get(i).getEpsMax()%> Tap</p>
                                    </div>
                                    <img src="<%= request.getContextPath() + "/" + leftAnimes.get(i).getPicture()%>" alt="" class="img-responsive img-icon ">
                                    <div class="bottom-caption text-center ">
                                        <p><%= leftAnimes.get(i).getAniName()%></p>
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
                    <h3>ANIME DAI TAP</h3>
                    <div class="row">
                        <%for (int j = 0; j < 4; j++) {
                        %>
                        <div  class="col-sm-3 preview-item">
                            <a href="#">
                                <div class="item-border item">
                                    <div class="top-caption text-center ">
                                        <p><%= downLeftAnimes.get(j).getEpsRel() == 0 ? "???" : downLeftAnimes.get(j).getEpsRel()%>/<%= downLeftAnimes.get(j).getEpsMax() == 0 ? "???" : downLeftAnimes.get(j).getEpsMax()%> Tap</p>
                                    </div>
                                    <img src="<%= request.getContextPath() + "/" + downLeftAnimes.get(j).getPicture()%>" alt="" class="img-responsive img-icon ">
                                    <div class="bottom-caption text-center ">
                                        <p><%= downLeftAnimes.get(j).getAniName()%></p>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <%}%>
                    </div>
                </div>
                <div  class="col-sm-4 right-side">
                    <div>
                        <div class="fb-page fb_iframe_widget" data-href="https://www.facebook.com/Ani4u2/" data-width="300" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true" fb-xfbml-state="rendered" fb-iframe-plugin-query="adapt_container_width=true&amp;app_id=448777685319550&amp;container_width=0&amp;hide_cover=false&amp;href=https%3A%2F%2Fwww.facebook.com%2FAni4u2%2F&amp;locale=vi_VN&amp;sdk=joey&amp;show_facepile=true&amp;small_header=false&amp;width=300"><span style="vertical-align: bottom; width: 300px; height: 196px;"><iframe name="f1602c80990609c" width="300px" height="1000px" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" allow="encrypted-media" title="fb:page Facebook Social Plugin" src="https://www.facebook.com/v2.10/plugins/page.php?adapt_container_width=true&amp;app_id=448777685319550&amp;channel=http%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2FxaOI6zd9HW9.js%3Fversion%3D42%23cb%3Df3193b8ef4b7ed%26domain%3Dani4u.org%26origin%3Dhttp%253A%252F%252Fani4u.org%252Ff1dff02becd9b64%26relation%3Dparent.parent&amp;container_width=0&amp;hide_cover=false&amp;href=https%3A%2F%2Fwww.facebook.com%2FAni4u2%2F&amp;locale=vi_VN&amp;sdk=joey&amp;show_facepile=true&amp;small_header=false&amp;width=300" style="border: none; visibility: visible; width: 300px; height: 196px;" class=""></iframe></span></div>
                    </div>
                    <%for (int j = 0; j < 4; j++) {%>
                    <div class="row">
                        <div class="col-sm-4">
                            <div  class="preview-item">
                                <a href="#">
                                    <div class="item-border-right item">
                                        <div class="top-caption top-caption-right text-center ">
                                            <p><%= downLeftAnimes.get(j).getEpsRel() == 0 ? "???" : downLeftAnimes.get(j).getEpsRel()%>/<%= downLeftAnimes.get(j).getEpsMax() == 0 ? "???" : downLeftAnimes.get(j).getEpsMax()%> Tap</p>
                                        </div>
                                        <img src="<%= request.getContextPath() + "/" + downLeftAnimes.get(j).getPicture()%>" alt="" class="img-responsive img-icon img-icon-right">
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-sm-8">  
                            <div class="row">
                                <div class="col-sm-12 preview-item">
                                    <div class="title-anime-right">
                                        <a href="#">
                                            <p><%= downLeftAnimes.get(j).getAniName()%></p>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 preview-item">
                                    <div class="content-anime-right ">
                                        <a href="#">
                                            <p><%= downLeftAnimes.get(j).getDesc().length() >=100?downLeftAnimes.get(j).getDesc().substring(0, 100)+"...":downLeftAnimes.get(j).getDesc() %></p>
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
    </body>

</html>
