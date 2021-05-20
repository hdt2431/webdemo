$(function() {
	click_login_btn();
});
function click_login_btn() {
	$(document).on("click", "#login_btn", function() {
		$.ajax({
			url : "http://localhost:8080/Auction/login",
			type : "POST",
			data : $("#login form").serialize(),
			success : function(result) {
				// 如果成功,转发到其他页面，否则提示内容
				if (result.code == 100) {
					window.location = "index.jsp";
				} else {
					alert("用户名或密码错误");
					window.location = "login.jsp";
				}
			},
			error : function(result) {
				alert(result);
				alert("error");
			}
		});
	});
}