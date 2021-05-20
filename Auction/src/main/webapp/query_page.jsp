<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<link
	href="${APP_PATH }/resources/jquery-jCountdown/jcountdown/jcountdown.css"
	rel="stylesheet">
<link rel="stylesheet" href="${APP_PATH }/resources/layui/css/layui.css">
<link
	href="${APP_PATH }/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script
	src="${APP_PATH }/resources/jquery-jCountdown/jcountdown/jquery.jcountdown.min.js"></script>
<script src="${APP_PATH }/resources/layui/layui.js"></script>
<script type="text/javascript" src="${APP_PATH }/resources/js/nav.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="${APP_PATH }/resources/js/query_page.js" charset="UTF-8"></script>
<script type="text/javascript" src="${APP_PATH }/resources/js/query.js"
	charset="UTF-8"></script>
</head>
<body style="padding-top: 50px;">
	<div class="container">
		<!-- 标题；用户信息 -->
		<div class="row">
			<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.jsp"> 拍卖 </a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">所有拍卖会 <span class="caret"></span></a>
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
		<div class="row">
			<div class="row">
				<div class="row">
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
		<div class="row">
			<h2 style="margin-top: 0;" id="title"></h2>
		</div>
		<!-- 拍品信息展示 -->
		<div class="row">
			<div class="col-xs-4"></div>
			<div class="col-xs-6">
				<div class="row" id="art_table"></div>
			</div>
			<div class="col-xs-2"></div>
		</div>
		<div>
			<!-- 分页文字 -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条 -->
			<div class="col-md-6" id="page_nav_area"></div>
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
		//获取页面的session值
		var user =
	<%=session.getAttribute("USER_INFO")%>
		;
		layui
				.use(
						[ 'util', 'laydate', 'layer' ],
						function() {
							var util = layui.util, laydate = layui.laydate, layer = layui.layer;
							//固定块
							util.fixbar({
								bar1 : true,
								bar2 : true,
								css : {
									right : 50,
									bottom : 100
								},
								bgcolor : '#393D49',
								click : function(type) {
									if (type === 'bar1') {
										layer.msg('icon是可以随便换的')
									} else if (type === 'bar2') {
										layer.msg('两个bar都可以设定是否开启')
									}
								}
							});

							//倒计时
							var thisTimer, setCountdown = function(y, M, d, H,
									m, s) {
								var endTime = new Date(y, M || 0, d || 1,
										H || 0, m || 0, s || 0) //结束日期
								, serverTime = new Date(); //假设为当前服务器时间，这里采用的是本地时间，实际使用一般是取服务端的

								clearTimeout(thisTimer);
								util.countdown(endTime, serverTime, function(
										date, serverTime, timer) {
									var str = date[0] + '天' + date[1] + '时'
											+ date[2] + '分' + date[3] + '秒'
											+ '后结束';
									lay('#test2').html(str);
									thisTimer = timer;
								});
							};
							setCountdown(2018, 5, 30, 3, 3);

							laydate.render({
								elem : '#test1',
								type : 'datetime',
								done : function(value, date) {
									setCountdown(date.year, date.month - 1,
											date.date, date.hours,
											date.minutes, date.seconds);
								}
							});

							//某个时间在当前时间的多久前
							var setTimeAgo = function(y, M, d, H, m, s) {
								var str = util.timeAgo(new Date(y, M || 0,
										d || 1, H || 0, m || 0, s || 0));
								lay('#test4').html(str);
							};

							laydate.render({
								elem : '#test3',
								type : 'datetime',
								done : function(value, date) {
									setTimeAgo(date.year, date.month - 1,
											date.date, date.hours,
											date.minutes, date.seconds);
								}
							});

						});
	</script>
</body>

</html>