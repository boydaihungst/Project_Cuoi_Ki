package org.apache.jsp.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Anime;
import java.util.ArrayList;

public final class homepage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        ");

            ArrayList<Anime> leftAnimes = (ArrayList<Anime>) request.getAttribute("left_side_animes");
            ArrayList<Anime> leftAnimes_1 = (ArrayList<Anime>) request.getAttribute("left_side_animes_1");
             ArrayList<Anime> leftAnimes_2 = (ArrayList<Anime>) request.getAttribute("left_side_animes_2");
            ArrayList<Anime> downLeftAnimes = (ArrayList<Anime>) request.getAttribute("down_left_side_animes");
            ArrayList<Anime> rightAnimes = (ArrayList<Anime>) request.getAttribute("right_side_animes");
            ArrayList<ArrayList<Anime>> leftAnimes_items = new ArrayList();
            leftAnimes_items.add(leftAnimes);
            leftAnimes_items.add(leftAnimes_1);
            leftAnimes_items.add(leftAnimes_2);
        
      out.write("\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Anime Online</title>\n");
      out.write("        <!-- Latest compiled and minified CSS -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("\n");
      out.write("        <!-- jQuery library -->\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("\n");
      out.write("        <!-- Latest compiled JavaScript -->\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("        <style>\n");
      out.write("            a{\n");
      out.write("                text-decoration: none !important;\n");
      out.write("            }\n");
      out.write("            body a:hover{\n");
      out.write("                text-decoration: none;\n");
      out.write("            }\n");
      out.write("            .left-side .preview-item:hover .top-caption{\n");
      out.write("                display: none;\n");
      out.write("            }\n");
      out.write("            .left-side,.right-side{\n");
      out.write("                margin: 0;\n");
      out.write("                padding:0;\n");
      out.write("                width: auto;\n");
      out.write("            }\n");
      out.write("            .row{\n");
      out.write("                margin: 0;\n");
      out.write("                padding:0;\n");
      out.write("            }\n");
      out.write("            .item-border{\n");
      out.write("                position: relative;\n");
      out.write("                width: 155px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .item-border-right{\n");
      out.write("                position: relative;\n");
      out.write("                width: 100px;\n");
      out.write("                height: 100px;\n");
      out.write("                overflow: hidden;\n");
      out.write("            }\n");
      out.write("            .bottom-caption {\n");
      out.write("                margin:0;\n");
      out.write("                padding:0;\n");
      out.write("                font-size:15px;\n");
      out.write("                background: black;\n");
      out.write("                opacity: 0.8;\n");
      out.write("                position: absolute;\n");
      out.write("                bottom: 0;\n");
      out.write("                left: 0;\n");
      out.write("                width: 100%;\n");
      out.write("            }\n");
      out.write("            .top-caption{\n");
      out.write("                margin:0;\n");
      out.write("                padding:0;\n");
      out.write("                font-size:14px;\n");
      out.write("                opacity: 0.8;\n");
      out.write("                position: absolute;\n");
      out.write("                top: 3.5%;\n");
      out.write("                left: 5%;\n");
      out.write("                width: auto;\n");
      out.write("            }\n");
      out.write("            .bottom-caption p{\n");
      out.write("                padding: 5px 5px;\n");
      out.write("            }\n");
      out.write("            .top-caption p{\n");
      out.write("                background: red;\n");
      out.write("                padding: 2px 5px;\n");
      out.write("            }\n");
      out.write("            .bottom-caption p, .top-caption p{\n");
      out.write("                color:white;\n");
      out.write("                overflow: hidden;\n");
      out.write("                text-overflow: ellipsis;\n");
      out.write("                white-space: nowrap;\n");
      out.write("                margin:0;\n");
      out.write("            }\n");
      out.write("            .top-caption-right{\n");
      out.write("                opacity: 1;\n");
      out.write("                font-size:12px;\n");
      out.write("                top: 0%;\n");
      out.write("                left: 0%;\n");
      out.write("            }\n");
      out.write("            .top-caption-right p{\n");
      out.write("                background: green;\n");
      out.write("            }\n");
      out.write("            .img-icon{\n");
      out.write("                width: 100%;\n");
      out.write("                height: 100%;\n");
      out.write("            }\n");
      out.write("            .img-icon-right{\n");
      out.write("                height: auto;\n");
      out.write("            }\n");
      out.write("            .preview-item{\n");
      out.write("                width: auto;\n");
      out.write("                padding:5px;\n");
      out.write("            }\n");
      out.write("            /*item info box*/\n");
      out.write("            .item-info{\n");
      out.write("                top:-99999px;\n");
      out.write("                opacity: 0;\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("                position: absolute;\n");
      out.write("                width: 250px;\n");
      out.write("                height: 200px;\n");
      out.write("                background-color: rgba(0,0,0,.93);\n");
      out.write("                z-index: 100;\n");
      out.write("                transition: opacity 0.5s;\n");
      out.write("                -webkit-transition: opacity 0.5s; /* Safari 3.1 to 6.0 */\n");
      out.write("            }\n");
      out.write("            .item-info-box-left{\n");
      out.write("                right:-255px !important;\n");
      out.write("            }\n");
      out.write("            .item-info-box-right{\n");
      out.write("                left:-255px !important;\n");
      out.write("            }\n");
      out.write("            .left-side .preview-item:hover .item-info{\n");
      out.write("                top:2%;\n");
      out.write("                opacity: 1;\n");
      out.write("            }\n");
      out.write("            .left-side .preview-item .item-info:hover{\n");
      out.write("                top:-99999px;\n");
      out.write("                opacity: 0;\n");
      out.write("            }\n");
      out.write("            /*=======*/\n");
      out.write("            /*phan ben phai ten anime thu nho*/\n");
      out.write("            .title-anime-right{\n");
      out.write("                margin:0;\n");
      out.write("                padding:0;\n");
      out.write("                font-size:14px;\n");
      out.write("                width: 150px; \n");
      out.write("            }\n");
      out.write("            .title-anime-right p{\n");
      out.write("                color: captiontext;\n");
      out.write("                white-space: nowrap;\n");
      out.write("                overflow: hidden;\n");
      out.write("                text-overflow: ellipsis;\n");
      out.write("                margin:0;\n");
      out.write("            }\n");
      out.write("            .content-anime-right{\n");
      out.write("                margin:0;\n");
      out.write("                padding:0;\n");
      out.write("                font-size:12px;\n");
      out.write("                width: 150px;\n");
      out.write("            }\n");
      out.write("            .content-anime-right p{\n");
      out.write("                color: black;\n");
      out.write("                white-space: nowrap;\n");
      out.write("                overflow: hidden;\n");
      out.write("                text-overflow: ellipsis;\n");
      out.write("                margin:0;\n");
      out.write("            }\n");
      out.write("            .content-anime-right p:hover{\n");
      out.write("                color: black;\n");
      out.write("                white-space: normal;\n");
      out.write("                overflow: visible;\n");
      out.write("                margin:0;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/templates/header.jsp", out, false);
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <ul class=\"nav nav-tabs\">\n");
      out.write("                <li class=\"active\"><a data-toggle=\"tab\" href=\"#menu0\">Anime mua moi</a></li>\n");
      out.write("                <li><a data-toggle=\"tab\" href=\"#menu1\">Anime mua truoc</a></li>\n");
      out.write("                <li><a data-toggle=\"tab\" href=\"#menu2\">Anime moi cap nhat</a></li>\n");
      out.write("            </ul>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-sm-8 left-side\">\n");
      out.write("                    <div class=\"tab-content\">\n");
      out.write("                        ");
 for (int m = 0; m < leftAnimes_items.size(); m++) {
      out.write("\n");
      out.write("                        <div id=\"menu");
      out.print(m);
      out.write("\" class=\"tab-pane fade in ");
      out.print( m == 0 ? "active" : "");
      out.write("\">\n");
      out.write("                            ");
 for (int i = 0; i < leftAnimes_items.get(m).size(); i++) {
      out.write("\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                ");
for (int j = 0; j < 4; j++) {
                                        if (i >= leftAnimes_items.get(m).size()) {
                                            break;
                                        }
                                
      out.write("\n");
      out.write("                                <!--item-->\n");
      out.write("                                <div class=\"col-sm-3 preview-item\">\n");
      out.write("                                    <a href=\"#\">\n");
      out.write("                                        <div class=\"item-info ");
      out.print( j >= 2 ? "item-info-box-right" : "item-info-box-left");
      out.write("\">\n");
      out.write("                                            <p>\n");
      out.write("                                                ");
      out.print( leftAnimes_items.get(m).get(i).getAniName());
      out.write("\n");
      out.write("                                            </p>\n");
      out.write("                                            <p>\n");
      out.write("                                                ");
      out.print( leftAnimes_items.get(m).get(i).getDesc());
      out.write("\n");
      out.write("                                            </p>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"item-border item\">\n");
      out.write("                                            <div class=\"top-caption text-center \">\n");
      out.write("                                                <p>");
      out.print( leftAnimes_items.get(m).get(i).getEpsRel() == 0 ? "???" : leftAnimes_items.get(m).get(i).getEpsRel());
      out.write('/');
      out.print( leftAnimes_items.get(m).get(i).getEpsMax() == 0 ? "???" : leftAnimes_items.get(m).get(i).getEpsMax());
      out.write(" Tap</p>\n");
      out.write("                                            </div>\n");
      out.write("                                            <img src=\"");
      out.print( request.getContextPath() + "/" + leftAnimes_items.get(m).get(i).getPicture());
      out.write("\" alt=\"\" class=\"img-responsive img-icon \">\n");
      out.write("                                            <div class=\"bottom-caption text-center \">\n");
      out.write("                                                <p>");
      out.print( leftAnimes_items.get(m).get(i).getAniName());
      out.write("</p>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </a>\n");
      out.write("                                </div>\n");
      out.write("                                ");
 i++;
                                    }
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <!--het dong-->\n");
      out.write("                            ");
   }
                            
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                        ");
}
                        
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <h3>ANIME DAI TAP</h3>\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        ");
for (int j = 0; j < 4; j++) {
                        
      out.write("\n");
      out.write("                        <div  class=\"col-sm-3 preview-item\">\n");
      out.write("                            <a href=\"#\">\n");
      out.write("                                <div class=\"item-border item\">\n");
      out.write("                                    <div class=\"top-caption text-center \">\n");
      out.write("                                        <p>");
      out.print( downLeftAnimes.get(j).getEpsRel() == 0 ? "???" : downLeftAnimes.get(j).getEpsRel());
      out.write('/');
      out.print( downLeftAnimes.get(j).getEpsMax() == 0 ? "???" : downLeftAnimes.get(j).getEpsMax());
      out.write(" Tap</p>\n");
      out.write("                                    </div>\n");
      out.write("                                    <img src=\"");
      out.print( request.getContextPath() + "/" + downLeftAnimes.get(j).getPicture());
      out.write("\" alt=\"\" class=\"img-responsive img-icon \">\n");
      out.write("                                    <div class=\"bottom-caption text-center \">\n");
      out.write("                                        <p>");
      out.print( downLeftAnimes.get(j).getAniName());
      out.write("</p>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </a>\n");
      out.write("                        </div>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div  class=\"col-sm-4 right-side\">\n");
      out.write("                    <div>\n");
      out.write("                        <div class=\"fb-page fb_iframe_widget\" data-href=\"https://www.facebook.com/Ani4u2/\" data-width=\"300\" data-small-header=\"false\" data-adapt-container-width=\"true\" data-hide-cover=\"false\" data-show-facepile=\"true\" fb-xfbml-state=\"rendered\" fb-iframe-plugin-query=\"adapt_container_width=true&amp;app_id=448777685319550&amp;container_width=0&amp;hide_cover=false&amp;href=https%3A%2F%2Fwww.facebook.com%2FAni4u2%2F&amp;locale=vi_VN&amp;sdk=joey&amp;show_facepile=true&amp;small_header=false&amp;width=300\"><span style=\"vertical-align: bottom; width: 300px; height: 196px;\"><iframe name=\"f1602c80990609c\" width=\"300px\" height=\"1000px\" frameborder=\"0\" allowtransparency=\"true\" allowfullscreen=\"true\" scrolling=\"no\" allow=\"encrypted-media\" title=\"fb:page Facebook Social Plugin\" src=\"https://www.facebook.com/v2.10/plugins/page.php?adapt_container_width=true&amp;app_id=448777685319550&amp;channel=http%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2FxaOI6zd9HW9.js%3Fversion%3D42%23cb%3Df3193b8ef4b7ed%26domain%3Dani4u.org%26origin%3Dhttp%253A%252F%252Fani4u.org%252Ff1dff02becd9b64%26relation%3Dparent.parent&amp;container_width=0&amp;hide_cover=false&amp;href=https%3A%2F%2Fwww.facebook.com%2FAni4u2%2F&amp;locale=vi_VN&amp;sdk=joey&amp;show_facepile=true&amp;small_header=false&amp;width=300\" style=\"border: none; visibility: visible; width: 300px; height: 196px;\" class=\"\"></iframe></span></div>\n");
      out.write("                    </div>\n");
      out.write("                    ");
for (int j = 0; j < rightAnimes.size(); j++) {
      out.write("\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-sm-4\">\n");
      out.write("                            <div  class=\"preview-item\">\n");
      out.write("                                <a href=\"#\">\n");
      out.write("                                    <div class=\"item-border-right item\">\n");
      out.write("                                        <div class=\"top-caption top-caption-right text-center \">\n");
      out.write("                                            <p>");
      out.print( rightAnimes.get(j).getEpsRel() == 0 ? "???" : rightAnimes.get(j).getEpsRel());
      out.write('/');
      out.print( rightAnimes.get(j).getEpsMax() == 0 ? "???" : rightAnimes.get(j).getEpsMax());
      out.write(" Tap</p>\n");
      out.write("                                        </div>\n");
      out.write("                                        <img src=\"");
      out.print( request.getContextPath() + "/" + rightAnimes.get(j).getPicture());
      out.write("\" alt=\"\" class=\"img-responsive img-icon img-icon-right\">\n");
      out.write("                                    </div>\n");
      out.write("                                </a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-sm-8\">  \n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <div class=\"col-sm-12 preview-item\">\n");
      out.write("                                    <div class=\"title-anime-right\">\n");
      out.write("                                        <a href=\"#\">\n");
      out.write("                                            <p>");
      out.print( rightAnimes.get(j).getAniName());
      out.write("</p>\n");
      out.write("                                        </a>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"row\">\n");
      out.write("                                <div class=\"col-sm-12 preview-item\">\n");
      out.write("                                    <div class=\"content-anime-right \">\n");
      out.write("                                        <a href=\"#\">\n");
      out.write("                                            <p>");
      out.print( rightAnimes.get(j).getDesc().length() >= 100 ? rightAnimes.get(j).getDesc().substring(0, 100) + "..." : rightAnimes.get(j).getDesc());
      out.write("</p>\n");
      out.write("                                        </a>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>                \n");
      out.write("                    </div>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
