$(function() {
	to_page(1);
	$("#check_all").click(function() {
		$(".check_item").prop("checked", $(this).prop("checked"));
	});
	$("#delete_all").click(function() {
		var type_id = "";
		$.each($(".check_item:checked"), function() {
			type_id += $(this).attr("type_id") + "-";
		});
		type_id = type_id.substring(0, type_id.length - 1);
		if (confirm("确认删除吗？")) {
			$.ajax({
				url : "http://localhost:8080/Auction/deletetypesBatch",
				data : "ids=" + type_id,
				type : "get",
				success : function(result) {
					window.location.href = "typeList.jsp";

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
		url : "http://localhost:8080/Auction/typelist",
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
				"type_id", item.id);
		var checkBoxTd = $("<td></td>").append(checkBox);
		var managerIdTd = $("<td></td>").append(item.id);
		var managerNameTd = $("<td></td>").append(item.type_name);
		var moreBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
		.append($("<span></span>").addClass("glyphicon glyphicon-th")).append("查看拍品");
		var btnTd = $("<td></td>").append(moreBtn);
		btnTd.click(function(){
			$("#arts").empty();
			$("#myModal2").modal({
				backdrop : "static"
			});
			$.ajax({
				url : "http://localhost:8080/Auction/typeArtlist2",
				data : {
					typeid:item.id
				},
				type : "GET",
				success : function(result) {
					$.each(result.extend.artsInfo, function(index, item) {
						var artIdTd = $("<td></td>").append(item.id);
						var artNameTd = $("<td></td>").append(item.art_name);
						var start_time = getMyDate(item.start_time);
						var end_time = getMyDate(item.end_time);
						var start_timeTd = $("<td></td>").append(start_time);
						var end_timeTd = $("<td></td>").append(end_time);
						var stateTd = $("<td></td>").append("拍卖中");
						$("<tr></tr>").append(artIdTd).append(artNameTd).append(start_timeTd).append(end_timeTd).append(stateTd).appendTo("#arts");
					})
				}
			});
		})
		$("<tr></tr>").append(checkBoxTd).append(managerIdTd).append(
				managerNameTd).append(btnTd).appendTo(
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
function getMyDate(str) {
	var oDate = new Date(str), oYear = oDate.getFullYear(), oMonth = oDate
			.getMonth() + 1, oDay = oDate.getDate(), oHour = oDate.getHours(), oMin = oDate
			.getMinutes(), oSen = oDate.getSeconds(), oTime = oYear + '-'
			+ getzf(oMonth) + '-' + getzf(oDay) + ' ' + getzf(oHour) + ':'
			+ getzf(oMin) + ':' + getzf(oSen);// 最后拼接时间
	return oTime;
};
// 补0操作
function getzf(num) {
	if (parseInt(num) < 10) {
		num = '0' + num;
	}
	return num;
}