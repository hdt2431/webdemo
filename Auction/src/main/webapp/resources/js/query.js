$(function() {
	click_query_btn();
});
function click_query_btn() {
	// alert(name);
	$(document).on(
			"click",
			"#query_btn",
			function() {
				$.ajax({
					url : "http://localhost:8080/Auction/queryArt2",
					type : "POST",
					data : $("#name").serialize(),
					success : function(result) {
						// 如果成功,转发到其他页面，否则提示内容
						if (result.extend.name == "") {
							window.location = "index.jsp";
						} else {
							window.location = "query_page.jsp?name="
									+ result.extend.name;
						}
					},
					error : function(result) {
						alert("error");
					}
				});
			});
}