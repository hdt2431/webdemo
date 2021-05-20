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
	src="${APP_PATH }/resources/js/buyerorder.js"></script>
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
				<li class="layui-nav-item"><a href="javascript:;" id="name"> <img
						class="layui-nav-img" id="headpicture"> 
				</a>
					</li>
				<li class="layui-nav-item"><a href="" id="logout">注销</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item"><a class=""
						href="javascript:;">用户信息管理</a>
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
					<li class="layui-nav-item"><a href="javascript:;">用户关注</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="myFollows.jsp">拍品关注</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item layui-nav-itemed"><a href="javascript:;">订单管理</a>
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
					<a class="navbar-brand" href="#">订单列表</a>
				</div>
				<button type="button"
					class="btn btn-danger navbar-btn glyphicon glyphicon-trash btn-sm"
					id="delete_all">删除</button>
			</div>
			<!-- /.container-fluid --> </nav>
			<div class="row" style="width: 1000px">
				<div class="col-md-12">
					<table class="table table-hover table-bordered" id="art_table1">
						<thead>
							<tr id="tr">
								<th><input type="checkbox" id="check_all" /></th>
								<th>订单编号</th>
								<th>拍品名称</th>
								<th>成交价格</th>
								<th>成交时间</th>
								<th>订单状态</th>
								<th>详细信息</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="layui-footer">
			<!-- 底部固定区域 -->
			氕氘氚用户管理系统
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">填写物流</h4>
				</div>
				<div class="modal-body" id="logistics">
					<form action="">
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon2">物流公司</span> <input
								type="text" class="form-control" name="logistics_company"
								aria-describedby="sizing-addon2">
						</div>
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon2">物流单号</span> <input
								type="text" class="form-control" name="logistics_number"
								aria-describedby="sizing-addon2">
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button class="btn btn-primary" id="submit">确认提交</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">评论</h4>
				</div>
				<div class="modal-body" id="comment">
					<form action="">
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon2">内容</span> <input
								type="text" class="form-control" name="comment"
								aria-describedby="sizing-addon2">
						</div>					
					</form>
				</div>

				<div class="modal-footer">
					<button class="btn btn-primary" id="submit2">确认提交</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">订单详细信息</h4>
				</div>
				<div class="modal-body" id="time">
					<div id="order_area"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
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