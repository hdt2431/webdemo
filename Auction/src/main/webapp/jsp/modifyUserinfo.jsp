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
				<li class="layui-nav-item" id="vip">会员申请</li>
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
					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;">用户信息管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">用户信息修改</a>
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
			<!-- 内容主体区域 -->
			<div style="padding: 15px; width: 700px">
				<table class="layui-table" lay-even="" lay-skin="nob">
					<colgroup>
						<col width="150">
						<col width="150">
						<col width="200">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td>用户名</td>
							<td id="username"></td>
							<td></td>
						</tr>
						<tr>
							<td>密码</td>
							<td>******</td>
							<td><a href="#myModal" id="password">修改</a></td>
						</tr>
						<tr>
							<td>昵称</td>
							<td id="nickname"></td>
							<td><a href="#myModal2" id="nickname2">修改</a></td>
						</tr>
						<tr>
							<td>手机</td>
							<td id="phone"></td>
							<td><a href="#myModal3" id="phone2">修改</a></td>
						</tr>
						<tr>
							<td>身份证</td>
							<td id="IDnumber"></td>
							<td></td>
						</tr>
						<tr>
							<td>姓名</td>
							<td id="realname"></td>
							<td></td>
						</tr>
						<tr>
							<td>城市</td>
							<td id="city"></td>
							<td><a href="#myModal4" id="city2">修改</a></td>
						</tr>
						<tr>
							<td>会员等级</td>
							<td id="rank"></td>
							<td></td>
						</tr>
					</tbody>
				</table>

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
					<h4 class="modal-title" id="myModalLabel">密码修改</h4>
				</div>
				<div class="modal-body" id="password">
					<form class="layui-form">
						<div class="layui-form-item">
							<label class="layui-form-label">旧密码</label>
							<div class="layui-input-block">
								<input type="password" name="oldPassword" placeholder="请输入密码"
									autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">新密码</label>
							<div class="layui-input-block">
								<input type="password" name="newPassword" lay-verify="pass"
									placeholder="请输入密码" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="btn btn-primary" lay-submit=""
									lay-filter="password_submit">修改</button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
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
					<h4 class="modal-title" id="myModalLabel">昵称修改</h4>
				</div>
				<div class="modal-body" id="nickname">
					<form class="layui-form">
						<div class="layui-form-item">
							<label class="layui-form-label">新昵称</label>
							<div class="layui-input-block">
								<input type="text" name="user_nickname" lay-verify="nickname"
									autocomplete="off" placeholder="昵称" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="btn btn-primary" lay-submit=""
									lay-filter="nickname_submit">修改</button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
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
					<h4 class="modal-title" id="myModalLabel">手机修改</h4>
				</div>
				<div class="modal-body" id="phone">
					<form class="layui-form">
						<div class="layui-form-item">
							<label class="layui-form-label">新手机</label>
							<div class="layui-input-block">
								<input type="tel" name="user_phone" lay-verify="phone"
									autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="btn btn-primary" lay-submit=""
									lay-filter="phone_submit">修改</button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">城市修改</h4>
				</div>
				<div class="modal-body" id="city">
					<form class="layui-form">
						<div class="layui-form-item">
							<label class="layui-form-label">新城市</label>
							<div class="layui-input-block">
								<input type="text" name="city" lay-verify="city"
									autocomplete="off" placeholder="城市" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="btn btn-primary" lay-submit=""
									lay-filter="phone_submit">修改</button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal5" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">会员申请</h4>
				</div>
				<div class="modal-body" id="deposit">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">会员说明</h3>
						</div>
						<div class="panel-body">交付押金可以升级会员等级。0-500元为黄铜会员，501-1000为白银会员，1000元以上为黄金会员。注：有些商品的竞拍会有会员等级限制</div>
					</div>
					<form>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon">￥</span> <input type="text"
									class="form-control"
									aria-label="Amount (to the nearest dollar)" name="deposit">
								<span class="input-group-addon">.00</span>
							</div>
						</div>
						<button type="submit" class="btn btn-default" id="pay">支付</button>
					</form>
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
		layui.use([ 'form', 'layedit' ], function() {
			var form = layui.form, layedit = layui.layedit;
			var editIndex = layedit.build('LAY_demo_editor');
			//自定义验证规则
			form.verify({
				title : function(value) {
					if (value.length < 5) {
						return '标题至少得5个字符啊';
					}
				},
				pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
				phone : [ /^[1][3,4,5,7,8][0-9]{9}$/, '手机号出错' ],
				IDnumber : [ /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,
						'身份证号码出错' ],
				content : function(value) {
					layedit.sync(editIndex);
				}
			});
			$("#pay").click(function() {
				$.ajax({
					url : "http://localhost:8080/Auction/updateDeposit",
					type : "POST",
					data : $("#deposit form").serialize() + "&id=" + user,
					success : function(result) {
						if (result.code == 100) {
							alert("成功");
							window.location = "modifyUserinfo.jsp";
						} else {
							alert("不能为空");
						}
					}
				});
				form.on('submit(nickname_submit)', function(data) {
					$.ajax({
						url : "http://localhost:8080/Auction/updateNickname",
						type : "POST",
						data : $("#nickname form").serialize() + "&id=" + user,
						success : function(result) {
							if (result.code == 100) {
								alert("成功");
								window.location = "modifyUserinfo.jsp";
							} else {
								alert("不能为空");
							}
						},
						error : function(result) {
							alert("error");
						}
					});
					return false;
				});
				form.on('submit(password_submit)', function(data) {
					$.ajax({
						url : "http://localhost:8080/Auction/updatePassword",
						type : "POST",
						data : $("#password form").serialize() + "&id=" + user,
						success : function(result) {
							// 如果成功,转发到其他页面，否则提示内容
							if (result.code == 100) {
								alert("成功");
								window.location = "modifyUserinfo.jsp";
							} else {
								alert("密码错误");
							}
						},
						error : function(result) {
							alert("error");
						}
					});
					return false;
				});
				form.on('submit(phone_submit)', function(data) {
					$.ajax({
						url : "http://localhost:8080/Auction/updateCity",
						type : "POST",
						data : $("#city form").serialize() + "&id=" + user,
						success : function(result) {
							if (result.code == 100) {
								alert("成功");
								window.location = "modifyUserinfo.jsp";
							} else {
								alert("不能为空");
							}
						},
						error : function(result) {
							alert("error");
						}
					});
					return false;
				});
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
						$("#username").text(userData.user_name);
						$("#nickname").text(userData.user_nickname);
						$("#phone").text(userData.user_phone);
						$("#IDnumber").text(userData.idnumber);
						$("#realname").text(userData.real_name);
						$("#city").text(userData.city);
						$("#rank").text(userData.rank);
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
			});
			$("#password").click(function() {
				$("#myModal").modal({
					backdrop : "static"
				});
			});
			$("#nickname2").click(function() {
				$("#myModal2").modal({
					backdrop : "static"
				});
			});
			$("#phone2").click(function() {
				$("#myModal3").modal({
					backdrop : "static"
				});
			});
			$("#city2").click(function() {
				$("#myModal4").modal({
					backdrop : "static"
				});
			});
			$("#vip").click(function() {
				$("#myModal5").modal({
					backdrop : "static"
				});
			});
		});
	</script>
</body>
</html>