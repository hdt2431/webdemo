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
<link rel="stylesheet" href="${APP_PATH }/resources/layui/css/layui.css"
	media="all">
<script src="${APP_PATH }/resources/layui/layui.js" charset="UTF-8"></script>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">氕氘氚拍卖系统后台管理</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="index.jsp">首页</a></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="./resources/images/青花瓷.jpg" class="layui-nav-img"> 管理员1
				</a></li>
				<li class="layui-nav-item"><a href="">退出</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;">拍品审核</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="jsp/auditing.jsp?state_id=1">未审核拍品</a>
							</dd>
							<dd>
								<a href="jsp/auditing.jsp?state_id=2">审核通过拍品</a>
							</dd>
							<dd>
								<a href="jsp/auditing.jsp?state_id=5">未审核通过拍品</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">发布新闻</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="jsp/news.jsp">新添新闻</a>
							</dd>
						</dl></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<div style="padding: 15px;">欢迎您管理员</div>
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			© layui.com - 底部固定区域
		</div>
	</div>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;

		});
	</script>
</body>
</html>