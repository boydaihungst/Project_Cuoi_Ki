<%-- 
    Document   : homepage
    Created on : Jun 24, 2018, 8:46:46 PM
    Author     : DrAgOn
--%>

<%@page import="Utils.Pagger"%>
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
            String filter = request.getParameter("filter");
            int pageIndex = (Integer) request.getAttribute("pageIndex");
            int pageSize = (Integer) request.getAttribute("pageSize");
            int total = (Integer) request.getAttribute("total");
            String title = (String) request.getAttribute("title");
            ArrayList<Anime> animes = (ArrayList<Anime>) request.getAttribute("animes");
            ArrayList<Anime> anime_most_clicked = (ArrayList<Anime>) request.getAttribute("anime_most_clicked");
        %>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Anime Online</title>
        <jsp:include page="/templates/libs.jsp"></jsp:include>
            <style>
                .container-body>.container{
                    display: block !important;
                }
                a{
                    transition: color 0.25s;
                    -webkit-transition: color 0.25s; /* Safari 3.1 to 6.0 */
                }
                p{
                    line-height: 1.6;
                }
                .left-side,.right-side{
                    margin: 0;
                }

                .item-border{
                    position: relative;
                    width: 200px !important;
                    height: 100% !important;
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

                .top-caption p{
                    color:white;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: nowrap;
                    margin:0;
                    background: red;
                    padding: 2px 5px;
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
                .left-side .ep-item:hover .preview-item .type-caption{
                    display: none;
                }
                 .type-caption{
                    margin:0;
                    padding:0;
                    font-size:14px;
                    opacity: 1;
                    position: absolute;
                    bottom: 0%;
                    right: 0%;
                    width: auto;
                }
                .type-caption p{
                    background: green;
                    padding: 2px 5px;
                }
                .img-icon-right{
                    height: auto !important;
                }
                .preview-item{
                    width: auto;
                    padding:15px;
                }
                .left-side .ep-item:hover{
                    box-shadow: 0 0 10px 2px white;
                }
                .left-side .ep-item a:hover{
                    color:currentColor;
                }
                .left-side .item-border{
                    border:1px solid slategrey;
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
                    margin:0;
                    padding:0;
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
                .title-container{
                    margin-top:20px !important;
                    margin-bottom: 35px !important;
                    color: chartreuse;
                    border-bottom: 1.5px solid chartreuse!important;
                }
                .title-tab-left{
                    font-size: 24px;
                    margin:0;
                }
                .title-fanpage-right{
                    padding:0;
                    width: auto;
                    color: chartreuse;
                    display: block;
                    margin-left: 15px;
                    margin-top: 20px;
                    padding-bottom: 12px;
                    margin-bottom: 10px;
                    border-bottom: 2.5px solid chartreuse!important;
                }
                .left-title-anime{
                    padding-bottom: 0;
                    padding-top: 13px;
                    color: chartreuse;
                }
                .left-content-anime .ep-info{
                    color: #cc3300  ;

                }
                .ep-item{
                    border: 1px solid darkgray;
                    height: 282px;
                    margin-bottom: 20px !important;
                }
                .left-info-anime{
                    height: 100%;
                    padding-right:0px !important;
                    width: 73% !important;
                }
                .ep-item .preview-item{
                    height: 100% !important;
                    padding:0px !important;
                }
                .top-row{
                    /*min-height: 3000px*/
                }
                .text-content-anime-right{
                    height: 100% !important;
                    width: 150px;
                }
                .pagger{
                    font-size: 16px;
                    display: inline-block;
                    /*float:left;*/
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    /*padding: 20px;*/
                    margin-left:15px;
                    color:black;
                    transition: background-color 0.25s cubic-bezier(0.4, 0, 0.57, 1.01);
                    -webkit-transition: background-color 0.25s  cubic-bezier(0.4, 0, 0.57, 1.01); /* Safari 3.1 to 6.0 */
                }
                .pagger:hover{
                    background-color: #33cc00;
                }
                .pagger-disabled:hover{
                    background-color: gray;
                }
                .pagger-disabled{
                    background-color: gray;
                }
            </style>
        </head>
        <body>
            <div class="container-body" >
                <div class="container-fluid header">
                <jsp:include page="/templates/header.jsp"></jsp:include>
                </div>
                <div id="body-container" class="container" >
                    <div class="overlay"></div>
                    <div class="row top-row">
                        <!--left side-->
                        <div class="col-sm-8 left-side">
                            <div class="row title-container ">
                                <span class="title-tab-left col-sm-12 text-center"><%= title%></span>
                        </div>
                        <% for (Anime a : animes) {%>
                        <div class="row ep-item">
                            <a href="<%= request.getContextPath()%>/anime/view?aniid=<%= a.getAniId()%>">
                                <!--preview picture-->
                                <div class="col-sm-4 preview-item">
                                    <div class="item-border item">
                                        <img data-src="<%= request.getContextPath() + "/" + a.getPicture()%>" alt="" class="img-responsive img-icon lazyload">
                                        <div class="type-caption text-center ">
                                            <p><%= a.getType().getTypeNameShort()%></p>
                                        </div>
                                    </div>

                                </div>
                                <!--title va content-->
                                <div class="col-sm-8 left-info-anime">
                                    <div class="left-title-anime">
                                        <h3><%= a.getAniName()%></h3>
                                    </div>
                                    <div class="left-content-anime">
                                        <p class="ep-info"><%= a.getEpsRel() == 0 ? "???" : a.getEpsRel()%>/<%= a.getEpsMax() == 0 ? "???" : a.getEpsMax()%> Tập</p>
                                        <div class="overflow-ellipsis" style=" height: 50% !important;">
                                            <p >Nội dung: <%= a.getDesc()%> </p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <%}%>
                        <div class="row" style="margin-bottom: 10px;">
                            <div class="col-sm-12 text-center">
                                <%=animes.size() >= 1 ? Pagger.generate(pageIndex, pageSize, total, "?filter=" + filter + "&page=", 2) : ""%>
                            </div>
                        </div>
                    </div>
                    <!--right side-->
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
                            <div class="col-sm-4" style="padding: 0px !important;height: 130px">
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
                            <div class="col-sm-8" style="padding: 0px !important;height: 130px">  
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
                                    <div class="col-sm-12 ">
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
