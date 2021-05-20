<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link
	href="${APP_PATH }/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"
	charset="UTF-8"></script>
<script src="${APP_PATH }/resources/layui/layui.js" charset="UTF-8"></script>
<script type="text/javascript" src="${APP_PATH }/resources/js/nav.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="${APP_PATH }/resources/js/auctionPage.js" charset="UTF-8"></script>
<script type="text/javascript" src="${APP_PATH }/resources/js/query.js"
	charset="UTF-8"></script>
<script type="text/javascript" src="${APP_PATH }/resources/js/getOrder.js"
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
					<a class="navbar-brand" href="#"> 拍卖 </a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">所有拍卖会<span class="caret"></span></a>
							<ul class="dropdown-menu" id="types">

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
		<div class="row">
			<div class="row">
				<ol class="breadcrumb">
					<li><a href="index.jsp">首页</a></li>
					<li><a href="typePage.jsp?typeid=1">书画类拍卖会</a></li>
					<li><a href="typePage.jsp?typeid=2">陶艺瓷器类拍卖会</a></li>
					<li><a href="typePage.jsp?typeid=3">奇石珠宝类拍卖会</a></li>
					<li><a href="typePage.jsp?typeid=4">青铜器类拍卖会</a></li>
					<li><a href="typePage.jsp?typeid=5">乐器类拍卖会</a></li>
					<li><a href="typePage.jsp?typeid=6">雕刻类拍卖会</a></li>
				</ol>
			</div>
		</div>
		<!-- 留白 -->
		<div class="row" id="warning" align="center"></div>
		<!-- 拍品信息展示 -->
		<div class="row">
			<div class="col-md-3">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#artDesc"
						aria-controls="home" role="tab" data-toggle="tab">拍品资料</a></li>
					<li role="presentation"><a href="#profile"
						aria-controls="profile" role="tab" data-toggle="tab">卖家资料</a></li>
					<li role="presentation"><a href="#messages"
						aria-controls="messages" role="tab" data-toggle="tab">配送说明</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="artDesc"></div>
					<div role="tabpanel" class="tab-pane" id="profile">
						<form class="form-horizontal">
							<div class="form-group">
								<label class="control-label">买家昵称</label>
								<div>
									<p class="form-control-static" id="nickname"></p>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label">卖家手机</label>
								<div>
									<p class="form-control-static" id="phone"></p>
								</div>
							</div>
						</form>
					</div>
					<div role="tabpanel" class="tab-pane" id="messages">江浙沪包邮，仅限国内地区</div>
				</div>
			</div>
			<div class="col-md-6" id="art_table1">
				<div class="row jumbotron" id="art_title"></div>
				<div class="row" id="art_table">
					<div class="row">
						<div class="thumbnail">
							<div class="layui-carousel" id="a1">
								<div carousel-item="" id="x1"></div>
							</div>
							<div class="caption">
								<blockquote class="layui-elem-quote" style="margin-top: 10px;">
									<div id="test1"></div>
								</blockquote>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 竞拍出价区 -->
			<div class="col-md-3 jumbotron" style="background: #b7c8bb;">
				<div class="row"></div>
				<div class=" row">
					<div class="row">
						<span><h3>当前出价</h3></span>
					</div>
					<div class="row" id="now_price"></div>
					<div class="row">
						<span><h4>下一个最低出价</h4></span>
					</div>
					<div class="row" id="min_price"></div>
					<div class="row">
						<span><h4>快速出价</h4></span>
					</div>
					<div class="row">
						<button type="button" class="btn btn-info" id="price_50"></button>
					</div>
					<div class="row" style="padding-top: 10px">
						<div class="input-group" id="offer_price">
							<input type="text" class="form-control" name="price"> <span
								class="input-group-btn" id="price">
								<button class="layui-btn layui-btn-radius layui-btn-normal"
									type="button" id="offer_price_btn">
									<i class="layui-icon">&#xe65e;</i>直接出价
								</button>
							</span>
						</div>
					</div>
					<div class="row" id="bid_area"></div>
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
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">历史拍卖信息</h4>
				</div>
				<div class="modal-body" id="bid_info" style="text-align: center"></div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var user =
<%=session.getAttribute("USER_INFO")%>
	;
</script>

</html>