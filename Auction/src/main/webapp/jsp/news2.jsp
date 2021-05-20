<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript"
	src="${APP_PATH }/resources/js/jquery-3.2.1.min.js"></script>
<link
	href="${APP_PATH }/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/resources/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${APP_PATH }/resources/datetimepicker/css/bootstrap-datetimepicker.min.css" />
<script
	src="${APP_PATH }/resources/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script
	src="${APP_PATH }/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${APP_PATH }/resources/layui/css/layui.css"
	media="all">
<script src="${APP_PATH }/resources/layui/layui.js" charset="UTF-8"></script>
<script type="text/javascript" src="${APP_PATH }/resources/js/getOrder.js"
	charset="UTF-8"></script>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">氕氘氚拍卖系统后台管理</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="../index.jsp">首页</a></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="../resources/images/青花瓷.jpg" class="layui-nav-img">
						管理员1
				</a></li>
				<li class="layui-nav-item"><a href="">退出</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item"><a class="" href="javascript:;">拍品管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="auditing.jsp?state_id=1">未审核拍品</a>
							</dd>
							<dd>
								<a href="auditing.jsp?state_id=2">审核通过拍品</a>
							</dd>
							<dd>
								<a href="auditing.jsp?state_id=5">未审核通过拍品</a>
							</dd>
							<dd>
								<a href="auditing2.jsp?state_id=4">拍卖结束拍品</a>
							</dd>
							<dd>
								<a href="auditing2.jsp?state_id=3">拍卖中的拍品</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item layui-nav-itemed"><a
						href="javascript:;">发布新闻</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="news2.jsp">新添新闻</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">管理员管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="managerList.jsp">管理员列表</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">拍卖管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="typeList.jsp">拍卖会列表</a>
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
					<a class="navbar-brand" href="#">添加新闻</a>
				</div>
			</div>
			<!-- /.container-fluid --> </nav>
			<div style="width: 700px; padding-left: 100px;"
				id="news">
				<form>
					<div class="form-group" style="width: 300px;">
						<label for="exampleInputEmail1">标题</label> <input
							class="form-control" name="title" placeholder="标题">
					</div>
					<div class="form-group" style="width: 300px;">
						<label for="exampleInputPassword1">类型</label> <input
							class="form-control" name="type" placeholder="类型">
					</div>
					<div class="form-group">
						<label>内容</label>
						<textarea class="form-control" rows="5" name="content"></textarea>
					</div>
					<button type="submit" class="btn btn-default" id="submit_btn">提交</button>
				</form>
			</div>
		</div>
		<div class="layui-footer">
			<!-- 底部固定区域 -->
			氕氘氚管理员管理系统
		</div>
	</div>
	<script>
		var manager =
	<%=session.getAttribute("Manager_INFO")%>
		;
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;

		});
		$(document).on("click", "#submit_btn", function() {
			$.ajax({
				url : "http://localhost:8080/Auction/insertNews",
				type : "POST",
				data : $("#news form").serialize(),
				success : function(result) {
					// 如果成功,转发到其他页面，否则提示内容
					if (result.code == 100) {
						alert("成功")
					} else {
						alert("错误");
					}
				},
				error : function(result) {
					alert("error");
				}
			});
		});
	</script>
</body>
</html>