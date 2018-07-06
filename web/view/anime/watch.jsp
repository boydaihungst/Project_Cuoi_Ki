<%@page import="model.Anime"%>
<%@page import="model.Episode"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            Anime a = (Anime) request.getAttribute("anime");
            Map<String, ArrayList<Episode>> allEpBySrc
                    = (Map<String, ArrayList<Episode>>) request.getAttribute("list_ep_by_src");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ten anime</title>
        <jsp:include page="/templates/libs.jsp"></jsp:include>
            <style>
                .ep-btn{
                    background-color:#2b2b2b;
                    color: #fff;
                    width:40px;
                    display:inline-block;
                    /*height: width;*/
                    border:none !important;
                    padding: 5px 10px;
                    margin-bottom: 10px;
                }
                .ep-list-wrap a:visited{
                    color: #bbb !important;
                }
                .ep-btn:hover{
                    background-color: #171717;
                    color: #fff !important;
                }
                .ep-list-wrap{
                    max-height: 160px;
                    overflow-y:scroll;
                    background: #171717;
                }
                .sever-title,.title-anime{
                    color:springgreen;
                }
                /*horizon list*/
                .list-group-item {
                    border-radius: 0px !important;
                    display: inline-block;
                    background-color: transparent; 
                    border: none;
                }
                .list-group-item:hover{
                    background-color: #777 !important; 
                    color:springgreen !important;
                }
                .external-control-wrap{
                    margin-top: 20px;
                }
                .ep-btn,.list-group,.external-control-wrap{
                    text-align: center;
                }
                .list-group,.notification-wrap{
                    background-color: #171717 !important;
                }
                .notification-wrap h5{
                    padding-top: 10px;
                    color:#ff9900
                }
            </style>
        </head>
        <body>
            <div id="fb-root"></div>
            <script>(function (d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id))
                        return;
                    js = d.createElement(s);
                    js.id = id;
                    js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.0';
                    fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));</script>
            <div class="container-body">
                <div class="container-fluid header">
                <jsp:include page="/templates/header.jsp"></jsp:include>
                </div>
                <div id="body-container" class="container" style="display: block;">
                    <!--titile-->
                    <div class="col-sm-12 text-center">
                        <h2 class="title-anime">
                        <%= a.getAniName()%>
                    </h2>
                </div>
                <!--video player-->
                <div class="row">
                    <div class="col-sm-12 video-wrap-root">
                        <div id="trailer" class="video-wrap">
                            <video id="video" class="video-js vjs-default-skin" data-setup='{"controls": true, "autoplay": true, "preload": "auto","fluid":true}' >
                            </video>
                        </div>
                    </div>
                </div>
                <!--external controller-->
                <div class="row">
                    <div class="col-sm-12 external-control-wrap ">
                        <div class="list-group">
                            <a href="#" class="list-group-item btn-danger text-center">
                                <i class="fa fa-exclamation-triangle"></i>
                                <span>Báo lỗi</span>
                            </a>
                            <a href="#" class="list-group-item btn-info text-center">
                                <i class="fa fa-mail-reply"></i>
                                <span>Tập trước</span>
                            </a>
                            <a href="#" class="list-group-item btn-success text-center">
                                <i class="fa fa-refresh"></i>
                                <span>Reload</span>
                            </a>
                            <a href="#" class=" list-group-item btn-info text-center">
                                <i class="fa fa-mail-forward"></i>
                                <span>Tập sau</span>
                            </a>
                            <a href="#" class="list-group-item btn-info text-center">
                                <i class="fa fa-lightbulb-o"></i>
                                <span>Tắt đèn</span>
                            </a>
                            <a href="#" class="list-group-item btn-info text-center">
                                <i class="fa fa-star-o"></i>
                                <span>Theo dõi</span>
                            </a>
                        </div>
                    </div>
                </div>
                <!--khu vuc thong bao chung-->
                <div class="row">
                    <div class="col-sm-12 text-center ">
                        <div class="notification-wrap">
                            <h5>Thông báo chung</h5>
                            <div class="row">
                                <div class="col-sm-10 col-md-offset-1">
                                    <p>Web không hỗ trợ trình duyệt IE 8</p>
                                    <p>Nếu xem anime gặp lỗi gì vui lòng sử dụng chức năng <a href="#" style="color: #33cc00">Báo lỗi</a> ở bên trên để báo lại lỗi mà bạn gặp nhé ^^!.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--list ep chooser-->
                <div class="row">
                    <% for (Map.Entry<String, ArrayList<Episode>> ep : allEpBySrc.entrySet()) {
                            String key = ep.getKey();
                            ArrayList<Episode> eps = ep.getValue();
                    %>
                    <!--title-->
                    <div class="col-sm-10 col-md-offset-1">
                        <h5 class="sever-title">Server <%= key%></h5>
                        <!--ep list-->
                        <div class="row ep-list-wrap ">
                            <% for (Episode e : eps) {%>
                            <a href="<%= e.getUrl()%>" class="ep-btn"><%= e.getEpNumber()%></a>
                            <%}%>
                        </div>
                    </div>
                    <%}%>
                </div>
                <div class="row">
                    <div class="col-sm-10 col-md-offset-1">
                        <div class="fb-comments" data-href="http://localhost:8080/Project_Cuoi_Ki/anime/watch?aniid=3" data-colorscheme="dark" data-width="100%" data-numposts="10"></div>
                    </div>
                </div>
            </div>
            <script src="https://vjs.zencdn.net/7.0.3/video.js"></script>
            <script src="<%= request.getContextPath()%>/js/videojs-resolution-switcher.js"></script>
            <script src="<%= request.getContextPath()%>/js/Youtube.min.js"></script>
            <script>
                            //            player.updateSrc([
                            //                {
                            //                    src: 'https://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_30mb.mp4',
                            //                    type: 'video/mp4',
                            //                    label: '720'
                            //                },
                            //                {
                            //                    src: 'https://www.sample-videos.com/video/mp4/480/big_buck_bunny_480p_30mb.mp4',
                            //                    type: 'video/mp4',
                            //                    label: '480'
                            //                }
                            //            ]);
            </script>
            <script>
                var player = videojs('video', {
                    controls: true,
                    plugins: {
                        videoJsResolutionSwitcher: {
                            default: 'high',
                            dynamicLabel: true
                        }
                    }
                });
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        var json = JSON.parse(this.responseText.replace("\/", "/"));
                        json = json.sources[0];
                        var directLink = json.file;
                        console.log(directLink);
                        var type = json.type;
                        //                        $("#video").append('<source src="' + directLink + '" type="video/' + type + '" label="HD" res="720" />');
                        player.updateSrc([
                            {
                                src: '<%= request.getContextPath()%>/img/demo.mp4',
                                type: 'video/mp4',
                                label: '720'
                            }
                        ]);
                    }
                };
                xmlhttp.open("GET", "https://api.123share.top/getlink/?link=" + 'https://www.youtube.com/watch?v=JGwWNGJdvx8', true);
                xmlhttp.setRequestHeader('Content-Type', 'application/json');
                xmlhttp.send();
            </script>
            <script>
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
