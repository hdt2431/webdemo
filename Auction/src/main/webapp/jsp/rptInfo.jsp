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
<script type="text/javascript" src="${APP_PATH }/resources/js/getOrder.js"
	charset="UTF-8"></script>
</head>
<body class="layui-layout-body">

	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">用户头像上传</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="../index.jsp">首页</a></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;" id="name"> <img
						class="layui-nav-img" id="headpicture">
				</a>
				<li class="layui-nav-item"><a href="" id="logout" >注销</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;">用户信息管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="modifyUserinfo.jsp">用户信息修改</a>
							</dd>
							<dd>
								<a href="picture_upload.jsp">用户头像上传</a>
							</dd>
							<dd>
								<a href="javascript:;">用户地址信息</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">消息管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="info.jsp" >查看消息</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">用户拍卖商品信息</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="publish.jsp">拍卖您的商品</a>
							</dd>
							<dd>
								<a href="myAuction_good.jsp?stateId=3">查看拍品</a>
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
					<li class="layui-nav-item"><a href="javascript:;">订单管理</a>
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
			<!-- 内容主体区域 -->	<nav class="navbar navbar-default">
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
					<a class="navbar-brand" href="#">地址列表</a>
				</div>
				<button type="button" class="btn btn-default navbar-btn glyphicon glyphicon-plus btn-sm" id="address">添加地址</button>
			</div>
			<!-- /.container-fluid --> </nav>		
			<div id="rptinfo_area">
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
					<h4 class="modal-title" id="myModalLabel">添加地址</h4>
				</div>
				<div class="modal-body" id="address">
					<form action="">
						<div data-toggle="distpicker">
							<div>
								<select data-province="---- 选择省 ----" name="province"></select>
							</div>
							<div>
								<select data-city="---- 选择市 ----" name="city"></select>
							</div>
							<div>
								<select data-district="---- 选择区 ----" name="county"></select>
							</div>
						</div>
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon2">姓名</span> <input
								type="text" class="form-control" name="name"
								aria-describedby="sizing-addon2">
						</div>
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon2">手机</span> <input
								type="text" class="form-control" name="phone"
								aria-describedby="sizing-addon2">
						</div>
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon2">详细地址</span> <input
								type="text" class="form-control" name="address"
								aria-describedby="sizing-addon2">
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button class="btn btn-primary" id="submit">提交</button>
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
		$(function() {
			if (user == null) {
				window.location = "../index.jsp";
			}
			$.ajax({
				url : "http://localhost:8080/Auction/getUser",
				data : "id=" + user,
				type : "get",
				success : function(result) {
					var userData = result.extend.user;
					$("#headpicture").attr("src", ".."+userData.headURL);
					$("#name").append(userData.user_nickname);
				}
			});
			$("#logout").click(function() {
				$.ajax({
					url : "http://localhost:8080/Auction/logout",
					type : "POST",
					success : function(result) {
						window.location.href = "../index.jsp";
					}
				});
			});
			$.ajax({
				url : "http://localhost:8080/Auction/getrptInfo",
				data : "id=" + user,
				type : "get",
				success : function(result) {
					$.each(result.extend.rptInfo, function() {
						var name = $("<div></div>").addClass("form-group");				
						var name_lable = $("<label></label>").addClass("col-sm-2 control-label").append("姓名").appendTo(name);
						var name_info = $("<div></div>").addClass("col-sm-10").append("<p></p>").addClass("form-control-static")
						.append(this.name).appendTo(name);
						var phone = $("<div></div>").addClass("form-group");				
						var phone_lable = $("<label></label>").addClass("col-sm-2 control-label").append("手机").appendTo(phone);
						var phone_info = $("<div></div>").addClass("col-sm-10").append("<p></p>").addClass("form-control-static")
						.append(this.phone).appendTo(phone);
						var address = $("<div></div>").addClass("form-group");				
						var address_lable = $("<label></label>").addClass("col-sm-2 control-label").append("详细地址").appendTo(address);
						var address_info = $("<div></div>").addClass("col-sm-10").append("<p></p>").addClass("form-control-static")
						.append(this.address).appendTo(address);
						var delete_button = $('<div><button type="button" class="btn btn-primary">删除</button></div>');
						var isDefault_button = $('<h4><button type="button" class="btn btn-primary">设置为默认</button></h4>');
						var Default_button = $('<h4><span class="label label-default">默认</span></h4>');
						var id = this.id;
						delete_button.click(function(){
							$.ajax({
								url : "http://localhost:8080/Auction/deleteRptRptInfo",
								type : "POST",
								data : "id=" + id,
								success : function(result) {
									alert("succcess");
									window.location = "rptInfo.jsp";
								},
								error : function(result) {
									alert("error");
								}
							});
						});
						isDefault_button.click(function(){
							$.ajax({
								url : "http://localhost:8080/Auction/setDefault",
								type : "POST",
								data : {
									user_id: user,
									id: id
									},
								success : function(result) {
									alert("succcess");
									window.location = "rptInfo.jsp";
								},
								error : function(result) {
									alert("error");
								}
							});
						});
						if(this.is_DefaultAddress==1){
						$('<div style="width:500px;"></div>').addClass("thumbnail").append("<form></form>").addClass("form-horizontal")
						.append(name).append(phone).append(address).append(Default_button).append(delete_button).appendTo("#rptinfo_area");
						}else{
							$('<div style="width:500px;"></div>').addClass("thumbnail").append("<form></form>").addClass("form-horizontal")
							.append(name).append(phone).append(address).append(isDefault_button).append(delete_button).appendTo("#rptinfo_area");
						}
					});
				}
			});
		});
		function rptinfo_area(result){
			var rpts = result.extend.rptInfo;
			$.each(result.extend.rptInfo, function() {
				var name = $("<div></div>").addClass("form-group");				
				var name_lable = $("<label></label>").addClass("col-sm-2 control-label").append("姓名").appendTo(name);
				var name_info = $("<div></div>").addClass("col-sm-10").append("<p></p>").addClass("form-control-static")
				.append(rpts.name).appendTo(name);	
				$("<div></div>").addClass("thumbnail").append("<form></form>").addClass("form-horizontal")
				.append(name).appendTo("#rptinfo_area");
			});
		}
		
		$("#address").click(function() {
			$("#myModal").modal({
				backdrop : "static"
			});
		});
		$("#submit").click(function() {
			$.ajax({
				url : "http://localhost:8080/Auction/insertRpt",
				type : "POST",
				data : $("#address form").serialize() + "&user_id=" + user,
				success : function(result) {
					if (result.code == 100) {
						alert("成功");
						window.location = "rptInfo.jsp";
					} else {
						alert("不能为空");
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