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
	src="${APP_PATH }/resources/js/jquery-1.12.4.min.js"></script>
<link
	href="${APP_PATH }/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${APP_PATH }/resources/js/index.js" charset="UTF-8"></script>

</head>
<body>
	<!-- 登录 -->
	<div class="modal fade" id="register_Modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">用户注册</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="user_name_input">用户名</label> <input type="text"
								class="form-control" id="user_name_input" placeholder="Name"
								name="user_name"> <span class="help-block"></span>
						</div>
						<div class="form-group">
							<label for="user_password">密码</label> <input type="password"
								class="form-control" id="user_password" placeholder="Password"
								name="user_password"> <span class="help-block"></span>
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="regist_btn">注册</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<!-- 标题；用户信息 -->
		<div class="row">
			<div class="col-xs-8 col-sm-6">
				<h1>拍卖</h1>
			</div>
			<div class="col-xs-8 col-sm-6" id="register_area"></div>
		</div>
		<!-- 留白 -->
		<div class="row"></div>
		<!-- 拍品信息展示 -->
		<div class="row">
			<div id="art_table"></div>

		</div>
		<div>
			<!-- 分页文字 -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条 -->
			<div class="col-md-6" id="page_nav_area"></div>
		</div>
	</div>
	
</body>
</html>