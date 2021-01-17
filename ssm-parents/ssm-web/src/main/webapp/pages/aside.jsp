<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!-- 导航侧栏 -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="../images/user8-128x128.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p><security:authentication property="principal.username"/> </p>
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>


        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>

            <li id="admin-index"><a href="../index.jsp"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

            <!-- 菜单 -->



            <li class="treeview">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>系统管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="system-setting1">
                        <security:authorize access="hasRole('ROLE_ADMIN')">
                        <a href="${pageContext.request.contextPath}/user/findAll.do">
                            <i class="fa fa-circle-o"></i> 用户管理
                        </a>
                        </security:authorize>
                    </li>


                    <li id="system-setting2">
                      <security:authorize access="hasRole('ROLE_ADMIN')">
                        <a href="${pageContext.request.contextPath}/role/findAll.do">
                            <i class="fa fa-circle-o"></i> 角色管理
                        </a>
                      </security:authorize>
                    </li>

                    <li id="system-setting3">
                       <security:authorize access="hasRole('ROLE_ADMIN')">
                        <a href="${pageContext.request.contextPath}/permission/findAll.do">
                            <i class="fa fa-circle-o"></i> 权限管理
                        </a>
                       </security:authorize>
                    </li>

                    <li id="system-setting4">
                        <security:authorize access="hasRole('ROLE_ADMIN')">
                        <a href="${pageContext.request.contextPath}/syslog/findAll.do">
                            <i class="fa fa-circle-o"></i> 访问日志
                        </a>
                        </security:authorize>
                    </li>

                </ul>
            </li>


            <li class="treeview">
                <a href="#">
                    <i class="fa fa-pie-chart"></i> <span>基础数据</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="system-setting5">
                        <security:authorize access="hasRole('ROLE_USER')">
                        <a href="${pageContext.request.contextPath}/product/findAll.do">
                            <i class="fa fa-circle-o"></i> 产品管理
                        </a>
                        </security:authorize>
                    </li>

                    <li id="system-setting6">
                       <security:authorize access="hasRole('ROLE_USER')">
                        <a href="${pageContext.request.contextPath}/order/findAll.do">
                            <i class="fa fa-circle-o"></i> 订单管理
                        </a>
                       </security:authorize>
                    </li>
                </ul>
            </li>

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
