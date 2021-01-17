
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>产品管理</title>
    <meta name="description" content="产品管理">
    <meta name="keywords" content="产品管理">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="../plugins/morris/morris.css">
    <link rel="stylesheet" href="../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="../plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="../plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="../plugins/select2/select2.css">
    <link rel="stylesheet" href="../plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="../plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="../plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="../plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
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
                <small>数据列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="#">数据管理</a></li>
                <li class="active">数据列表</li>
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
                                    <security:authorize access="hasRole('ROLE_ADMIN')">
                                    <button type="button" class="btn btn-default" title="新建" onclick="location.href='${pageContext.request.contextPath}/pages/product-add.jsp'"><i class="fa fa-file-o"></i> 新建</button>
                                    </security:authorize>
                                    <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload()"><i class="fa fa-refresh"></i> 刷新</button>
                                    <security:authorize access="hasRole('ROLE_ADMIN')">
                                    <button type="button" class="btn btn-default" title="全选删除"><i class="fa fa-trash-o"></i> 全选删除</button>
                                    </security:authorize>
                                </div>
                            </div>
                        </div>
                        <div class="box-tools pull-right">
                            <form action="/product/findAll.do" method="post" id="chanName">
                                <div class="has-feedback">
                                    <input type="text" name="productName" class="form-control input-sm" placeholder="搜索" value="${productName}">
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
                                    <input id="selall" type="checkbox" class="icheckbox_square-blue">
                                </th>
                                <th class="sorting_asc">ID</th>
                                <th class="sorting_desc">编号</th>
                                <th class="sorting_asc sorting_asc_disabled">产品名称</th>
                                <th class="sorting_desc sorting_desc_disabled">出发城市</th>
                                <th class="sorting">出发时间</th>
                                <th class="text-center sorting">产品价格</th>
                                <th class="sorting">产品描述</th>
                                <th class="text-center sorting">状态</th>
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pageInfo.list}" var="product">
                            <tr>
                                <td><input name="ids" type="checkbox"></td>
                                <td>${product.id}</td>
                                <td>${product.productNum}</td>
                                <td>${product.productName}</td>
                                <td>${product.cityName}</td>
                                <td>${product.departureTimeStr}</td>
                                <td class="text-center">${product.productPrice}</td>
                                <td>${product.productDesc}</td>
                                <td class="text-center">${product.productStatusStr}</td>
                                <td class="text-center">
                                    <button type="button" class="btn bg-olive btn-xs" onclick="location.href='${pageContext.request.contextPath}/product/findByShow.do?id=${product.id}'">详情</button>
                                    <security:authorize access="hasRole('ROLE_ADMIN')">
                                    <button type="button" class="btn bg-olive btn-xs" onclick="location.href='${pageContext.request.contextPath}/product/findById.do?id=${product.id}'">编辑</button>
                                    <button type="button" class="btn bg-olive btn-xs" onclick="delcfm('${pageContext.request.contextPath}/product/delete.do?id=${product.id}')">删除</button>
                                    </security:authorize>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!--数据列表/-->
                    </div>
                    <!-- 数据表格 /-->
                </div>
                <!-- /.box-body -->
                <!-- .box-footer-->
                <div class="box-footer">
                    <div class="pull-left">
                        <div class="form-group form-inline">
                            总共${pageInfo.pages}页，当前第${pageInfo.pageNum}页,共${pageInfo.total}条数据。每页
                            <select class="form-control" id="changePageSize" onchange="changePageSize()">
                                <option <c:if test="${pageInfo.pageSize==5}">selected</c:if>>5</option>
                                <option <c:if test="${pageInfo.pageSize==10}">selected</c:if>>10</option>
                                <option <c:if test="${pageInfo.pageSize==15}">selected</c:if>>15</option>
                                <option <c:if test="${pageInfo.pageSize==30}">selected</c:if>>30</option>
                                <option <c:if test="${pageInfo.pageSize==50}">selected</c:if>>50</option>
                            </select>条
                        </div>
                    </div>

                    <div class="box-tools pull-right">
                        <ul class="pagination">
                            <c:if test="${pageInfo.pageNum!=1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/product/findAll.do?page=1&size=${pageInfo.pageSize}&productName=${productName}" aria-label="Previous">首页</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/product/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}&productName=${productName}">上一页</a></li>
                            </c:if>

                            <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                <li><a href="${pageContext.request.contextPath}/product/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}&productName=${productName}">${pageNum}</a></li>
                            </c:forEach>

                            <c:if test="${pageInfo.pageNum<pageInfo.pages}">
                                <li><a href="${pageContext.request.contextPath}/product/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}&productName=${productName}">下一页</a></li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/product/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}&productName=${productName}" aria-label="Next">尾页</a>
                                </li>
                            </c:if>
                        </ul>

                    </div>

                </div>
                <!-- /.box-footer-->



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
        <strong>Copy&copy;2020</strong>
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
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

</div>


<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/raphael/raphael-min.js"></script>
<script src="../plugins/morris/morris.min.js"></script>
<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="../plugins/knob/jquery.knob.js"></script>
<script src="../plugins/daterangepicker/moment.min.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="../plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../plugins/fastclick/fastclick.js"></script>
<script src="../plugins/iCheck/icheck.min.js"></script>
<script src="../plugins/adminLTE/js/app.min.js"></script>
<script src="../plugins/treeTable/jquery.treetable.js"></script>
<script src="../plugins/select2/select2.full.min.js"></script>
<script src="../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="../plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="../plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="../plugins/ckeditor/ckeditor.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/chartjs/Chart.min.js"></script>
<script src="../plugins/flot/jquery.flot.min.js"></script>
<script src="../plugins/flot/jquery.flot.resize.min.js"></script>
<script src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script src="../plugins/flot/jquery.flot.categories.min.js"></script>
<script src="../plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="../plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script>

    function changePageSize(){
        //获取下拉框的值
        var pageSize =$("#changePageSize").val();
        var name = $(" input[ name='productName' ] ").val();

        //向服务器发送请求，改变每页显示条数
        location.href="${pageContext.request.contextPath}/product/findAll.do?page=${pageInfo.pageNum}&size="+ pageSize+"&productName="+name;
        $("#changePageSize").val(${pageInfo.pageSize});
    }

    function delcfm(url) {
        $('#url').val(url);//给会话中的隐藏属性URL赋值
        $('#delcfmModel').modal();
    }
    function urlSubmit(){
        var url=$.trim($("#url").val());//获取会话中的隐藏属性URL
        window.location.href=url;
    }

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
</script>
</body>
</html>
