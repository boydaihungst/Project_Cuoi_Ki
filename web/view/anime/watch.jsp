<%@page import="model.Source"%>
<%@page import="model.Account"%>
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
            int epNum = 0;
            int epSrc = 0;
            try {
                epNum = Integer.parseInt(request.getParameter("epnum"));
            } catch (NumberFormatException e) {
                epNum = 1;//default ep number
            }
            try {
                epSrc = Integer.parseInt(request.getParameter("epsrc"));
            } catch (NumberFormatException e) {
            }
            Account account = (Account) session.getAttribute("account");
            Anime a = (Anime) request.getAttribute("anime");
            Map<Source, ArrayList<Episode>> allEpBySrc
                    = (Map<Source, ArrayList<Episode>>) request.getAttribute("list_ep_by_src");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= a.getAniName()%> - xem phim</title>
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
                .list-group a:hover{
                    cursor: pointer;    
                }
                .notification-wrap h5{
                    padding-top: 10px;
                    color:#ff9900
                }
                .video-wrap,#light-btn{
                    position: relative;
                    /*z-index:1002;*/
                }
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
                .vjs-custom-waiting .vjs-loading-spinner
                {
                    z-index: 9999;
                    display: block;
                }
                .video-js.vjs-custom-waiting .vjs-loading-spinner:before,
                .video-js.vjs-custom-waiting .vjs-loading-spinner:after
                {
                    /* I just copied the same animation as in the default css file */
                    -webkit-animation: vjs-spinner-spin 1.1s cubic-bezier(0.6, 0.2, 0, 0.8) infinite, vjs-spinner-fade 1.1s linear infinite;
                    animation: vjs-spinner-spin 1.1s cubic-bezier(0.6, 0.2, 0, 0.8) infinite, vjs-spinner-fade 1.1s linear infinite;
                }
            </style>
        </head>
        <body>
            <!--facebook comment -->
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
                <div id="body-container" class="container" style="display: block;">
                    <!--titile-->
                    <div class="col-sm-12 text-center">
                        <h2 class="title-anime">
                            <a href="<%= request.getContextPath()%>/anime/view?aniid=<%= a.getAniId()%>"><%= a.getAniName()%></a>
                    </h2>
                </div>
                <!--video player-->
                <div class="row">
                    <div class="col-sm-12 video-wrap-root">
                        <div id="player" class="video-wrap">
                            <video id="video" class="video-js vjs-default-skin" data-setup='{"controls": true,"preload": "auto", "autoplay": true, "fluid":true}'>
                            </video>
                        </div>
                    </div>
                </div>
                <script src="https://vjs.zencdn.net/7.0.3/video.js"></script>
                <script src="<%= request.getContextPath()%>/js/videojs-resolution-switcher.js"></script>
                <script src="<%= request.getContextPath()%>/js/Youtube.min.js"></script>
                <script>
                //danh sach preload
                var preload = [];
                //danh sach full tap + src
                var list_ep = [];
                //lock khi có source load thành công + không bị lỗi
                var loaded = false;
                var currentEpNum = <%= epNum%>;
                var currentSrc = <%= epSrc <= 0 ? null : epSrc%>;
                var currentAniId = <%= a.getAniId()%>;
                //load tap + source da xem lan cuoi 
                if (typeof (Storage) !== "undefined") {
                    var last_click_ep = localStorage.getItem("last_click_ep" + currentAniId);
                    var last_click_src = localStorage.getItem("last_click_src" + currentAniId);
                    //set tap + source da xem lan cuoi khi load trang
                    window.onbeforeunload = function (e) {
                        localStorage.setItem("last_click_ep" + currentAniId, currentEpNum);
                        localStorage.setItem("last_click_src" + currentAniId, currentSrc);
                    };
                    if (!window.location.search.includes("epnum")) {    //change tập hiện tại + src hiện tại để preload tự động load đúng tập + src
                        if (last_click_ep != null) {    //khi chỉ có số tập
                            currentEpNum = last_click_ep;
                            if (last_click_src != null) {   //khi có cả số tập và source id
                                currentSrc = last_click_src;
                            }
                        }
                    }
                }
                //change ep 
                //epNum (int): số tập
                //srcId (int): source id
                //aniId (int): anime id
                function changeEp(epNum, srcId, aniId) {
                    currentEpNum = epNum;
                    currentSrc = srcId;
                    window.location.href = "<%= request.getContextPath()%>/anime/watch?aniid=<%= a.getAniId()%>&epnum=" + epNum + "&epsrc=" + srcId;
                }
                ;
                var player = videojs('video', {
                    controls: true,
                    preload: 'auto',
                    autoplay: true,
                    plugins: {
                        videoJsResolutionSwitcher: {
                            default: 'high',
                            dynamicLabel: true
                        }
                    }
                });
                </script>
                <!--external controller-->
                <div class="row">
                    <div class="col-sm-12 external-control-wrap ">
                        <div class="list-group">
                            <a id="report-btn" class="list-group-item btn-danger text-center" data-trigger="hover" data-toggle="popover" data-placement="top" data-content="">
                                <i class="fa fa-exclamation-triangle"></i>
                                <span >Báo lỗi</span>
                            </a>
                            <a id="prev-btn" class="list-group-item text-center" >
                                <i class="fa fa-mail-reply"></i>
                                <span>Tập trước</span>
                            </a>
                            <a id="reload-btn" class="list-group-item text-center" >
                                <i class="fa fa-refresh"></i>
                                <span>Reload</span>
                            </a>
                            <a id="next-btn" class=" list-group-item text-center" >
                                <i class="fa fa-mail-forward"></i>
                                <span>Tập sau</span>
                            </a>
                            <a id="light-btn" class="list-group-item text-center" >
                                <i class="fa fa-lightbulb-o"></i>
                                <span>Tắt đèn</span>
                            </a>
                            <a id="bookmark-btn" class="list-group-item text-center" data-trigger="hover" data-toggle="popover" data-placement="top" data-content="">
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
                                    <p>Nếu xem anime gặp lỗi 404 vui lòng sử dụng chức năng <span style="color: #33cc00">Báo lỗi</span> ở bên trên để báo lại lỗi mà bạn gặp nhé ^^!.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--list ep chooser-->
                <div class="row">
                    <% for (Map.Entry<Source, ArrayList<Episode>> ep : allEpBySrc.entrySet()) {
                            Source key = ep.getKey();
                            ArrayList<Episode> eps = ep.getValue();

                    %>
                    <!--title-->
                    <div class="col-sm-10 col-md-offset-1">
                        <h5 class="sever-title">Server <%= key.getSourceName()%></h5>
                        <!--ep list-->
                        <div class="row ep-list-wrap ">
                            <% for (Episode e : eps) {
                                    //thêm field cho preload 
                                    if (e.getEpNumber() == epNum) {%>
                            <script>
                                preload.push({
                                    epNum: <%= e.getEpNumber()%>,
                                    srcId: <%= e.getSource().getSourceId()%>,
                                    aniId: <%= e.getAniId()%>
                                });
                            </script>
                            <% }%>
                            <script>
                                // add full playlist
                                list_ep.push({
                                    epNum: <%= e.getEpNumber()%>,
                                    srcId: <%= e.getSource().getSourceId()%>,
                                    aniId: <%= e.getAniId()%>
                                });
                            </script>
                            <a href="#player" class="ep-btn"  onclick="setTimeout(function () {
                                        changeEp(<%= e.getEpNumber()%>,<%= e.getSource().getSourceId()%>, <%= e.getAniId()%>);
                                    }, 800)"><%= e.getEpNumber()%></a>
                            <%}%>
                        </div>
                    </div>
                    <%}%>
                </div>
                <div class="row">
                    <div class="col-sm-10 col-md-offset-1">
                        <div class="fb-comments" data-href="http://localhost:8080<%= request.getContextPath()%>/anime/watch?aniid=<%= a.getAniId()%>" order_by="time" colorscheme="dark" data-width="100%" data-numposts="5"></div>
                    </div>
                </div>
            </div>
            <div class="container-fluid footer">
                <jsp:include page="/templates/footer.jsp"></jsp:include>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                subscribeCheck(<%= a.getAniId()%>);
        <% if (account != null) { %>
                $('#report-btn').popover({content: 'Nhấn vào đây để báo lỗi', animation: true});
                $("#report-btn").click(function () {
                    send_report();
                });
        <%} else {%>
                $('#report-btn').popover({content: 'Bạn phải đăng nhập để báo lỗi', animation: true});
        <%}%>

                //setting function button
                $('#prev-btn').click(function () {
                    prev();
                });
                $('#next-btn').click(function () {
                    next();
                });
                $('#reload-btn').click(function () {
                    reload();
                });
                $('#light-btn').click(function () {
                    lightoff();
                });
                //setting video player
                player.on('dblclick', function () {
                    if (player.isFullscreen()) {
                        player.exitFullscreen();
                        console.log("exit fullscreen");
                    } else {
                        player.requestFullscreen();
                        console.log("fullscreen");
                    }
                });
                var ct; //int current time của video player khi bị dính error
                var count = 0;  //dùng đếm số lượng src đã get direct link
                var notFound404;    //vòng lặp để check 404
                var needLoadLeng = 0;
                console.log(currentSrc);
                if (<%=request.getParameter("epsrc")%> == null && currentSrc == null) { //preload xem server nào ngon nhất ->load trong tat ca cac sourceID
                    for (var i in preload) {
                        needLoadLeng = preload.length;
                        console.log("load multi source");
                        if (loaded == false) {
                            preloadSrc(false, preload[i].epNum, preload[i].srcId, preload[i].aniId);
                        }
                    }
                } else {
                    for (var i in preload) {
                        if (preload[i].srcId == currentSrc) {  //preload xem server nào ngon nhất ->load trong tat ca cac sourceID//bo loaded == false vi chi load den 1 link
                            console.log("load single source");
                            needLoadLeng++;
                            preloadSrc(true, preload[i].epNum, preload[i].srcId, preload[i].aniId);
                        }
                    }
                }
                notFound404 = setInterval(function () {
                    if (loaded == false && player.readyState() == 0 && count == needLoadLeng) {
                        player.error({code: 404}); // throw exception khi k co tap nao load
                        clearInterval(notFound404);
                    }
                }, 2000);
                //error handler
                player.on("error", function (e) {
                    //==0 khi k load duoc bat ki src nao, code == 2 là khi connect internet mất thì k reload lại src hiện tại
                    if (player.readyState() != 0 && player.error().code === 2) {
                        return;
                    }
                    //play error video kho lỗi 404 -> mình tự thêm mã 404
                    if (player.readyState() == 0 && player.error().code === 404) {
                        player.updateSrc([{src: "<%= request.getContextPath()%>/img/error-video.mp4",
                                type: "video/mp4",
                                label: ""}]);
                        player.play();

                    } else {    //khi lỗi decode thì sẽ load lại src và cho play lại + pass 1 giây để tránh lỗi
                        player.error(null);
                        ct = player.currentTime();
                        player.updateSrc([{src: player.currentSrc(),
                                type: "video/mp4",
                                label: ""}]);
                        player.play();
                    }
                });
                //khi mà lỗi bị vấp video thì sẽ reload và pass 1 giây để tránh lỗi
                player.on('play', function () {
                    clearInterval(notFound404);
                    if (ct > 0) {
                        player.currentTime(ct + 1);
                    }
                    ct = 0;
                });
                function send_report() {
                    $.ajax({
                        type: "GET",
                        url: "<%= request.getContextPath()%>/anime/report",
                        data: {epnum: currentEpNum, srcid: currentSrc, aniid: currentAniId},
                        success: function (response) {
                            $('#report-btn').data('bs.popover').options.content = "Bạn đã báo cáo thành công";
                            $(".popover-content").html('Bạn đã báo cáo thành công');
                            console.log("report sent ok");
                        }
                    });
                }
                ;
                function reload() {
                    window.location.reload();
                }
                ;

                function prev() {
                    var isThere = list_ep.some(function (obj) {
                        return obj.epNum == currentEpNum - 1 && obj.srcId == currentSrc && obj.aniId == currentAniId;
                    });
                    if (!isThere) {
                        console.log({epNum: currentEpNum - 1, srcId: currentSrc, aniId: currentAniId});
                        alert("Không có tập trước");
                        return;
                    } else {
                        changeEp(currentEpNum - 1, currentSrc, currentAniId);
                    }
                }
                ;
                function next() {
                    var isThere = list_ep.some(function (obj) {
                        return obj.epNum == currentEpNum + 1 && obj.srcId == currentSrc && obj.aniId == currentAniId;
                    });
                    if (!isThere) {
                        console.log({epNum: currentEpNum + 1, srcId: currentSrc, aniId: currentAniId});
                        alert("Không có tập sau");
                        return;
                    } else {
                        changeEp(currentEpNum + 1, currentSrc, currentAniId);
                    }
                }
                ;
                //tắt/bật đèn của ngô tất tố
                function lightoff() {
                    if ($('.overlay').css('display') == 'none') {
                        console.log("light on");
                        $('.video-wrap').css({'zIndex': '99'});
                        $('.overlay').css({'zIndex': '99', 'display': 'inline-block'});
                        $('#light-btn').css({'zIndex': '99', 'background-color': '#fc6'});
                    } else {
                        console.log("light off");
                        $('.video-wrap').css({'zIndex': '1'});
                        $('.overlay').css({'zIndex': '99', 'display': 'none'});
                        $('#light-btn').css({'zIndex': 'auto', 'background-color': 'transparent'});
                    }
                }
                ;
                //hàm get src from servlet:
                //hasSrcTarget (boolean): true: get theo src nhất định || false: get nhiều src -> tăng biến đếm count => check count để kiểm tra tất cả các link đều 404 -> trigger mediaerror code 404
                //epNum (int): số tập
                //srcId (int): source id
                //aniId (int): anime id
                function preloadSrc(hasSrcTarget, epNum, srcId, aniId) {
                    var result = [];
                    $.ajax({
                        async: true,
                        type: "GET",
                        data: {epnum: epNum, srcid: srcId, aniid: aniId}
                        ,
                        url: "<%= request.getContextPath()%>/get-link",
                        success: function (response) {

                            console.log(response);
                            if (loaded == true)
                                return;
                            if (response == 'false') {
                                count++;
                                //truong hop chi 1 minh chi dinh
//                                if (hasSrcTarget == true) {
//                                    player.error({code: 404}); //trigger video bao loi
//                                }
                                return;
                            } else {
                                var json = JSON.parse(response.replace('\/', '/'));

                                if (json.sources == null || json.sources.length == 0) {
                                    count++;
                                    //truong hop chi 1 minh chi dinh
//                                    if (hasSrcTarget == true) {
//                                        player.error({code: 404}); //trigger video bao loi
//                                    }
                                    return;
                                }
                                for (var i in json.sources) {
                                    var directLink = json.sources[i].file;
                                    var type = json.sources[i].type;
                                    var label = json.sources[i].label;
                                    if (directLink === undefined) {
                                        directLink = json.sources.file;
                                        type = "video/mp4";
                                        label = "HD";
                                    } else if (type.includes("video") == false) {
                                        type = "video/" + type;
                                    }
//                                    console.log(type);
                                    if (label == "Unknow") {
                                        label = "HD";
                                    }
                                    result.push({
                                        src: directLink,
                                        type: type,
                                        label: label
                                    });
                                }
                                console.log("source added: OK");
                                console.log(directLink);
                                player.updateSrc(result);
                                currentEpNum = epNum;
                                currentSrc = srcId;
                                loaded = true;
                            }
                        }
                    });
                }
                ;
            });

    </script>
</body>
</html>
