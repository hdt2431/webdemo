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
</head>
<body>

	<a href="index.jsp">返回</a>
	<div class="container">
		<!-- 标题；用户信息 -->
		<div class="row">
			<div class="col-xs-8 col-sm-6">
				<h1>拍卖</h1>
			</div>
			<div class="col-xs-8 col-sm-6">
				<button type="button" class="btn btn-info">登录</button>
			</div>
		</div>
		<!-- 留白 -->
		<div class="row">
			<h2>${sessionScope.USER_INFO }</h2>
		</div>
		<!-- 拍品信息展示 -->
		<div class="row">
			<div id="art_table"></div>

		</div>
		<!-- 竞拍出价区 -->
		<div>
			<div class="col-md-6">
				<span>快速出价</span>
				<button type="button" class="btn btn-info" id="price_50">50</button>

			</div>
			<div class="col-md-6"></div>
		</div>
	</div>
	<script type="text/javascript">
	var user_id = '<%=session.getAttribute("USER_INFO")%>';	
	alert(user_id);
	$(function(){
			var Request=undefined; 
			Request=GetRequest(); 
			var id=Request["id"];
			alert(id);
			$.ajax({
				url : "${APP_PATH }/auction",
				data:"id="+id,
				type : "get",
				success : function(result) {
					console.log(result)
					//解析 显示拍品数据
					build_art_table(result);
				}
			});
			$("#price_50").click(function() {
				
				var Request=undefined; 
				Request=GetRequest(); 
				var art_id = Request["id"]
				if(user_id!="null"){
				$.ajax({
					url : "http://localhost:8080/Auction/add_price_50",
					data: {art_id:art_id,user_id:user_id},
					type : "POST",
					success : function(result){
						window.location.href = "auctionPage.jsp?id=" + art_id;
					}
				});
				}
				else{
					alert("用户未登录");
				}
			});
		});
	
	
		
		function GetRequest() { 
			var url = location.search; //获取url中"?"符后的字串 
			var theRequest = new Object(); 
			if (url.indexOf("?") != -1) { 
			var str = url.substr(1); 
			strs = str.split("&"); 
			for ( var i = 0; i < strs.length; i++) { 
			theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]); 
			} 
		} 
			return theRequest; 
			} 
		function build_art_table(result) {
			$("#art_table").empty();
			var art = result.extend.artInfo;
				var artId = $("<h4></h4>").append(art.id);
				var artName = $("<h4></h4>").append(art.art_name);
				var artHeat = $("<h4></h4>").append(art.heat);
				var artWinnerId = $("<h4></h4>").append(art.winner_id);
				$("<div></div>").append(artId).append(artName).append(artHeat).append(artWinnerId).appendTo(
						"#art_table");

		}	 
	</script>
</body>
</html>