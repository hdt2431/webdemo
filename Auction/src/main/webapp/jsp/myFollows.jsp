<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息修改</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript"
	src="${APP_PATH }/resources/js/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" href="${APP_PATH }/resources/layui/css/layui.css"
	media="all">
<link
	href="${APP_PATH }/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"
	charset="UTF-8"></script>
<script src="${APP_PATH }/resources/layui/layui.js" charset="UTF-8"></script>
<script src="${APP_PATH }/resources/dist2/distpicker.js" charset="UTF-8"></script>
<script type="text/javascript"
	src="${APP_PATH }/resources/js/myFollows.js"></script>
<script type="text/javascript" src="${APP_PATH }/resources/js/getOrder.js"
	charset="UTF-8"></script>
</head>
<body class="layui-layout-body">

	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">用户中心</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="../index.jsp">首页</a></li>

			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;" id="name">
						<img class="layui-nav-img" id="headpicture">
				</a></li>
				<li class="layui-nav-item"><a href="" id="logout">注销</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item"><a class="" href="javascript:;">用户信息管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="modifyUserinfo.jsp">用户信息修改</a>
							</dd>
							<dd>
								<a href="picture_upload.jsp">用户头像上传</a>
							</dd>
							<dd>
								<a href="rptInfo.jsp">用户地址信息</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">消息管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="info.jsp">查看消息</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">用户拍卖商品信息</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="publish.jsp">拍卖您的商品</a>
							</dd>
							<dd>
								<a href="myArts.jsp">查看拍品</a>
							</dd>
							<dd>
								<a href="myBidArts.jsp">竞拍过的商品</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item  layui-nav-itemed"><a href="javascript:;">用户关注</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="myFollows.jsp">拍品关注</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a
						href="javascript:;">订单管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="buyerorder.jsp?type_id=1">查看未付款订单</a>
							</dd>
							<dd>
								<a href="buyerorder.jsp?type_id=3">查看待发货订单</a>
							</dd>
							<dd>
								<a href="buyerorder.jsp?type_id=2">查看待评价订单</a>
							</dd>
							<dd>
								<a href="buyerorder.jsp?type_id=4">查看待收货订单</a>
							</dd>
							<dd>
								<a href="buyerorder.jsp?type_id=5">查看历史订单</a>
							</dd>
						</dl></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">关注列表查看</a>
				</div>
			</div>
			<!-- /.container-fluid --> </nav>
			<div class="row" style="padding-left:50px">
				<div class="col-xs-6">
					<div class="row" id="art_table"></div>
				</div>
			</div>
			<div>
				<!-- 分页文字 -->
				<div class="col-md-4" id="page_info_area"></div>
				<!-- 分页条 -->
				<div class="col-md-4" id="page_nav_area"></div>
			</div>
		</div>
		<div class="layui-footer">
			<!-- 底部固定区域 -->
			氕氘氚用户管理系统
		</div>
	</div>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;

		});
		//获取页面的session值
		var user =
	<%=session.getAttribute("USER_INFO")%>
		;
	</script>
</body>
</html>