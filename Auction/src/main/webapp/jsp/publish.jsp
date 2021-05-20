<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=UTF-8;multipart/form-data">
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
<link
	href="${APP_PATH }/resources/bootstrap-fileinput-master/css/fileinput.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"
	charset="UTF-8"></script>
<script src="${APP_PATH }/resources/layui/layui.js" charset="UTF-8"></script>
<script
	src="${APP_PATH }/resources/bootstrap-fileinput-master/js/fileinput.js"
	charset="UTF-8"></script>
<script
	src="${APP_PATH }/resources/bootstrap-fileinput-master/js/locales/zh.js"
	charset="UTF-8"></script>
<script type="text/javascript" src="${APP_PATH }/resources/js/getOrder.js"
	charset="UTF-8"></script>
</head>
<body class="layui-layout-body">

	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">用户商品拍卖</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="../index.jsp">首页</a></li>
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
					<li class="layui-nav-item"><a class="" href="javascript:;">用户信息管理</a>
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
					<li class="layui-nav-item  layui-nav-itemed"><a
						href="javascript:;">用户拍卖商品信息</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">拍卖您的商品</a>
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
			<div class="col-md-6">
				<div class="thumbnail" style="width: 1000px; height: 500 px;">
					<form class="layui-form"
						action="http://localhost:8080/Auction/publish"
						enctype="multipart/form-data">
						<div class="layui-form-item">
							<label class="layui-form-label">名称</label>
							<div class="layui-input-block">
								<input type="text" name="art_name" lay-verify="name"
									autocomplete="off" placeholder="" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">备注</label>
							<div class="layui-input-block">
								<input type="texts" name="art_remark" lay-verify="remark"
									placeholder="" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">描述</label>
							<div class="layui-input-block">
								<input type="text" name="art_desc" lay-verify="desc"
									autocomplete="off" placeholder="" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">年份</label>
							<div class="layui-input-block">
								<input type="tel" name="art_years" lay-verify="years"
									autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">起拍价</label>
							<div class="layui-input-block">
								<input type="text" name="init_price" lay-verify="price"
									placeholder="" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">类型</label>
							<div class="layui-input-block">
								<select name="type" lay-filter="leixing">
									<option value="">请选择</option>
									<option value="1">书画类</option>
									<option value="2">陶艺瓷器类</option>
									<option value="3">奇石珠宝类</option>
									<option value="4">青铜器类</option>
									<option value="5">乐器类</option>
									<option value="6">雕刻类</option>
								</select>
							</div>
						</div>
						<input type="hidden" value="" id="picture" name="picture_url">
						<input type="hidden" value="" id="user" name="owner_id">
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn" lay-submit="" lay-filter="submit1">提交</button>
							</div>
						</div>

					</form>
					<div class="file-loading">
						<input id="input-700" name="kartik-input-700[]" type="file"
							multiple>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-footer">
			<!-- 底部固定区域 -->
			氕氘氚用户管理系统
		</div>
	</div>
	<script>
		//获取页面的session值
		var user =
	<%=session.getAttribute("USER_INFO")%>
		;
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;

		});
		$(function() {
			var name = "";
			$("#input-700").fileinput({
				uploadUrl : "http://localhost:8080/Auction/uploadArtpicture",
				maxFileCount : 5,
				allowedFileExtensions : [ 'jpg', 'gif', 'png' ],
				uploadExtraData : {
					"id" : user
				},
				language : 'zh'
			}).on("fileuploaded", function(event, data, previewId, index) {
				var result = data.response;
				name = name + result.extend.name + ";";
				$("#picture").val(name);
			});
			$("#user").val(user);
		});

		layui
				.use(
						[ 'form', 'layedit', 'laydate', 'upload', 'carousel' ],
						function() {
							var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate, $ = layui.jquery, upload = layui.upload, carousel = layui.carousel;

							//轮播

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

							//监听提交
							form.on('submit(submit1)', function(data) {
								var datas = data.field;
								var action = data.form.action;
								$.ajax({
									url : action,
									type : "POST",
									data : datas,
									success : function(result) {
										if (result.code == 100) {
											alert(result.msg);
											window.location = "publish.jsp";
										} else {
											alert(result.msg);
										}
									}
								});
								return false;
							});
						});
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
		});
	</script>
</body>
</html>