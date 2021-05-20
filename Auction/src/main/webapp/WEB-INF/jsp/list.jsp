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
</head>
<body>
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
		<div class="row"></div>
		<!-- 拍品信息展示 -->
		<div class="row">
			<c:forEach items="${pageInfo.list }" var="arts">
				<div>
				<h4>${arts.id }</h4>
				<h4>${arts.art_name }</h4>
				</div>
			</c:forEach>

		</div>
		<div>
			<div class="col-md-6">
			
			当前${pageInfo.pageNum }页，总${pageInfo.pages }页,总${pageInfo.total }条记录
			
			</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="${APP_PATH }/Artlist?pn=1 ">首页</a></li>
					<c:if test="${pageInfo.hasPreviousPage }">
					<li><a href="${APP_PATH }/Artlist?pn=${pageInfo.pageNum-1 }" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					</c:if>
					
					<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
						<c:if test="${page_Num == pageInfo.pageNum }">
							<li class="active"><a href="#">${page_Num }</a></li>
						</c:if>
						<c:if test="${page_Num != pageInfo.pageNum }">
							<li><a href="${APP_PATH }/Artlist?pn=${page_Num }">${page_Num }</a></li>
						</c:if>
						
					</c:forEach>
					<c:if test="${pageInfo.hasNextPage }">
					<li><a href="${APP_PATH }/Artlist?pn=${pageInfo.pageNum+1 }" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
					</c:if>
					<li><a href="${APP_PATH }/Artlist?pn=${pageInfo.pages }">末页</a></li>
				</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>