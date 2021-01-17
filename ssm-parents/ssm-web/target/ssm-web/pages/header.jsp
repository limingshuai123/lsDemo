<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!-- 页面头部 -->
<header class="main-header">
    <!-- Logo -->
    <a href="../index.jsp" class="logo">
        <span class="logo-mini"><b>数据</b></span>
        <span class="logo-lg"><b>数据</b>后台管理</span>
    </a>
    <nav class="navbar navbar-static-top">
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="../images/user8-128x128.jpg" class="user-image" alt="User Image">
                        <span class="hidden-xs">
                           <security:authentication property="principal.username"/>
                        </span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="user-header">
                            <img src="../images/user8-128x128.jpg" class="img-circle" alt="User Image">

                            <p>
                                <security:authentication property="principal.username"/> - 数据管理员
                                <%
                                    Cookie cookies[] =request.getCookies();
                                    Cookie cookie =null;
                                    String value =null;
                                    String name =null;
                                    for (int i = 0; i <cookies.length ; i++) {
                                        cookie =cookies[i];
                                        value =cookie.getValue();
                                        name=cookie.getName();
                                        if (name.equals("loginTime")){

                                %>
                                    <small>最后登录 <%=value%></small>
                                <%
                                      }
                                }
                                %>
                            </p>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-right">
                                <a href="/logout" class="btn btn-default btn-flat">注销</a>
                            </div>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
    </nav>
</header>
