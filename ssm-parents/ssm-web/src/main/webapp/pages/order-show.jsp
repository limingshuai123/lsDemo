<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <li><a href="${pageContext.request.contextPath}/order/findAll.do">订单管理</a></li>
                <li class="active">订单详情</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content"> <!--产品信息-->

            <div class="panel panel-default">
                <div class="panel-heading">订单信息</div>
                <div class="row data-type">

                    <div class="col-md-2 title">订单编号</div>
                    <div class="col-md-4 data">
                        <input type="text" class="form-control" value="${orders.orderNum}" readonly>
                    </div>
                    <div class="col-md-2 title">下单时间</div>
                    <div class="col-md-4 data">
                        <input type="text" class="form-control" value="${orders.orderTimeStr}" readonly>
                    </div>
                    <div class="col-md-2 title">产品名称</div>
                    <div class="col-md-4 data">
                        <input type="text" class="form-control" value="${orders.product.productName}" readonly>
                    </div>
                    <div class="col-md-2 title">出发城市</div>
                    <div class="col-md-4 data">
                        <input type="text" class="form-control"  value="${orders.product.cityName}" readonly>
                    </div>
                    <div class="col-md-2 title">出发时间</div>
                    <div class="col-md-4 data">
                        <div class="input-group date">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                            <input type="text" class="form-control pull-right"
                                   id="datepicker-a3" value="${orders.product.departureTimeStr}" readonly>
                        </div>
                    </div>
                    <div class="col-md-2 title">出游人数</div>
                    <div class="col-md-4 data">
                        <input type="text" class="form-control"  value="${orders.peopleCount}" readonly>
                    </div>

                    <div class="col-md-2 title rowHeight2x">其他信息</div>
                    <div class="col-md-10 data rowHeight2x">
							<textarea class="form-control" rows="3" placeholder="其他信息" readonly>
                                ${orders.orderDesc}
                            </textarea>
                    </div>

                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">游客信息</div>
                <div class="row data-type">
                    <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                        <thead>
                        <tr>
                            <th class="text-center">人群</th>
                            <th class="text-center">姓名</th>
                            <th class="text-center">性别</th>
                            <th class="text-center">手机号码</th>
                            <th class="text-center">证件类型</th>
                            <th class="text-center">证件号码</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${orders.travellers}" var="travellers">
                            <tr>
                                <td>${travellers.travellerTypeStr}</td>
                                <td><input type="text" size="10" value="${travellers.name}" readonly="readonly"></td>
                                <td><input type="text" size="10" value="${travellers.sex}" readonly="readonly"></td>
                                <td><input type="text" size="20" value="${travellers.phoneNum}" readonly="readonly"></td>
                                <td><input type="text" size="15" value="${travellers.credentialsTypeStr}" readonly="readonly"></td>
                                <td><input type="text" size="28" value="${travellers.credentialsNum}" readonly="readonly"></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">联系人信息</div>
                <div class="row data-type">

                    <div class="col-md-2 title">会员</div>
                    <div class="col-md-4 data" >
                        <label class="text-center" style="font-weight:400">${orders.member.nickName}</label>
                    </div>
                    <div class="col-md-2 title">联系人</div>
                    <div class="col-md-4 data" >
                        <label class="text-center" style="font-weight: 400">${orders.member.name}</label>
                    </div>
                    <div class="col-md-2 title">手机号</div>
                    <div class="col-md-4 data">
                        <label class="text-center" style="font-weight: 400" >${orders.member.phoneNum}</label>
                    </div>
                    <div class="col-md-2 title">邮箱</div>
                    <div class="col-md-4 data">
                        <label class="text-center" style="font-weight: 400"> ${orders.member.email}</label>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <c:if test="${orders.orderStatus==1}">
                    <div class="panel-heading">费用信息</div>
                    <div class="row data-type">
                        <div class="col-md-2 title">支付方式</div>
                        <div class="col-md-4 data">
                            <label class="text-center" style="font-weight: 400">${orders.payTypeStr}</label>
                        </div>
                        <div class="col-md-2 title">金额</div>
                        <div class="col-md-4 data">
                            <label class="text-center" style="font-weight: 400">￥
                                    ${orders.peopleCount*orders.product.productPrice}</label>
                        </div>
                    </div>
                </c:if>
            </div>
            <!--订单信息/-->
            <!--工具栏-->
            <div class="box-tools text-center">
                <button type="button" class="btn bg-default"
                        onclick="history.back(-1);">返回</button>
            </div>
            <!--工具栏/-->
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

</div>


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
