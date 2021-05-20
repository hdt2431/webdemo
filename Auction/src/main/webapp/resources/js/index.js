
// 页面加载后执行绑定
$(function() {
	to_page(1);
});
function to_page(pn) {

	$.ajax({
		url : "http://localhost:8080/Auction/Artlist",
		data : "pn=" + pn,
		type : "get",
		success : function(result) {
			// 解析 显示拍品数据
			build_arts_table(result);
			// 解析 显示分页信息
			// build_page_info(result);
			build_page_nav(result);

		}
	});
}
function reset_form(ele) {

	$(ele)[0].reset();
	// 清空表单样式
	$(ele).find("*").removeClass("has-error has-success");
	$(ele).find(".help-block").text("");
}
function build_arts_table(result) {
	$("#art_table").empty();
	$("#image_table").empty();
	var arts = result.extend.pageInfo.list;
	$.each(arts, function(index, item) {
		var image = $('<img src="./resources/images/青花瓷.jpg" alt="青花瓷"  class="img-rounded img-responsive">');
		var artId = $("<h3></h3>").append(item.art_name);	
		var time = $("<h4></h4>").append("今天21点结束");
		var artName = $("<small></small>").append(" --").append(item.art_years).appendTo(artId);
		var editBtn = $("<button></button>").addClass(
				"layui-btn layui-btn-normal")
				.append("参与竞拍");
		var a1 = $("<div></div>").addClass("row").css({"text-align": "center"});
		var a2 = $("<div></div>").addClass("row").css({"text-align": "center"});
		var a3 = $("<div></div>").addClass("col-xs-4").appendTo(a2);
		var a4 = $("<div></div>").addClass("col-xs-4").appendTo(a2);
		var a5 = $("<div></div>").addClass("col-xs-4").appendTo(a2);
		var a6 = $("<div></div>").addClass("row").append("<h4></h4>")
		.append("详情请点击参与竞拍").css({"height": "70px","text-align": "center"});
		artId.appendTo(a1);
		time.appendTo(a3);
		editBtn.appendTo(a5);
		var art_table = $("<div></div>").addClass("col-xs-6");
		// art_table.style.backgroundColor = "red";
		var image_table = $("<div></div>").addClass("col-xs-6");
		
		var show = $("<div></div>").addClass("row")
		.append("<div></div>").addClass("row")
		.append("<div></div>").addClass("thumbnail")
		.append("<div></div>").addClass("caption")
		.append(a1).append(a6).append(a2)
				.appendTo(art_table);
		image.css({"height":"170px"}).appendTo(image_table);
		$("<div></div>").addClass("row")
		.css({"width":"1000px","height":"200px"})
		.append(art_table).append(image_table)
		.appendTo("#art_table");
		// 参与竞拍点击事件
		editBtn.click(function() {
			$.ajax({
				url : "http://localhost:8080/Auction/add_heat",
				data : "id=" + item.id,
				type : "get",
				success : function(result) {
					window.location.href = "./auctionPage.jsp?id=" + item.id;
				}
			});

		})
	})
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


