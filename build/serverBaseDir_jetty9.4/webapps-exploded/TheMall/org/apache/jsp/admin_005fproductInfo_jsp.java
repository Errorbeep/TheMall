/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: jetty/9.4.24.v20191120
 * Generated at: 2021-06-27 03:55:44 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class admin_005fproductInfo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


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

      out.write('\n');
      out.write('\n');
      out.write('\n');
 pageContext.setAttribute("path",request.getContextPath());
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <title>Admin</title>\n");
      out.write("\n");
      out.write("    <!-- Google Font: Source Sans Pro -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback\">\n");
      out.write("    <!-- Font Awesome Icons -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${path}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/plugins/fontawesome-free/css/all.min.css\">\n");
      out.write("    <!-- Theme style -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${path}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/css/adminlte.min.css\">\n");
      out.write("</head>\n");
      out.write("<body class=\"hold-transition sidebar-mini\">\n");
      out.write("<div class=\"wrapper\">\n");
      out.write("\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "admin_common.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("    <!-- Content Wrapper. Contains page content -->\n");
      out.write("    <div class=\"content-wrapper\">\n");
      out.write("        <!-- Content Header (Page header) -->\n");
      out.write("        <div class=\"content-header\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <div class=\"row mb-2\">\n");
      out.write("                    <div class=\"col-sm-6\">\n");
      out.write("                        <h1 class=\"m-0\">管理员界面</h1>\n");
      out.write("                    </div><!-- /.col -->\n");
      out.write("                    <div class=\"col-sm-6\">\n");
      out.write("                        <ol class=\"breadcrumb float-sm-right\">\n");
      out.write("                            <li class=\"breadcrumb-item\"><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                            <li class=\"breadcrumb-item active\">Administration</li>\n");
      out.write("                        </ol>\n");
      out.write("                    </div><!-- /.col -->\n");
      out.write("                </div><!-- /.row -->\n");
      out.write("            </div><!-- /.container-fluid -->\n");
      out.write("        </div>\n");
      out.write("        <!-- /.content-header -->\n");
      out.write("\n");
      out.write("        <!-- Main content -->\n");
      out.write("        <div class=\"content\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("\n");
      out.write("                ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "productInfo_admin.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("            </div><!-- /.container-fluid -->\n");
      out.write("        </div>\n");
      out.write("        <!-- /.content -->\n");
      out.write("    </div>\n");
      out.write("    <!-- /.content-wrapper -->\n");
      out.write("    <!-- Main Footer -->\n");
      out.write("    <footer class=\"main-footer\">\n");
      out.write("        <!-- To the right -->\n");
      out.write("        <div class=\"float-right d-none d-sm-inline\">\n");
      out.write("            Anything you want\n");
      out.write("        </div>\n");
      out.write("        <!-- Default to the left -->\n");
      out.write("        <strong>Copyright &copy; 2021-2022 <a href=\"#\">The Mall</a>.</strong> All rights reserved.\n");
      out.write("    </footer>\n");
      out.write("</div>\n");
      out.write("<!-- ./wrapper -->\n");
      out.write("\n");
      out.write("<!-- REQUIRED SCRIPTS -->\n");
      out.write("\n");
      out.write("<!-- jQuery -->\n");
      out.write("<script src=\"plugins/jquery/jquery.min.js\"></script>\n");
      out.write("<!-- Bootstrap 4 -->\n");
      out.write("<script src=\"plugins/bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("<!-- AdminLTE App -->\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${path}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/js/adminlte.min.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
