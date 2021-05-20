// 页面加载后执行绑定
$(function() {
	to_page(1);
	$("#check_all").click(function() {
		$(".check_item").prop("checked", $(this).prop("checked"));
	});
	$("#delete_all").click(function() {
		var info_id = "";
		$.each($(".check_item:checked"), function() {
			info_id += $(this).attr("info_id") + "-";
		});
		info_id = info_id.substring(0, info_id.length - 1);
		if (confirm("确认删除吗？")) {
			$.ajax({
				url : "http://localhost:8080/Auction/deleteBatch",
				data : "ids=" + info_id,
				type : "get",
				success : function(result) {
					window.location.href = "info.jsp";

				}
			});
		}
	});
});
function to_page(pn) {
	$.ajax({
		url : "http://localhost:8080/Auction/getInfoByuser_id",
		data : "pn=" + pn + "&id=" + user,
		type : "get",
		success : function(result) {
			// 解析 显示拍品数据
			build_info_table(result);
			// 解析 显示分页信息
			build_page_info(result);
			build_page_nav(result);

		}
	});
}
function GetRequest() {
	var url = location.search; // 获取url中"?"符后的字串
	var theRequest = new Object();
	if (url.indexOf("?") != -1) {
		var str = url.substr(1);
		strs = str.split("&");
		for (var i = 0; i < strs.length; i++) {
			theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
		}
	}
	return theRequest;
}
function reset_form(ele) {

	$(ele)[0].reset();
	// 清空表单样式
	$(ele).find("*").removeClass("has-error has-success");
	$(ele).find(".help-block").text("");
}
function build_info_table(result) {
	$("#info_area").empty();
	var infos = result.extend.pageInfo.list;
	$.each(infos, function(index, item) {
		var id = item.id;
		var a2 = $("<a></a>").addClass("list-group-item");
		var checkBox = $("<input type='checkbox' class='check_item'/>").attr(
				"info_id", id).appendTo(a2);
		var a = $("<a></a>").addClass("list-group-item");
		
		var title = $("<h4></h4>").addClass("list-group-item-heading").append(item.title).appendTo(a);
		var content = $("<p></p>").addClass("list-group-item-text").append(
				item.content).appendTo(a);
		var label = $('<h4 class="modal-title"></h4>').append(item.title);
		var content = $('<p class="list-group-item-text"></p>').append(item.content);
		a.click(function() {
			$.ajax({
				url : "http://localhost:8080/Auction/isread",
				data : "id=" + item.id,
				type : "get",
				success : function(result) {				
				
				}
			});
			$("#myModal2").modal({
				backdrop : "static"
			});
			$("#title_area").empty();
			label.appendTo("#title_area");
			$("#content").empty();
			content.appendTo("#content");
		})
		if (item.isread == 1){
			a.addClass("active");
			a2.addClass("active")
		}
		$("#info_area").append(a2).append(a);

	});
}
function build_page_info(result) {
	$("#page_info_area").empty();
	$("#page_info_area").append(
			"当前" + result.extend.pageInfo.pageNum + "页，总"
					+ result.extend.pageInfo.pages + "页，总"
					+ result.extend.pageInfo.total + "条记录");

}
function build_page_nav(result) {
	$("#page_nav_area").empty();
	var ul = $("<ul></ul>").addClass("pagination");
	var firstPageLi = $("<li></li>").append(
			$("<a></a>").append("首页").attr("href", "#"));
	var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
	if (result.extend.pageInfo.hasPreviousPage == false) {
		firstPageLi.addClass("disabled");
		prePageLi.addClass("disabled");
	} else {
		firstPageLi.click(function() {
			to_page(1);
		});
		prePageLi.click(function() {
			to_page(result.extend.pageInfo.pageNum - 1);
		});
	}

	var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
	var lastPageLi = $("<li></li>").append(
			$("<a></a>").append("末页").attr("href", "#"));
	if (result.extend.pageInfo.hasNextPage == false) {
		nextPageLi.addClass("disabled");
		lastPageLi.addClass("disabled");
	} else {
		lastPageLi.click(function() {
			to_page(result.extend.pageInfo.pages);
		});
		nextPageLi.click(function() {
			to_page(result.extend.pageInfo.pageNum + 1);
		});
	}

	ul.append(firstPageLi).append(prePageLi);
	$.each(result.extend.pageInfo.navigatepageNums, function(idex, item) {
		var numLi = $("<li></li>").append($("<a></a>").append(item));
		if (result.extend.pageInfo.pageNum == item) {
			numLi.addClass("active");
		}
		numLi.click(function() {
			to_page(item);
		});
		ul.append(numLi);
	});
	ul.append(nextPageLi).append(lastPageLi);
	var navEle = $("<nav></nav>").append(ul);
	navEle.appendTo("#page_nav_area");
}

// check_item
$(document).on("click", ".check_item", function() {
	// 判断当前选择中的元素是否5个
	var flag = $(".check_item:checked").length == $(".check_item").length;
	$("#check_all").prop("checked", flag);
});
