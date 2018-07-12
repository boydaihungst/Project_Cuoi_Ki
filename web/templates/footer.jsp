<%-- 
    Document   : footer
    Created on : Jul 9, 2018, 2:29:33 PM
    Author     : DrAgOn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .footer{
                margin-top: 25px;
                background-color: black;
                z-index: 2000;
                width: 100%;
                border-top: 1px chartreuse solid;  
                display: flex;
                justify-content: center;
            }
            .footer .col-sm-6{
                height: 100%;
            }
            .contact-footer{
                padding-left: 50px;
            }
            .contact-footer a{
                margin-bottom: 10px;
                font-size: 1.2em;
                display: block;
                /*clear:both;*/
            }
            .contact-footer a i{
                font-size: 1.4em;
                margin-right: 10px;
            }
            .footer-title{
                font-weight: bold;
                font-size:1.5em;
            }
            .inner-wrapper{
                padding-left:50px;
                margin-top: 30px;
                margin-bottom: 30px;
            }
            .about-footer{
                border-right: 1px solid #777;
            }
        </style>
    </head>
    <body>
        <div class="row container">
            <div class="col-sm-6 about-footer">
                <div class="inner-wrapper">
                    <h4 class="footer-title">Giới thiệu</h4>
                    <p>Website được phát triển nhằm đem đến niềm vui cho mọi người.
                    </p>
                    <a href="#about-website"></a>
                </div>
            </div>
            <div class="col-sm-6 contact-footer">
                <div class="inner-wrapper">
                    <h4 class="footer-title">Thông tin liên hệ</h4>
                    <a href="#telephone"><i class="	fa fa-phone-square"></i><span>(+84)972845643</span></a>
                    <a href="#email"><i class="fa fa-envelope-square"></i><span>support_hoangdhse05052@fpt.edu.vn</span></a>
                    <a href="#address"><i class="fa fa-map-marker"></i><span>Hòa lạc, Hà Nội</span></a>
                </div>
            </div>

        </div>
    </body>
</html>
