$(function() {
	if(user==null){
		$('<div class="alert alert-warning" role="alert">用户未登录，请先登录才能参与竞拍</div>').appendTo("#warning");
	}
	add_nav_info();
});
function add_nav_info() {
	build_nav_login();
	build_button();
	gettypes();
}
function gettypes(){
	$.ajax({
		url : "http://localhost:8080/Auction/typelist",
		data : "pn=1",
		type : "get",
		success : function(result) {
			var types = result.extend.typeInfo;
			$.each(types, function(index, item) {
				$("#types").append("<li><a href='typePage.jsp?typeid="+item.id+"'>"+item.type_name+"</a></li>");
			});

		}
	});
}
function build_button(){
	$('<li><a><h3 style="color: white;">关于我们</h3></a></li>').appendTo("#u1");
	$('<li><a><h5 style="color: white;">联系我们</h5></a></li>').appendTo("#u1");
	$('<li><a><h5 style="color: white;">我们的博客</h5></a></li>').appendTo("#u1");
	$('<li><a><h5 style="color: white;">网站推广计划</h5></a></li>').appendTo("#u1");
	$('<li><a href="Mlogin.jsp"><h5 style="color: white;">管理员登录</h5></a></li>').appendTo("#u1");
	$('<li><a><h3 style="color: white;">在线拍卖</h3></a></li>').appendTo("#u2");
	$('<li><a><h5 style="color: white;">所有拍卖会</h5></a></li>').appendTo("#u2");
	$('<li><a><h5 style="color: white;">稀奇物件</h5></a></li>').appendTo("#u2");
	$('<li><a><h5 style="color: white;">专家</h5></a></li>').appendTo("#u2");
	$('<li><a><h5 style="color: white;">商业操守准则</h5></a></li>').appendTo("#u2");
	$('<li><a><h3 style="color: white;">卖家指南</h3></a></li>').appendTo("#u3");
	$('<li><a><h5 style="color: white;">出售您的个人收藏品</h5></a></li>').appendTo("#u3");
	$('<li><a><h5 style="color: white;">图片提示</h5></a></li>').appendTo("#u3");
	$('<li><a><h5 style="color: white;">卖家政策</h5></a></li>').appendTo("#u3");
	$('<li><a><h3 style="color: white;">个人设置</h3></a></li>').appendTo("#u4");
	$('<li><a><h5 style="color: white;">邀请你的好友</h5></a></li>').appendTo("#u4");
	$('<li><a><h5 style="color: white;">我的喜欢列表</h5></a></li>').appendTo("#u4");
	$('<li><a><h5 style="color: white;">我的拍卖提示</h5></a></li>').appendTo("#u4");
}
function build_nav_login() {
	var login_btn = $("<button></button>").addClass("layui-btn layui-btn-normal layui-btn-radius layui-btn-fluid")
	.append("登录");
	var reigter_btn = $("<button></button>").addClass("layui-btn layui-btn-normal layui-btn-radius layui-btn-fluid")
			.append("注册");
	var logout_btn = $("<button></button>").addClass("layui-btn layui-btn-normal layui-btn-radius layui-btn-fluid").append(
			"登出");
	var show_user_btn = $("<button></button>").addClass("layui-btn layui-btn-normal layui-btn-radius layui-btn-fluid")
			.append("个人信息管理");
	login_btn.click(function() {
		window.location.href = "login.jsp";
	});
	reigter_btn.click(function() {
		window.location.href = "register.jsp";
	});
	logout_btn.click(function() {
		$.ajax({
			url : "http://localhost:8080/Auction/logout",
			type : "POST",
			success : function(result) {
				window.location.href = "index.jsp";
			}
		});
	});
	show_user_btn.click(function() {
		if (user == null) {
			alert("用户未登录");
		} else
			window.location.href = "userPage.jsp";
	});
	if (user == null) {

		$("<li></li>").append(login_btn).appendTo("#nav_login");
		$("<li></li>").addClass("divider").appendTo("#nav_login");
		$("<a>请您先登录</a>").appendTo("#nav_auction");
	} else {
		$("<li></li>").append(show_user_btn).appendTo("#nav_login");
		$("<li></li>").addClass("divider").appendTo("#nav_login");
		$("<li></li>").append(logout_btn).appendTo("#nav_login");
		$("<li></li>").addClass("divider").appendTo("#nav_login");
		$("<a href='jsp/publish.jsp'>拍卖您的商品</a>").appendTo("#nav_auction");

	}
	$("<li></li>").append(reigter_btn).appendTo("#nav_login");

}