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
<script type="text/javascript"
	src="${APP_PATH }/resources/js/getOrder.js" charset="UTF-8"></script>
</head>
<body style="padding-top: 50px;">
	<div>
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
								aria-expanded="false">所有拍卖会 <span class="caret"></span></a>
								<ul class="dropdown-menu" id="types">

								</ul></li>
						</ul>
						<form class="navbar-form navbar-left" id="name">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="您在寻找什么？"
									name="name">
							</div>
							<button class="btn btn-default" id="query_btn">搜索</button>
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
							<li class="active">首页</li>
							<li><a href="typePage.jsp?typeid=1">书画类拍卖会</a></li>
							<li><a href="typePage.jsp?typeid=2">陶艺瓷器类拍卖会</a></li>
							<li><a href="typePage.jsp?typeid=3">奇石珠宝类拍卖会</a></li>
							<li><a href="typePage.jsp?typeid=4">青铜器类拍卖会</a></li>
							<li><a href="typePage.jsp?typeid=5">乐器类拍卖会</a></li>
							<li><a href="typePage.jsp?typeid=6">雕刻类拍卖会</a></li>
						</ol>
					</div>
				</div>
			</div>
			<!-- 拍品信息展示 -->
			<div class="row">
				<h1>每周上线各种新奇拍卖会</h1>
			</div>
			<div class="row" id="warning" align="center"></div>
			<div class="row">
				<div class="col-xs-6">
					<img src="./resources/images/飞猪1.jpg" alt="青花瓷">
				</div>
				<div class="col-xs-6">
					<div class="row"
						style="width: 80%; margin-left: auto; margin-right: auto;">
						<p style="font-size: 20px;">
							<i class="layui-icon" style="font-size: 20px;">&#xe60c;</i>交易付款安全可靠
						</p>
					</div>
					<div class="row"
						style="width: 80%; margin-left: auto; margin-right: auto; margin-top: 10px;">
						<p style="font-size: 20px;">
							<i class="layui-icon" style="font-size: 20px;">&#xe60c;</i>公正监督
						</p>
					</div>
					<div class="row"
						style="width: 80%; margin-left: auto; margin-right: auto; margin-top: 10px;">
						<p style="font-size: 20px;">
							<i class="layui-icon" style="font-size: 20px;">&#xe60c;</i>物流绝对快速
						</p>
					</div>
					<div class="row"
						style="width: 80%; margin-left: auto; margin-right: auto; margin-top: 10px;">
						<button type="button"
							class="layui-btn layui-btn-normal layui-btn-radius">在我们的网站上购买</button>
					</div>
					<div class="row"
						style="width: 80%; margin-left: auto; margin-right: auto; margin-top: 10px;">
						<button type="button"
							class="layui-btn layui-btn-danger layui-btn-radius">在我们的网站上出售</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<div class="layui-carousel" id="a1">
							<div carousel-item="">
								<div align="center">
									<img src="./resources/images/书画类图片1.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/书画类图片2.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/书画类图片3.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/书画类图片4.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/书画类图片5.jpg"
										style="height: 100%; width: 100%">
								</div>
							</div>
						</div>
						<div class="caption">
							<h3>书画类拍卖</h3>
							<p>
								<a href="typePage.jsp?typeid=1" class="btn btn-primary"
									role="button">浏览拍卖会</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<div class="layui-carousel" id="a2">
							<div carousel-item="">
								<div align="center">
									<img src="./resources/images/陶艺瓷器类图片1.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/陶艺瓷器类图片2.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/陶艺瓷器类图片3.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/陶艺瓷器类图片4.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/陶艺瓷器类图片5.jpg"
										style="height: 100%; width: 100%">
								</div>
							</div>
						</div>
						<div class="caption">
							<h3>陶艺瓷器类拍卖</h3>
							<p>
								<a href="typePage.jsp?typeid=2" class="btn btn-primary"
									role="button">浏览拍卖会</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<div class="layui-carousel" id="a3">
							<div carousel-item="">
								<div align="center">
									<img src="./resources/images/奇石珠宝类图片1.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/奇石珠宝类图片2.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/奇石珠宝类图片3.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/奇石珠宝类图片4.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/奇石珠宝类图片5.jpg"
										style="height: 100%; width: 100%">
								</div>
							</div>
						</div>
						<div class="caption">
							<h3>奇石珠宝类</h3>
							<p>
								<a href="typePage.jsp?typeid=3" class="btn btn-primary"
									role="button">浏览拍卖会</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<div class="layui-carousel" id="a4">
							<div carousel-item="">
								<div align="center">
									<img src="./resources/images/青铜器类图片1.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/青铜器类图片2.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/青铜器类图片3.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/青铜器类图片4.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/青铜器类图片5.jpg"
										style="height: 100%; width: 100%">
								</div>
							</div>
						</div>
						<div class="caption">
							<h3>青铜器类</h3>
							<p>
								<a href="typePage.jsp?typeid=4" class="btn btn-primary"
									role="button">浏览拍卖会</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<div class="layui-carousel" id="a5">
							<div carousel-item="">
								<div align="center">
									<img src="./resources/images/乐器类图片1.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/乐器类图片2.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/乐器类图片3.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/乐器类图片4.jpg"
										style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/乐器类图片5.jpg"
										style="height: 100%; width: 100%">
								</div>
							</div>
						</div>
						<div class="caption">
							<h3>乐器类</h3>
							<p>
								<a href="typePage.jsp?typeid=5" class="btn btn-primary"
									role="button">浏览拍卖会</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<div class="layui-carousel" id="a6">
							<div carousel-item="">
								<div align="center">
									<img src="./resources/images/雕刻类图片1.jpg" style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/雕刻类图片2.jpg" style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/雕刻类图片3.jpg" style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/雕刻类图片4.jpg" style="height: 100%; width: 100%">
								</div>
								<div align="center">
									<img src="./resources/images/雕刻类图片5.jpg" style="height: 100%; width: 100%">
								</div>
							</div>
						</div>
						<div class="caption">
							<h3>雕刻类</h3>
							<p>
								<a href="typePage.jsp?typeid=6" class="btn btn-primary"
									role="button">浏览拍卖会</a>
							</p>
						</div>
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
	<script type="text/javascript" charset="UTF-8">
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
									var str = '倒计时' + date[0] + '天' + date[1]
											+ '时' + date[2] + '分' + date[3]
											+ '秒';
									lay('#test1').html(str);
									lay('#test2').html(str);
									lay('#test3').html(str);
									lay('#test4').html(str);
									lay('#test5').html(str);
									lay('#test6').html(str);
									thisTimer = timer;
								});
							};
							setCountdown(2018, 5, 21, 5, 5, 5);

						});
		layui.use('carousel', function() {
			var carousel = layui.carousel;
			//建造实例
			carousel.render({
				elem : '#a1',
				width : '100%' //设置容器宽度
				,
				arrow : 'always' //始终显示箭头
			//,anim: 'updown' //切换动画方式
			});
		});
		layui.use('carousel', function() {
			var carousel = layui.carousel;
			//建造实例
			carousel.render({
				elem : '#a2',
				width : '100%' //设置容器宽度
				,
				arrow : 'always' //始终显示箭头
			//,anim: 'updown' //切换动画方式
			});
		});
		layui.use('carousel', function() {
			var carousel = layui.carousel;
			//建造实例
			carousel.render({
				elem : '#a3',
				width : '100%' //设置容器宽度
				,
				arrow : 'always' //始终显示箭头
			//,anim: 'updown' //切换动画方式
			});
		});
		layui.use('carousel', function() {
			var carousel = layui.carousel;
			//建造实例
			carousel.render({
				elem : '#a4',
				width : '100%' //设置容器宽度
				,
				arrow : 'always' //始终显示箭头
			//,anim: 'updown' //切换动画方式
			});
		});
		layui.use('carousel', function() {
			var carousel = layui.carousel;
			//建造实例
			carousel.render({
				elem : '#a5',
				width : '100%' //设置容器宽度
				,
				arrow : 'always' //始终显示箭头
			//,anim: 'updown' //切换动画方式
			});
		});
		layui.use('carousel', function() {
			var carousel = layui.carousel;
			//建造实例
			carousel.render({
				elem : '#a6',
				width : '100%' //设置容器宽度
				,
				arrow : 'always' //始终显示箭头
			//,anim: 'updown' //切换动画方式
			});
		});
	</script>
</body>

</html>