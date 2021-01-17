
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>订单管理</title>
    <meta name="description" content="订单管理">
    <meta name="keywords" content="订单管理">

    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <!-- 页面meta /-->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- 页面头部 /-->
    <!-- 导航侧栏 -->
    <jsp:include page="aside.jsp"></jsp:include>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <!-- @@master = admin-layout.html-->
    <!-- @@block = content -->

    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1 style="top: 30px">
                数据管理
                <small>订单管理</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="#">数据管理</a></li>
                <li class="active">订单列表</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">列表</h3>
                </div>
                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">

                            <!--工具栏-->
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" title="新建" onclick="location.href='${pageContext.request.contextPath}/order/add.do'"><i class="fa fa-file-o"></i> 新建</button>
                                        <button type="button" class="btn btn-default" title="刷新"><i class="fa fa-refresh" onclick="window.location.reload()"></i> 刷新</button>
                                        <security:authorize access="hasRole('ROLE_ADMIN')">
                                        <button type="button" class="btn btn-default" title="全选删除"><i class="fa fa-trash-o"></i>全选删除</button>
                                        </security:authorize>
                                    </div>
                                </div>
                            </div>
                            <div class="box-tools pull-right">
                                <form action="/order/findAll.do" method="post" id="chanName">
                                    <div class="has-feedback">
                                        <input type="text" name="orderNum" class="form-control input-sm" placeholder="搜索" >
                                        <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                    </div>
                                </form>
                            </div>
                            <!--工具栏/-->
                            <!--数据列表-->
                            <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="" style="padding-right:0px;">
                                        <input id="selall" type="checkbox" class="icheckbox_square-blue">(全选)
                                    </th>
                                    <th class="sorting_asc">ID</th>
                                    <th class="sorting_desc">订单编号</th>
                                    <th class="sorting_asc sorting_asc_disabled">产生方式</th>
                                    <th class="sorting_desc sorting_desc_disabled">出发城市</th>
                                    <th class="sorting">下单时间</th>
                                    <th class="text-center sorting">订单状态</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${pageInfo.list}" var="list">
                                        <tr>
                                            <td><input name="ids" type="checkbox"></td>
                                            <td>${list.id}</td>
                                            <td>${list.orderNum}</td>
                                            <td>${list.payTypeStr}</td>
                                            <td>${list.product.cityName}</td>
                                                <%--<td><fmt:formatDate value="${list.departureTime}}" pattern="yyyy-MM-dd HH:mm:ss"/></td>--%>
                                            <td>${list.orderTimeStr}</td>
                                            <td>${list.orderStatusStr}</td>
                                            <td>
                                                <button type="button" class="btn bg-olive btn-xs" onclick="location.href='${pageContext.request.contextPath}/order/findById.do?id=${list.id}'">详细</button>
                                                <button type="button" class="btn bg-olive btn-xs" onclick="location.href='${pageContext.request.contextPath}/order/updateById.do?id=${list.id}'">编辑</button>
                                                <button type="button" class="btn bg-olive btn-xs" onclick="delcfm('${pageContext.request.contextPath}/order/delete.do?id=${list.id}')">删除</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <!--数据列表/-->
                        </div>
                        <!-- 数据表格 /-->
                    </div>
                <!-- .box-footer-->
                <div class="box-footer">
                    <div class="pull-left">

                        <div class="form-group form-inline">

                            <form action="${pageContext.request.contextPath}/order/findAll.do">
                                总共${pageInfo.pages} 页，共${pageInfo.total} 条数据。 跳转至
                                <select class="form-control" name="page">
                                    <c:forEach begin="1" end="${pageInfo.pages }" var="pageNum">
                                       <option>${pageNum}</option>
                                    </c:forEach>
                                </select> 第几页
                                <button type="submit" class="btn bg-olive btn-xs">跳转</button>
                                <input type="hidden" name="orderNum" value="${orderNum}">
                            </form>
                        </div>

                    </div>

                    <div class="box-tools pull-right">
                        <ul class="pagination">
                            <c:if test="${pageInfo.pageNum!=1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/order/findAll.do?page=1&size=${pageInfo.pageSize}&orderNum=${orderNum}" aria-label="Previous">首页</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/order/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}&orderNum=${orderNum}">上一页</a></li>
                            </c:if>

                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                <li><a href="${pageContext.request.contextPath}/order/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}&orderNum=${orderNum}">${pageNum}</a></li>
                            </c:forEach>

                            <c:if test="${pageInfo.pageNum<pageInfo.pages}">
                                <li><a href="${pageContext.request.contextPath}/order/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}&orderNum=${orderNum}">下一页</a></li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/order/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}&orderNum=${orderNum}" aria-label="Next">尾页</a>
                                </li>
                            </c:if>
                        </ul>

                    </div>

                </div>
            </div>

        </section>
        <!-- 正文区域 /-->

    </div>
    <!-- @@close -->
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.0
        </div>
        <strong> Copyright &copy; 2020</strong>
    </footer>
    <!-- 底部导航 /-->

    <!-- 信息删除确认 -->
    <div class="modal fade" id="delcfmModel">
        <div class="modal-dialog">
            <div class="modal-content message_align">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">提示信息</h4>
                </div>
                <div class="modal-body">
                    <p>您确认要删除吗？</p>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="url"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <a  onclick="urlSubmit()" class="btn btn-success" data-dismiss="modal">确定</a>
                </div>
            </div>
        </div>
    </div>


