<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>这里有个拍卖网站</title>
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
<script type="text/javascript" src="${APP_PATH }/resources/js/nav.js"
	charset="UTF-8"></script>
<script type="text/javascript" src="${APP_PATH }/resources/js/query.js"
	charset="UTF-8"></script>
<script type="text/javascript" src="${APP_PATH }/resources/js/getOrder.js"
	charset="UTF-8"></script>
</head>
<body style="padding-top: 50px;">
	<div style="background: #b7c8bb; width: 100%">
		<div class="container">
			<!-- 标题；用户信息 -->
			<div class="row">
				<nav class="navbar navbar-default navbar-fixed-top">
				<div class="container-fluid container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#"> 拍卖 </a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">拍卖会 <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="PaintingAndCalligraphy.jsp?typeid=1">书画类拍卖会</a></li>
									<li><a href="Ceramic.jsp?typeid=2">陶艺瓷器类拍卖会</a></li>
									<li><a href="Jewellery.jsp?typeid=3">奇石珠宝类拍卖会</a></li>
									<li><a href="Bronzeware.jsp?typeid=4">青铜器类拍卖会</a></li>
									<li><a href="Instruments.jsp?typeid=5">乐器类拍卖会</a></li>
									<li><a href="Carving.jsp?typeid=6">雕刻类拍卖会</a></li>
								</ul></li>
						</ul>
						<form class="navbar-form navbar-left">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Search">
							</div>
							<button type="submit" class="btn btn-default" id="nav_login_info">搜索</button>
						</form>
						<ul class="nav navbar-nav navbar-right" id="nav_login_info">
							<li id="nav_auction"></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">用户中心 <span class="caret"></span></a>
								<ul class="dropdown-menu" id="nav_login">
								</ul></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid --> </nav>
			</div>
			<div class="row" style="background: #b7c8bb; width: 100%">
				<div class="row">
					<div>
						<ol class="breadcrumb">
							<li><a href="index.jsp">首页</a></li>
							<li><a href="PaintingAndCalligraphy.jsp?typeid=1">书画类拍卖会</a></li>
							<li><a href="Ceramic.jsp?typeid=2">陶艺瓷器类拍卖会</a></li>
							<li><a href="Jewellery.jsp?typeid=3">奇石珠宝类拍卖会</a></li>
							<li><a href="Bronzeware.jsp?typeid=4">青铜器类拍卖会</a></li>
							<li><a href="Instruments.jsp?typeid=5">乐器类拍卖会</a></li>
							<li><a href="Carving.jsp?typeid=6">雕刻类拍卖会</a></li>
						</ol>
					</div>
				</div>
			</div>
			<!-- 注册区 -->
			<div class="row" style="background: #b7c8bb; width: 100%">
				<div class="col-md-6">
					<div class="thumbnail" style="width: 500px; height: 500 px;">
						<form class="layui-form"
							action="http://localhost:8080/Auction/regist">
							<div class="layui-form-item">
								<label class="layui-form-label">用户名</label>
								<div class="layui-input-block">
									<input type="text" name="user_name" lay-verify="name"
										autocomplete="off" placeholder="用户名" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">密码</label>
								<div class="layui-input-block">
									<input type="password" name="user_password" lay-verify="pass"
										placeholder="请输入密码" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">昵称</label>
								<div class="layui-input-block">
									<input type="text" name="user_nickname" lay-verify="nickname"
										autocomplete="off" placeholder="昵称" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">手机</label>
								<div class="layui-input-block">
									<input type="tel" name="user_phone" lay-verify="phone"
										autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">邮箱</label>
								<div class="layui-input-block">
									<input type="email" name="email" lay-verify="email"
										autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">身份证</label>
								<div class="layui-input-block">
									<input type="text" name="IDnumber" lay-verify="IDnumber"
										placeholder="" autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">姓名</label>
								<div class="layui-input-block">
									<input type="text" name="real_name" lay-verify="real_name"
										autocomplete="off" placeholder="姓名" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">城市</label>
								<div class="layui-input-block">
									<input type="text" name="city" lay-verify="city"
										autocomplete="off" placeholder="城市" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-input-block">
									<button class="layui-btn" lay-submit="" lay-filter="register">注册</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="col-md-6" style="background: #b7c8bb">
					<div class="row"
						style="width: 80%; margin-left: auto; margin-right: auto;">
						<h1>您是新用户？</h1>
					</div>
					<div class="row"
						style="width: 80%; margin-left: auto; margin-right: auto;">
						<button type="button" class="btn btn-primary btn-lg btn-block">注册免费账号</button>
					</div>
					<div class="row"
						style="width: 80%; margin-left: auto; margin-right: auto;">
						<ul>
							<li><h3>每周逾50,000件有趣的稀奇拍品，随您出价竞拍</h3></li>
							<li><h3>委托出售您的个人收藏</h3></li>
							<li><h3>关注拍品上线时，自动接收短信提示</h3></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>
	<div style="background: black">
		<div class="container">
			<div class="row" style="text-align: center">
				<h1 style="color: white;">每周上线新奇有趣的拍卖会</h1>
			</div>
			<div class="row">
				<div class="col-md-3">
					<ul id="u1">						
					</ul>
				</div>
				<div class="col-md-3">
					<ul id="u2">					
					</ul>
				</div>
				<div class="col-md-3">
					<ul id="u3">
					</ul>
				</div>
				<div class="col-md-3">
					<ul id="u4">
					</ul>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		var user =
	<%=session.getAttribute("USER_INFO")%>
		;
		layui
				.use(
						[ 'form', 'layedit', 'laydate', 'upload' ],
						function() {
							var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate, $ = layui.jquery, upload = layui.upload;

							//日期
							laydate.render({
								elem : '#date'
							});
							laydate.render({
								elem : '#date1'
							});

							//创建一个编辑器
							var editIndex = layedit.build('LAY_demo_editor');

							//自定义验证规则
							form
									.verify({
										title : function(value) {
											if (value.length < 5) {
												return '标题至少得5个字符啊';
											}
										},
										pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
										phone : [ /^[1][3,4,5,7,8][0-9]{9}$/,
												'手机号出错' ],
										IDnumber : [
												/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,
												'身份证号码出错' ],
										content : function(value) {
											layedit.sync(editIndex);
										}
									});

							//监听指定开关
							form.on('switch(switchTest)', function(data) {
								layer.msg('开关checked：'
										+ (this.checked ? 'true' : 'false'), {
									offset : '6px'
								});
								layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
										data.othis)
							});

							//监听提交
							form.on('submit(register)', function(data) {
								var datas = data.field;
								var action = data.form.action;
								$.ajax({
									url : action,
									type : "POST",
									data : datas,
									success : function(result) {
										if (result.code == 100) {
											alert(result.msg);
											window.location = "index.jsp";
										} else {
											alert(result.msg);
											window.location = "register.jsp";
										}
									}
								});
								return false;
							});
						});
	</script>
</body>
</html>