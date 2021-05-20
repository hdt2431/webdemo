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
<script type="text/javascript" src="${APP_PATH }/resources/js/login.js"
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
							<button type="submit" class="btn btn-default" id="query_btn">搜索</button>
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
					
						<ol class="breadcrumb">
							<li><a href="index.jsp">首页</a></li>
							<li><a href="PaintingAndCalligraphy.jsp?typeid=1">书画类拍卖会</a></li>
							<li><a href="Ceramic.jsp?typeid=2">陶艺瓷器类拍卖会</a></li>
							<li><a href="Jewellery.jsp?typeid=3">奇石珠宝类拍卖会</a></li>
							<li><a href="Bronzeware.jsp?typeid=4">青铜器类拍卖会</a></li>
							<li><a href="Instruments.jsp?typeid=5">乐器类拍卖会</a></li>
							<li><a href="Carving.jsp?typeid=6">雕刻类拍卖会</a></li>
						</ol>
					<div class="col-md-4 col-sm-6"></div>

					<div class="col-md-4 col-sm-6"></div>
				</div>
			</div>
			<!-- 登录区 -->
			<div class="row" style="background: #b7c8bb; width: 100%">
				<div class="col-md-6">
					<div class="row">
						<div class="thumbnail" style="width: 500px; height: 350px;">
							<div class="row"
								style="width: 80%; margin-left: auto; margin-right: auto;">
								<h1>已有注册账号？</h1>

							</div>
							<div class="caption row" id="login">
								<form style="width: 80%; margin-left: auto; margin-right: auto;">
									<div class="form-group">
										<input type="text" class="form-control" id="user_name"
											placeholder="用户名" name="user_name">
									</div>
									<div class="form-group">
										<input type="password" class="form-control"
											id="exampleInputPassword1" placeholder="密码"
											name="user_password">
									</div>
								</form>
								<div style="width: 80%; margin-left: auto; margin-right: auto;">
									<button id="login_btn" class="btn btn-info btn-lg">登录</button>
								</div>
							</div>
						</div>
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
	</script>
</body>

</html>