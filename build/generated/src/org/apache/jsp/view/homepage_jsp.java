package org.apache.jsp.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
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
      out.write("            .item-border{\n");
      out.write("                position: relative;\n");
      out.write("                width: 150px;\n");
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
      out.write("            .img-icon{\n");
      out.write("                width: 100%;\n");
      out.write("                height: 100%;\n");
      out.write("            }\n");
      out.write("            .preview-item{\n");
      out.write("                width: auto;\n");
      out.write("                padding:5px;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            ");
 for (int i = 0; i < 4; i++) {
      out.write("\n");
      out.write("            <div class=\"row\" id=\"box-search\">\n");
      out.write("                <div  class=\"col-sm-3 preview-item\">\n");
      out.write("                    <a href=\"#\">\n");
      out.write("                        <div class=\"item-border item\">\n");
      out.write("                            <div class=\"top-caption text-center \">\n");
      out.write("                                <p>842/??? Tap</p>\n");
      out.write("                            </div>\n");
      out.write("                            <img src=\"../img/imgdemo.jpg\" alt=\"\" class=\"img-responsive img-icon \">\n");
      out.write("                            <div class=\"bottom-caption text-center \">\n");
      out.write("                                <p>One piece - Vua hai Tac - asdfsf</p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </a>\n");
      out.write("                </div>\n");
      out.write("                <div  class=\"col-sm-3 preview-item\">\n");
      out.write("                    <a href=\"#\">\n");
      out.write("                        <div class=\"item-border item\">\n");
      out.write("                            <div class=\"top-caption text-center \">\n");
      out.write("                                <p>842/??? Tap</p>\n");
      out.write("                            </div>\n");
      out.write("                            <img src=\"../img/imgdemo.jpg\" alt=\"\" class=\"img-responsive img-icon \">\n");
      out.write("                            <div class=\"bottom-caption text-center \">\n");
      out.write("                                <p>One piece - Vua hai Tac - asdfsf</p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </a>\n");
      out.write("                </div>\n");
      out.write("                <div  class=\"col-sm-3 preview-item\">\n");
      out.write("                    <a href=\"#\">\n");
      out.write("                        <div class=\"item-border item\">\n");
      out.write("                            <div class=\"top-caption text-center \">\n");
      out.write("                                <p>842/??? Tap</p>\n");
      out.write("                            </div>\n");
      out.write("                            <img src=\"../img/imgdemo.jpg\" alt=\"\" class=\"img-responsive img-icon \">\n");
      out.write("                            <div class=\"bottom-caption text-center \">\n");
      out.write("                                <p>One piece - Vua hai Tac - asdfsf</p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </a>\n");
      out.write("                </div>\n");
      out.write("                <div  class=\"col-sm-3 preview-item\">\n");
      out.write("                    <a href=\"#\">\n");
      out.write("                        <div class=\"item-border item\">\n");
      out.write("                            <div class=\"top-caption text-center \">\n");
      out.write("                                <p>842/??? Tap</p>\n");
      out.write("                            </div>\n");
      out.write("                            <img src=\"../img/imgdemo.jpg\" alt=\"\" class=\"img-responsive img-icon \">\n");
      out.write("                            <div class=\"bottom-caption text-center \">\n");
      out.write("                                <p>One piece - Vua hai Tac - asdfsf</p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <!--het dong-->\n");
      out.write("            ");
   }
            
      out.write("\n");
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
