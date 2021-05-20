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
<link
	href="${APP_PATH }/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/resources/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${APP_PATH }/resources/datetimepicker/css/bootstrap-datetimepicker.min.css" />
<script
	src="${APP_PATH }/resources/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script
	src="${APP_PATH }/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${APP_PATH }/resources/layui/css/layui.css"
	media="all">
<script src="${APP_PATH }/resources/layui/layui.js" charset="UTF-8"></script>
<script type="text/javascript"
	src="${APP_PATH }/resources/js/auditing2.js" charset="UTF-8"></script>
<script type="text/javascript" src="${APP_PATH }/resources/js/getOrder.js"
	charset="UTF-8"></script>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">氕氘氚拍卖系统后台管理</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="../index.jsp">首页</a></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="../resources/images/青花瓷.jpg" class="layui-nav-img">
						管理员1
				</a></li>
				<li class="layui-nav-item"><a href="">退出</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;">拍品管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="auditing2.jsp?state_id=1">未审核拍品</a>
							</dd>
							<dd>
								<a href="auditing2.jsp?state_id=2">审核通过拍品</a>
							</dd>
							<dd>
								<a href="auditing2.jsp?state_id=5">未审核通过拍品</a>
							</dd>
							<dd>
								<a href="auditing2.jsp?state_id=4">拍卖结束拍品</a>
							</dd>
							<dd>
								<a href="auditing2.jsp?state_id=3">拍卖中的拍品</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">发布新闻</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="news2.jsp">新添新闻</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">管理员管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="managerList.jsp">管理员列表</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">拍卖管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="typeList.jsp">拍卖会列表</a>
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
					<a class="navbar-brand" href="#">拍品审核</a>
				</div>
				<button type="button"
					class="btn btn-danger navbar-btn glyphicon glyphicon-trash btn-sm"
					id="delete_all">删除</button>
			</div>
			<!-- /.container-fluid --> </nav>
			<div class="row" style="width: 700px">
				<div class="col-md-12">
					<table class="table table-hover table-bordered" id="art_table1">
						<thead>
							<tr id="tr">
								<th><input type="checkbox" id="check_all" /></th>
								<th>拍品编号</th>
								<th>拍品名称</th>
								<th>拍品类型</th>
								<th>审核状态</th>
								<th>详细信息</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-6">
					<div class="row" id="art_table"></div>
				</div>
				<div class="col-xs-2"></div>
			</div>
			<div>
				<!-- 分页文字 -->
				<div class="col-md-4" id="page_info_area"></div>
				<!-- 分页条 -->
				<div class="col-md-4" id="page_nav_area"></div>
			</div>
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			氕氘氚后台管理系统
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" >
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">加入拍卖计划</h4>
				</div>
				<div class="modal-body" id="time">
					<form class="layui-form" >
						<div class="layui-form-item date form_datetime">
							<label class="layui-form-label">开始日期</label>
							<div class="layui-input-block">
								<input type="tel" name="start_time1" lay-verify="time1"
									autocomplete="off" class="layui-input"><span
									class="add-on"><i class="icon-th"></i></span>
							</div>
						</div>
						<div class="layui-form-item date form_datetime">
							<label class="layui-form-label">结束日期</label>
							<div class="layui-input-block">
								<input type="tel" name="end_time1" lay-verify="time2"
									autocomplete="off" class="layui-input"><span
									class="add-on"><i class="icon-th"></i></span>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">选择加入拍卖会</label>
							<div class="layui-input-block">
								<select name="type" lay-filter="leixing" id="types">
									<option value="">请选择</option>
								</select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label" >选择拍品等级</label>
							<div class="layui-input-block">
								<select name="rank" lay-filter="rank">
									<option value="">请选择</option>
									<option value="黄铜">黄铜</option>
									<option value="白银">白银</option>
									<option value="黄金">黄金</option>
								</select>
							</div>
						</div>
					</form>
					<div id="submit_area"></div>
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
					<h4 class="modal-title" id="myModalLabel">拍品详细信息</h4>
				</div>
				<div class="modal-body" id="time">
					<div id="art_area"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		var manager =
	<%=session.getAttribute("Manager_INFO")%>
		;
		//JavaScript代码区域
		layui.use(['element','form'], function() {
			var element = layui.element,form = layui.form;

		});
		$(".form_datetime").datetimepicker({
			//format : "dd MM yyyy - hh:ii",
			//language : 'zh-CN',
			autoclose : true,
			todayBtn : true,
			pickerPosition : "bottom-left"
		});
	</script>
</body>
</html>