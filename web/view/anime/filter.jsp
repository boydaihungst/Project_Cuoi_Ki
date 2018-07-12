<%-- 
    Document   : search
    Created on : Jul 11, 2018, 12:48:38 AM
    Author     : DrAgOn
--%>

<%@page import="model.Type"%>
<%@page import="model.Gender"%>
<%@page import="Utils.Pagger"%>
<%@page import="model.Anime"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String filter = request.getQueryString();
            if (filter == null) {
                filter = "";
            } else {
                if (filter.contains("&page")) {
                    filter = filter.substring(0, filter.lastIndexOf("&page"));
                }
            }
            int pageIndex = (Integer) request.getAttribute("pageIndex");
            int pageSize = (Integer) request.getAttribute("pageSize");
            int total = (Integer) request.getAttribute("total");
            ArrayList<Gender> listgendersearch = (ArrayList<Gender>) request.getAttribute("listgendersearch");
            ArrayList<Gender> cats = (ArrayList<Gender>) request.getAttribute("cats");
            ArrayList<Type> types = (ArrayList<Type>) request.getAttribute("types");
            ArrayList<Anime> animes = (ArrayList<Anime>) request.getAttribute("animes");
//            System.out.println(animes.size());
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tìm kiếm theo yêu cầu</title>
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

                .text-content-anime-right{
                    height: 100% !important;
                    width: 150px;
                }
                .filter-form .dropdown 
                ,.filter-form .btn-submit-filter{
                    font-size: 18px;
                    padding: 0px 5px;
                    float:left;
                    display: inline-block;
                    height: 50px;
                }
                .filter-form .dropdown-menu{
                    padding-top: 0px;
                    margin-top:0px;
                    background-color: #191919  !important;
                    opacity: 1;
                }
                .filter-form .dropdown-menu .col-sm-3
                ,.filter-form .dropdown-menu .col-sm-12
                {
                    white-space: nowrap;
                    overflow: visible;
                    padding: 8px;
                    padding-left: 20px;
                    text-align: left;
                    font-size: 16px;
                } 
                .filter-form .dropdown-menu .col-sm-3:focus
                ,.filter-form .dropdown-menu .col-sm-3:hover
                ,.filter-form .dropdown-menu .col-sm-12:focus
                ,.filter-form .dropdown-menu .col-sm-12:hover
                {
                    background-color: white;
                    color: black;
                    cursor: pointer;
                }
                .filter-dropdown a{
                    -webkit-touch-callout: none; /* iOS Safari */
                    -webkit-user-select: none; /* Chrome/Safari/Opera */
                    -khtml-user-select: none; /* Konqueror */
                    -moz-user-select: none; /* Firefox */
                    -ms-user-select: none; /* Internet Explorer/Edge */

                }
                .filter-form button{
                    padding: 0;
                    font-size: inherit;
                    width: 100%;
                    height: 100%;
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
                        <div class="col-sm-12 left-side">
                            <div class="row title-container ">
                                <span class="title-tab-left col-sm-12 text-center">Vui lòng chọn mục cần tìm kiếm</span>
                            </div>
                            <div class="row filter-form">
                                <div class="col-sm-2 dropdown filter-dropdown">
                                    <button class="btn btn-default dropdown-toggle" type="button" id="statusMenu" >Tình Trạng
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu dropdown-menu-status" style="min-width: 180px;" role="menu" aria-labelledby="statusMenu">
                                        <li>
                                            <div class="row">
                                                <a class="col-sm-12"><i class="fa ${param.status == null?"fa-check-square-o":"fa-square-o"}" style="padding-right:5px"><input type="hidden" value=""/></i><span>Tất cả</span></a>
                                            <a class="col-sm-12"><i class="fa ${param.status =="0"?"fa-check-square-o":"fa-square-o"}" style="padding-right:5px"><input type="hidden" value="0"/></i><span>Chưa hoàn thành</span></a>
                                            <a class="col-sm-12"><i class="fa ${param.status =="1"?"fa-check-square-o":"fa-square-o"}" style="padding-right:5px"><input type="hidden" value="1"/></i><span>Hoàn thành</span></a>
                                            <a class="col-sm-12"><i class="fa ${param.status =="2"?"fa-check-square-o":"fa-square-o"}" style="padding-right:5px"><input type="hidden" value="2"/></i><span>Sắp phát hành</span></a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-sm-2 dropdown filter-dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" id="typeMenu" >Kiểu phim
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu dropdown-menu-type" style="min-width: 180px;" role="menu" aria-labelledby="typeMenu">
                                    <li>
                                        <div class="row">
                                            <a class="col-sm-12"><i class="fa ${param.type == null?"fa-check-square-o":"fa-square-o"}" style="padding-right:5px"><input type="hidden" value=""/></i><span>Tất cả</span></a>
                                                    <% for (int i = 0; i < types.size(); i++) {%>
                                            <a class="col-sm-12"><i class="fa <%= request.getParameter("type") != null ? (Integer.parseInt(request.getParameter("type")) == types.get(i).getTypeId() ? "fa-check-square-o" : "fa-square-o") : "fa-square-o"%>" style="padding-right:5px"><input type="hidden" value="<%= types.get(i).getTypeId()%>"/></i><span><%= types.get(i).getTypeName()%></span></a>
                                                    <%}
                                                    %>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-sm-2  dropdown filter-dropdown" >
                                <button class="btn btn-default dropdown-toggle"  type="button" id="genderMenu" >Thể loại
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu dropdown-menu-gender" style="min-width: 680px;" role="menu" aria-labelledby="genderMenu">
                                    <li>
                                        <div class="row">
                                            <% for (int i = 0; i < cats.size(); i++) {%>
                                            <a class="col-sm-3"><i class="fa <%=listgendersearch != null && listgendersearch.contains(new Gender(cats.get(i).getCatId(), "")) ? "fa-check-square-o" : "fa-square-o"%>" style="padding-right:5px"><input type="hidden" value="<%= cats.get(i).getCatId()%>"/></i><span><%= cats.get(i).getCatName()%></span></a>
                                                    <%}
                                                    %>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-sm-2 dropdown filter-dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" id="yearMenu" >Theo năm
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu dropdown-menu-year" style="min-width: 340px;" role="menu" aria-labelledby="yearMenu">
                                    <li>
                                        <div class="row">
                                            <a class="col-sm-12">
                                                <i class="fa ${param.year == null?"fa-check-square-o":"fa-square-o"}" style="padding-right:5px">
                                                    <input type="hidden" value=""/>
                                                </i>
                                                <span>Tất cả
                                                </span>
                                            </a>
                                            <% for (int i = 2010; i < 2019; i++) {%>
                                            <a class="col-sm-12">
                                                <i class="fa <%= request.getParameter("year") != null ? Integer.parseInt(request.getParameter("year")) == i ? "fa-check-square-o" : "fa-square-o" : "fa-square-o"%>" style="padding-right:5px">
                                                    <input type="hidden" value="<%=i%>"/>
                                                </i>
                                                <span>Năm <%= i%>
                                                </span>
                                            </a>
                                            <%}
                                            %>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-sm-2 dropdown filter-dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" id="menu1" >Theo mùa
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu dropdown-menu-season" style="min-width: 340px;" role="menu" aria-labelledby="seasonMenu">
                                    <li>
                                        <div class="row">
                                            <a class="col-sm-12">
                                                <i class="fa ${param.season == null?"fa-check-square-o":"fa-square-o"}" style="padding-right:5px">
                                                    <input type="hidden" value=""/>
                                                </i>
                                                <span>Tất cả
                                                </span>
                                            </a>
                                            <a class="col-sm-12">
                                                <i class="fa ${param.season != null && param.season=="SPRING"?"fa-check-square-o":"fa-square-o"}" style="padding-right:5px">
                                                    <input type="hidden" value="SPRING"/>
                                                </i>
                                                <span>SPRING
                                                </span>
                                            </a>
                                            <a class="col-sm-12">
                                                <i class="fa ${param.season != null && param.season=="SUMMER"?"fa-check-square-o":"fa-square-o"}" style="padding-right:5px">
                                                    <input type="hidden" value="SUMMER"/>
                                                </i>
                                                <span>SUMMER
                                                </span>
                                            </a>
                                            <a class="col-sm-12">
                                                <i class="fa ${param.season != null && param.season=="AUTUMN"?"fa-check-square-o":"fa-square-o"}" style="padding-right:5px">
                                                    <input type="hidden" value="AUTUMN"/>
                                                </i>
                                                <span>AUTUMN
                                                </span>
                                            </a>
                                            <a class="col-sm-12">
                                                <i class="fa ${param.season != null && param.season=="WINTER"?"fa-check-square-o":"fa-square-o"}" style="padding-right:5px">
                                                    <input type="hidden" value="WINTER"/>
                                                </i>
                                                <span>WINTER
                                                </span>
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-sm-2 btn-submit-filter">
                                <button class="btn btn-success" type="button">Tìm
                            </div>
                        </div>
                        <div class="row title-container ">
                            <span class="title-tab-left col-sm-12 text-center">Kết quả tìm kiếm</span>
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
                                <%=animes.size() >= 1 ? Pagger.generate(pageIndex, pageSize, total, "?" + filter + "&page=", 2) : ""%>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="container-fluid footer">
                <jsp:include page="/templates/footer.jsp"></jsp:include>
                </div>
            </div>
            <script>
                var cats = [];
            <% if (listgendersearch != null && listgendersearch.size() > 0) {
                    for (Gender g : listgendersearch) {%>
                cats.push(<%= g.getCatId()%>);
            <%}
                }%>
                var types = "" + '${param.type != null?param.type:""}';
                var status = "" + '${param.status != null?param.status:""}';
                var year = "" + '${param.year != null?param.year:""}';
                var season = "" + '${param.season != null?param.season:""}';
                var query = "";
                $(document).ready(function () {
                    $('.btn-submit-filter').on('click', function () {
                        if (types !== "")
                            query += "&type=" + types;
                        if (status !== "")
                            query += "&status=" + status;
                        if (year !== "")
                            query += "&year=" + year;
                        if (season !== "")
                            query += "&season=" + season;
                        if (cats != null && cats.length > 0)
                            query += "&gender=";
                        for (var i in cats) {
                            query += cats[i] + "+";
                        }
                        if (query.endsWith("+"))
                            query = query.substring(0, query.length - 1);
                        window.location.href = "<%= request.getContextPath()%>/Filter?" + query;
                    });
                    $('.filter-dropdown .dropdown-menu-gender a').each(function (index) {
                        $(this).on('click', function () {
                            var iconEle = $(this).children('i');
                            var catId = iconEle.children('input').val();
                            iconEle.toggleClass('fa-square-o').toggleClass('fa-check-square-o');
                            if (iconEle.hasClass('fa-check-square-o')) {
                                if (cats.indexOf(parseInt(catId)) === -1)
                                    cats.push(parseInt(catId));
                            } else {
                                 console.log(cats);
                                var index = cats.indexOf(parseInt(catId));
                                if (index !== -1)
                                    cats.splice(index, 1);
                            }
                        });
                    });
                    $('.filter-dropdown .dropdown-menu-type a').each(function (index) {
                        $(this).on('click', function () {

                            $('.filter-dropdown .dropdown-menu-type .fa-check-square-o').each(function () {
                                $(this).toggleClass('fa-square-o').toggleClass('fa-check-square-o');
                            });

                            var iconEle = $(this).children('i');
                            var typeId = iconEle.children('input').val();
                            iconEle.toggleClass('fa-square-o').toggleClass('fa-check-square-o');
                            if (iconEle.hasClass('fa-check-square-o')) {
                                types = typeId;
                            } else {
                                types = null;
                            }
                        });
                    });
                    $('.filter-dropdown .dropdown-menu-status a').each(function (index) {
                        $(this).on('click', function () {
                            $('.filter-dropdown .dropdown-menu-status .fa-check-square-o').each(function () {
                                $(this).toggleClass('fa-square-o').toggleClass('fa-check-square-o');
                            });
                            var iconEle = $(this).children('i');
                            var statusValue = iconEle.children('input').val();
                            iconEle.toggleClass('fa-square-o').toggleClass('fa-check-square-o');
                            if (iconEle.hasClass('fa-check-square-o')) {
                                status = statusValue;
                            } else {
                                status = null;
                            }
                        });
                    });
                    $('.filter-dropdown .dropdown-menu-year a').each(function (index) {
                        $(this).on('click', function () {
                            $('.filter-dropdown .dropdown-menu-year .fa-check-square-o').each(function () {
                                $(this).toggleClass('fa-square-o').toggleClass('fa-check-square-o');
                            });

                            var iconEle = $(this).children('i');
                            var yearValue = iconEle.children('input').val();
                            iconEle.toggleClass('fa-square-o').toggleClass('fa-check-square-o');
                            if (iconEle.hasClass('fa-check-square-o')) {
                                year = yearValue;
                            } else {
                                year = null;
                            }
                        });
                    });
                    $('.filter-dropdown .dropdown-menu-season a').each(function (index) {
                        $(this).on('click', function () {

                            $('.filter-dropdown .dropdown-menu-season .fa-check-square-o').each(function () {
                                $(this).toggleClass('fa-square-o').toggleClass('fa-check-square-o');
                            });

                            var iconEle = $(this).children('i');
                            var seasonValue = iconEle.children('input').val();
                            iconEle.toggleClass('fa-square-o').toggleClass('fa-check-square-o');
                            if (iconEle.hasClass('fa-check-square-o')) {
                                season = seasonValue;
                            } else {
                                season = null;
                            }
                        });
                    });
                });
        </script>
    </body>
</html>
