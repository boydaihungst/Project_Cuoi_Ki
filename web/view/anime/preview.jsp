<%-- 
    Document   : preview
    Created on : Jul 4, 2018, 2:40:40 PM
    Author     : DrAgOn
--%>

<%@page import="model.Account"%>
<%@page import="model.Gender"%>
<%@page import="Utils.TimeUtils"%>
<%@page import="model.Anime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="/templates/libs.jsp"></jsp:include>
        <%
            Anime a = (Anime) request.getAttribute("anime");
            Account account = (Account) session.getAttribute("account");
        %>
        <title><%= a.getAniName()%></title>
        <style>
            .info-full{
                margin-top: 10px !important;
            }
            .wallpaper>.col-sm-12, .row>.info-wrap-left,.row>.info-wrap-right{
                padding:0 !important;
            }
            .wallpaper{
                max-height: 658px !important;
                overflow: hidden !important;
            }
            .row>.info-wrap-right{
                /*height: 298px;*/
                background: #171717 url('<%= request.getContextPath()%>/img/green-girl-redirect.png') no-repeat;
                background-size:contain;
                background-position-x: 40px;
                /*background-position:left;*/
            }
            .row>.info-wrap-left{
                padding-left:20px  !important;
                padding-right:20px  !important;
                border-right: 3px solid chartreuse;
                /*box-shadow:0px 0px 10px 0px chartreuse;*/ 
            }
            .anime-content,.row>.info-wrap-left,.row>.info-wrap-right,.trailer-title{
                background-color: #171717 !important;
            }
            .anime-content,.trailer-title,.info-full{
                margin-top: 20px !important; 
            }
            .anime-content .anime-content-title, .trailer-title {
                padding-top: 10px;
                color:springgreen;
                border-bottom:1px currentColor solid;
            }
            .anime-content .panel{
                border:none;
                background-color: transparent !important;
            }
            .list-group>.list-group-item{
                background-color:transparent;
                border:none;
                padding-bottom: 0px;
            }
            .green-color{
                color:chartreuse ;
            }
            .wheat-color{
                color: wheat;
            }
            .anime-title{
                color:chartreuse;
            }
            .sub-title-link-color:hover,.sub-title-link-color{
                color:currentColor !important;
            }
            .sub-title-link-color:hover{
                text-decoration: underline !important;
            }
            .btn-wrap{
                position: absolute;
                left:40%;
                top:50%;
            }
            .btn-wrap> .btn{
                margin:5px;
            }
            .glyphicon-star{
                color:yellow !important;
            }
            .vjs-tech { object-fit: cover; }
            .video-wrap{
                width: 100%;
            }
            /*popover make up*/
            .popover-content{
                color:springgreen !important;
                background: #171717 !important;
                border-color: springgreen !important;
                border-radius:inherit;
            }
            .popover.top>.arrow:after{
                border-top-color: springgreen !important;
            }
            .popover{
                white-space: pre-wrap;
                padding:0;
                border:1px solid springgreen;
                border-radius: 20px !important
            }
        </style>
    </head>
    <body>
        <div id="fb-root"></div>
        <script>
            $(document).ready(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.0';
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
        <div class="container-body">
            <div class="overlay"></div>
            <div class="container-fluid header">
                <jsp:include page="/templates/header.jsp"></jsp:include>
                </div>
                <div class="container" style="display: block;">
                    <div class="row wallpaper">
                        <!--wallpaper-->
                        <div class="col-sm-12">
                            <div class="owl-carousel owl-theme">
                            <% for (String src : a.getWallpager()) {%>
                            <div class="item"><img class="img-responsive lazyload" data-src="<%= request.getContextPath()%>/<%= src%>" alt=""></div>
                                <% }
                                %>               
                        </div>
                    </div>
                </div>
                <div class="row info-full">
                    <!--phan hien thi thong tin chi tiet anime-->
                    <div class="col-sm-6 info-wrap-left">
                        <h2 class="anime-title text-center"><%= a.getAniName()%></h2>
                        <ul class="list-group">
                            <!--//gender-->
                            <li class="list-group-item wheat-color "><span class="green-color">Thể loại: </span>
                                <% for (int i = 0; i < a.getGender().size(); i++) {%>
                                <%if (i == a.getGender().size() - 1) {%>
                                <a class="sub-title-link-color" href="#"><%= a.getGender().get(i).getCatName()%></a>
                                <%  break;
                                    }%>
                                <a class="sub-title-link-color" href="#"><%= a.getGender().get(i).getCatName()%>,</a>
                                <%}
                                %>
                                <!--end-->
                            </li>
                            <li class="list-group-item wheat-color "><span  class="green-color">Loại phim: </span><a class="sub-title-link-color" href="#"><%= a.getType().getTypeName()%></a></li>

                            <li class="list-group-item wheat-color "><span  class="green-color">Số tập: </span><span href="#"><%= a.getEpsRel()%>/<%= a.getEpsMax()%> Tập</span></li>
                            <li class="list-group-item wheat-color "><span class="green-color">Lượt xem: </span><span href="#"><%= a.getTotalWatch()%></span></li>
                            <li class="list-group-item wheat-color "><span class="green-color">Năm phát sóng: </span><a class="sub-title-link-color" href="#"><%= TimeUtils.seasonEngtoVn(TimeUtils.getSeasonYearByDate(a.getReleaseTime()))%></a></li>
                            <li class="list-group-item wheat-color "><span class="green-color">Tình trạng: </span><a class="sub-title-link-color" href="#"><%= a.getAniStatus() == 1 ? "Hoàn thành" : (a.getAniStatus() == 0 ? "Sắp hoàn thành" : "Sắp phát hành")%></a></li>
                            <li class="list-group-item wheat-color "><span class="green-color">Số người theo dõi: </span><span  href="#"><%= a.getTotalSubscriber()%></span></li>
                        </ul>
                    </div>
                    <!--phan nut chuyen sang trang watch-->
                    <div class="col-sm-6 info-wrap-right">
                        <div class="btn-wrap text-center">
                            <button id="btn-watch" type="button" class="btn btn-success"><span class="glyphicon glyphicon-play-circle"></span>Xem phim</button>
                            <a href="#trailer" type="button" class="btn btn-info tag-effect"><span class="glyphicon glyphicon-film"></span>Xem Trailer</a><br>
                            <button id="bookmark-btn" type="button" class="btn btn-danger" data-trigger="hover" data-toggle="popover" data-placement="top" data-content=""><span class="glyphicon glyphicon-star-empty" ></span>Đánh dấu yêu thích</button>
                        </div>
                    </div>
                </div>
                <!--noi dung-->
                <div class="row anime-content">
                    <div class="col-sm-12">
                        <h4 class="anime-content-title text-center">Nội dung phim</h4>
                        <div class="panel panel-default">
                            <div class="panel-body"><%= a.getDesc()%></div>
                        </div>
                    </div>
                </div>
                <!--trailer player-->
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="trailer-title text-center">Trailer phim</h4>
                        <div id="trailer" class="video-wrap">
                            <video id="video" class="video-js vjs-default-skin" data-setup='{"controls": true, "autoplay": true, "preload": "auto","fluid":true}' >
                            </video>
                        </div>
                    </div>
                </div>
                <!--comment-->
                <div class="row" style="margin-bottom: 30px; margin-top: 15px">
                    <div class="col-sm-10 col-md-offset-1">
                        <div class="fb-comments" data-href="http://localhost:8080<%= request.getContextPath()%>/anime/watch?aniid=<%= a.getAniId()%>" order_by="time" colorscheme="dark" data-width="100%" data-numposts="5"></div>
                    </div>
                </div>
            </div>
            <div class="container-fluid footer">
                <jsp:include page="/templates/footer.jsp"></jsp:include>
                </div>
            </div>

            <script src="https://vjs.zencdn.net/7.0.3/video.js"></script>
            <script src="<%= request.getContextPath()%>/js/Youtube.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/videojs-resolution-switcher.js"></script>
        <script>
            $(document).ready(function () {
                subscribeCheck(<%= a.getAniId() %>);
                $('#btn-watch').click(function () {
                    window.location.href = "<%= request.getContextPath()%>/anime/watch?aniid=<%= a.getAniId()%>";
                            });
                            $('.info-wrap-right').css('height', ($('.info-wrap-left').css('height')));
                            $(window).resize(function () {
                                $('.info-wrap-right').css('height', ($('.info-wrap-left').css('height')));
                            });
                        });
        </script>
        <script>
            var player = videojs('video', {
                controls: true,
                techOrder: ["youtube"],
                sources: [{"type": "video/youtube", "src": "<%= a.getTrailer()%>"}],
                plugins: {
                    videoJsResolutionSwitcher: {
                        default: 'high',
                        dynamicLabel: true
                    }
                }
            });
            videojs('video').on('dblclick', function () {
                if (videojs('video').isFullscreen()) {
                    videojs('video').exitFullscreen();
                } else {
                    videojs('video').requestFullscreen();
                }
            });
        </script>

    </body>
</html>