</div>

<script type="text/javascript">
    function delcfm(url) {
        $('#url').val(url);//给会话框隐藏属性URL赋值
        $('#delcfmModel').modal();
    }

    function urlSubmit() {
        var url = $.trim($("#url").val());//获取会话框隐藏属性URL
        window.location.href=url;
    }

</script>
<script src="<%=request.getContextPath() %>/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="<%=request.getContextPath() %>/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/raphael/raphael-min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/morris/morris.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="<%=request.getContextPath() %>/plugins/knob/jquery.knob.js"></script>
<script src="<%=request.getContextPath() %>/plugins/daterangepicker/moment.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/daterangepicker/daterangepicker.js"></script>
<script src="<%=request.getContextPath() %>/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="<%=request.getContextPath() %>/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="<%=request.getContextPath() %>/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="<%=request.getContextPath() %>/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/fastclick/fastclick.js"></script>
<script src="<%=request.getContextPath() %>/plugins/iCheck/icheck.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/adminLTE/js/app.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/treeTable/jquery.treetable.js"></script>
<script src="<%=request.getContextPath() %>/plugins/select2/select2.full.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="<%=request.getContextPath() %>/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="<%=request.getContextPath() %>/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="<%=request.getContextPath() %>/plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="<%=request.getContextPath() %>/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="<%=request.getContextPath() %>/plugins/ckeditor/ckeditor.js"></script>
<script src="<%=request.getContextPath() %>/plugins/input-mask/jquery.inputmask.js"></script>
<script src="<%=request.getContextPath() %>/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="<%=request.getContextPath() %>/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="<%=request.getContextPath() %>/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/chartjs/Chart.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/flot/jquery.flot.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/flot/jquery.flot.categories.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="<%=request.getContextPath() %>/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="<%=request.getContextPath() %>/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="<%=request.getContextPath() %>/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script>


    $('#chanName').keypress(function (event) {
        if (event.width==13){
            //点击回车事件
            $("#chanName").submit;

        }
    })



    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });


    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }


    $(document).ready(function() {

        // 激活导航位置
        setSidebarActive("admin-datalist");

        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
        // 全选操作
        $("#selall").click(function() {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });
    var project_details = {
        minView: 0,
        language:  'zh-CN',
        format: 'yyyy-mm-dd hh:ii',
        //todayBtn:  1,//今日按钮
        autoclose: 1,//选中关闭
        //todayHighlight : 1,
        //forceParse : 1,
    };
    $('.datepicker-a3').datetimepicker(project_details);
</script>
</body>

</html>
