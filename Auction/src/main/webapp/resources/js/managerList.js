$(function() {
	to_page(1);
	$("#check_all").click(function() {
		$(".check_item").prop("checked", $(this).prop("checked"));
	});
	$("#delete_all").click(function() {
		var manager_id = "";
		$.each($(".check_item:checked"), function() {
			manager_id += $(this).attr("manager_id") + "-";
		});
		manager_id = manager_id.substring(0, manager_id.length - 1);
		if (confirm("确认删除吗？")) {
			$.ajax({
				url : "http://localhost:8080/Auction/deletemanagerBatch",
				data : "ids=" + manager_id,
				type : "get",
				success : function(result) {
					window.location.href = "managerList.jsp";

				}
			});
		}
	});
	$(document).on("click", ".check_item", function() {
		var flag = $(".check_item:checked").length == $(".check_item").length;
		$("#check_all").prop("checked", flag);
	});
});
function to_page(pn) {
	$.ajax({
		url : "http://localhost:8080/Auction/managerList",
		data : "pn=" + pn,
		type : "GET",
		success : function(result) {
			// console.log(result);
			// 1、解析并显示员工数据
			build_manager_table(result);
			// 2、解析并显示分页信息
			build_page_info(result);
			// 3、解析显示分页条数据
			build_page_nav(result);
		}
	});
}
function build_manager_table(result) {
	// 清空table表格
	$("#manager_table tbody").empty();
	var manager = result.extend.pageInfo.list;
	$.each(manager, function(index, item) {
		var checkBox = $("<input type='checkbox' class='check_item'/>").attr(
				"manager_id", item.id);
		var checkBoxTd = $("<td></td>").append(checkBox);
		var managerIdTd = $("<td></td>").append(item.id);
		var managerNameTd = $("<td></td>").append(item.manager_name);
		var passwordTd = $("<td></td>").append(item.manager_password);
		$("<tr></tr>").append(checkBoxTd).append(managerIdTd).append(
				managerNameTd).append(passwordTd).appendTo(
				"#manager_table tbody");
	});
}
// 解析显示分页信息
function build_page_info(result) {
	$("#page_info_area").empty();
	$("#page_info_area").append(
			"当前" + result.extend.pageInfo.pageNum + "页,总"
					+ result.extend.pageInfo.pages + "页,总"
					+ result.extend.pageInfo.total + "条记录");
	totalRecord = result.extend.pageInfo.total;
	currentPage = result.extend.pageInfo.pageNum;
}
// 解析显示分页条，点击分页要能去下一页....
function build_page_nav(result) {
	// page_nav_area
	$("#page_nav_area").empty();
	var ul = $("<ul></ul>").addClass("pagination");

	// 构建元素
	var firstPageLi = $("<li></li>").append(
			$("<a></a>").append("首页").attr("href", "#"));
	var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
	if (result.extend.pageInfo.hasPreviousPage == false) {
		firstPageLi.addClass("disabled");
		prePageLi.addClass("disabled");
	} else {
		// 为元素添加点击翻页的事件
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
		nextPageLi.click(function() {
			to_page(result.extend.pageInfo.pageNum + 1);
		});
		lastPageLi.click(function() {
			to_page(result.extend.pageInfo.pages);
		});
	}

	// 添加首页和前一页 的提示
	ul.append(firstPageLi).append(prePageLi);
	// 1,2，3遍历给ul中添加页码提示
	$.each(result.extend.pageInfo.navigatepageNums, function(index, item) {

		var numLi = $("<li></li>").append($("<a></a>").append(item));
		if (result.extend.pageInfo.pageNum == item) {
			numLi.addClass("active");
		}
		numLi.click(function() {
			to_page(item);
		});
		ul.append(numLi);
	});
	// 添加下一页和末页 的提示
	ul.append(nextPageLi).append(lastPageLi);

	// 把ul加入到nav
	var navEle = $("<nav></nav>").append(ul);
	navEle.appendTo("#page_nav_area");
}