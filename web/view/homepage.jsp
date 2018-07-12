<%-- 
   Document   : homepage
   Created on : Jun 24, 2018, 8:46:46 PM
   Author     : DrAgOn
--%>

<%@page import="Utils.TimeUtils"%>
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
        <jsp:include page="/templates/libs.jsp"></jsp:include>
            <style>

                a{
                    transition: color 0.25s;
                    -webkit-transition: color 0.25s; /* Safari 3.1 to 6.0 */
                }
                ul.nav-tabs a{
                    width: 100%;
                    text-align: center;
                }

                .tab-title{
                    font-size: 16px;
                }

                .left-side,.right-side{
                    margin: 0;
                    padding:0;
                    width: auto;
                }

                .item-border{
                    position: relative;
                    width:175px !important;
                    height: 237px !important;
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
                .left-side .preview-item:hover .top-caption,.left-side .preview-item:hover .type-caption{
                    display: none;
                }
                .type-caption{
                    margin:0;
                    padding:0;
                    font-size:14px;
                    opacity: 1;
                    position: absolute;
                    bottom: 9%;
                    right: 0%;
                    width: auto;
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
                .type-caption p{
                    background: green;
                    padding: 2px 5px;
                }
                .bottom-caption p, .top-caption p,.top-caption p{
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
                .img-icon-right{
                    height: auto !important;
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
                    box-shadow: 0 0 10px 2px chartreuse;
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
                    color:chartreuse;
                    border-bottom: 1px solid chartreuse;

                }
                .item-info-content{
                    height: 160px;
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
                    color: chartreuse;
                    white-space: nowrap;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    margin:0;
                }
                .content-anime-right{
                    padding-left: 10px;
                    font-size:12px;
                    width: 150px;
                    height: 85px;
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
                    padding:0;
                    padding-top: 15px;
                    float:right;
                }
                .title-container{
                    margin: 20px 0px !important;
                    color: chartreuse;
                    border-bottom: 1.5px solid chartreuse!important;
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
                /*background-color: chartreuse;*/
                .nav-tabs>.active{
                    border-bottom: 2.5px solid chartreuse!important;
                }
                .nav-tabs>li{
                    border-bottom: 2.5px solid white;
                    padding:0;
                }
                .title-fanpage-right{
                    padding:0;
                    width: auto;
                    color: chartreuse;
                    display: block;
                    margin-left: 15px;
                    margin-top: 10px;
                    padding-bottom: 12px;
                    margin-bottom: 10px;
                    border-bottom: 2.5px solid chartreuse!important;
                }
                .left-title-anime{
                    padding-bottom: 0;
                    /*padding-top: 10px;*/
                }
                .top-row{
                    padding-bottom: 15px !important;
                    padding-top: 15px !important;
                }
                .text-content-anime-right{
                    height: 100% !important;
                    width: 150px;
                }
            </style>
        </head>
        <body>
            <div class="container-body">
                <div class="container-fluid header">
                <jsp:include page="/templates/header.jsp"></jsp:include>
                </div>
                <div class="container" >
                    <div class="overlay"></div>
                    <div class="row top-row" >
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
                                    <%if (m < 2) {%>
                                    <span class="title-tab-left col-sm-10"><%="ANIME MÙA "%> <%= TimeUtils.seasonEngtoVn(en.getKey())%></span> <%if (en.getValue().size() > 24) {%><a href="<%= request.getContextPath()%>/anime-collection?filter=<%= en.getKey().replaceAll(" ", "-")%>" class="col-sm-2 view-more text-right">Xem Thêm >></a><%}%>
                                    <%} else {%>
                                    <span class="title-tab-left col-sm-10"><%= "ANIME MỚI CẬP NHẬT"%></span> <%if (en.getValue().size() > 24) {%><a href="<%= request.getContextPath()%>/anime-collection?filter=update-recent" class="col-sm-2 view-more text-right">Xem Thêm >></a><%}%>
                                    <%}%>
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
                                                    <p><%= en.getValue().get(i).getEpsRel() == 0 ? "???" : en.getValue().get(i).getEpsRel()%>/<%= en.getValue().get(i).getEpsMax() == 0 ? "???" : en.getValue().get(i).getEpsMax()%> Tập</p>
                                                </div>
                                                <img data-src="<%= request.getContextPath() + "/" + en.getValue().get(i).getPicture()%>" alt="" class="img-responsive img-icon lazyload">
                                                <div class="type-caption text-center ">
                                                    <p><%= en.getValue().get(i).getType().getTypeNameShort()%></p>
                                                </div>
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
                            <span class="title-tab-left col-sm-10">ANIME DÀI TẬP</span><a href="<%= request.getContextPath()%>/anime-collection?filter=most-eps" class=" col-sm-2 view-more text-right">Xem Thêm >></a>
                        </div>
                        <div class="row">
                            <%for (int j = 0; j < anime_most_ep.size(); j++) {
                                    if (j >= 4) {
                                        break;
                                    }
                            %>
                            <div  class="col-sm-3 preview-item">
                                <a href="<%= request.getContextPath()%>/anime/view?aniid=<%= anime_most_ep.get(j).getAniId()%>">
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
                                        <img data-src="<%= request.getContextPath() + "/" + anime_most_ep.get(j).getPicture()%>" class="img-responsive img-icon lazyload">
                                        <noscript> 
                                        <img src="<%= request.getContextPath() + "/" + anime_most_ep.get(j).getPicture()%>" class="img-responsive img-icon ">
                                        </noscript>
                                        <div class="type-caption text-center ">
                                                    <p><%= anime_most_ep.get(j).getType().getTypeNameShort()%></p>
                                                </div>
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
                            <div class="col-sm-12 fb-page fb_iframe_widget" data-href="https://www.facebook.com/Anime-Online-2027409394253651" data-width="300" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true" fb-xfbml-state="rendered" ><span style="vertical-align: bottom; width: 300px; height: 196px;"><iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FAnime-Online-2027409394253651&tabs=timeline&width=330&height=200&small_header=false&adapt_container_width=false&hide_cover=false&show_facepile=true&appId" width="330" height="200" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe></span></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 title-fanpage-right">Anime được xem nhiều trong ngày</div>
                        </div>
                        <%for (int j = 0; j < anime_most_clicked.size(); j++) {%>
                        <div class="row right-container">
                            <div class="col-sm-4">
                                <div  class="preview-item">
                                    <a href="<%= request.getContextPath()%>/anime/view?aniid=<%= anime_most_clicked.get(j).getAniId()%>">
                                        <div class="item-border-right item">
                                            <div class="top-caption top-caption-right text-center ">
                                                <p><%= anime_most_clicked.get(j).getEpsRel() == 0 ? "???" : anime_most_clicked.get(j).getEpsRel()%>/<%= anime_most_clicked.get(j).getEpsMax() == 0 ? "???" : anime_most_clicked.get(j).getEpsMax()%> Tap</p>
                                            </div>
                                            <img data-src="<%= request.getContextPath() + "/" + anime_most_clicked.get(j).getPicture()%>" alt="" class="img-responsive img-icon img-icon-right lazyload">
                                            <noscript> 
                                            <img data-src="<%= request.getContextPath() + "/" + anime_most_clicked.get(j).getPicture()%>" alt="" class="img-responsive img-icon img-icon-right lazyload">
                                            </noscript>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-8">  
                                <div class="row">
                                    <div class="col-sm-12 preview-item left-title-anime">
                                        <div class="title-anime-right">
                                            <a href="<%= request.getContextPath()%>/anime/view?aniid=<%= anime_most_clicked.get(j).getAniId()%>">
                                                <p><%= anime_most_clicked.get(j).getAniName()%></p>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 " style="padding-left: 0px;">
                                        <div class="content-anime-right">
                                            <a href="<%= request.getContextPath()%>/anime/view?aniid=<%= anime_most_clicked.get(j).getAniId()%>">
                                                <div class="overflow-ellipsis text-content-anime-right">
                                                    <p><%= anime_most_clicked.get(j).getDesc()%></p>
                                                </div>
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
            <div class="container-fluid footer">
                <jsp:include page="/templates/footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>
