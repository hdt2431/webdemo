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
	to_page(1);
});
function to_page(pn) {
	var Request = undefined;
	Request = GetRequest();
	var stateId = Request["stateId"];
	$.ajax({
		url : "http://localhost:8080/Auction/getMyBidArts",
		data : {
			pn : pn,
			user_id : user,
		},
		type : "get",
		success : function(result) {
			// 解析 显示拍品数据
			build_arts_table(result);
			// 解析 显示分页信息
			build_page_info(result);
			build_page_nav(result);

		}
	});
}
function build_arts_table(result) {
	$("#art_table").empty();
	$("#image_table").empty();
	var arts = result.extend.pageInfo.list;
	$
			.each(
					arts,
					function(index, item) {
						var a = item.picture_url;
						var picture= new Array();
						picture =a.split(";");
						var image = $('<img  class="img-rounded img-responsive">').attr("src", ".."+picture[0]);
						var artId = $("<h3></h3>").append(item.art_name);
						var now = new Date();
						var date = getMyDate(item.end_time);

						var time = $("<h4></h4>").append(date).append("结束");
						var artName = $("<small></small>").append(" --")
								.append(item.art_years).appendTo(artId);
						var editBtn = $("<button></button>").addClass(
								"layui-btn layui-btn-normal").append("参与竞拍");
						var a1 = $("<div></div>").addClass("row").css({
							"text-align" : "center"
						});
						var a2 = $("<div></div>").addClass("row").css({
							"text-align" : "center"
						});
						var a3 = $("<div></div>").addClass("col-xs-4")
								.appendTo(a2);
						var a4 = $("<div></div>").addClass("col-xs-4")
								.appendTo(a2);
						var a5 = $("<div></div>").addClass("col-xs-4")
								.appendTo(a2);
						var a6 = $("<div></div>").addClass("row").append(
								"<h4></h4>").append("详情请点击参与竞拍").css({
							"height" : "70px",
							"text-align" : "center"
						});
						artId.appendTo(a1);
						if (now > item.end_time) {
							$("<h4>已结束</h4>").appendTo(a3);
							$
									.ajax({
										url : "http://localhost:8080/Auction/insertOrder2",
										type : "get",
										data : "id=" + item.id,
										success : function(result) {
										}
									});
						} else {
							time.appendTo(a3);
							editBtn.appendTo(a5);
						}
						var art_table = $("<div></div>").addClass("col-xs-6");
						// art_table.style.backgroundColor = "red";
						var image_table = $("<div></div>").addClass("col-xs-6");

						var show = $("<div></div>").addClass("row").append(
								"<div></div>").addClass("row").append(
								"<div></div>").addClass("thumbnail").append(
								"<div></div>").addClass("caption").append(a1)
								.append(a6).append(a2).appendTo(art_table);
						image.css({
							"height" : "170px"
						}).appendTo(image_table);
						$("<div></div>").addClass("row").css({
							"width" : "1000px",
							"height" : "300px"
						}).append(art_table).append(image_table).appendTo(
								"#art_table");
						// 参与竞拍点击事件
						editBtn
								.click(function() {
									$
											.ajax({
												url : "http://localhost:8080/Auction/add_heat",
												data : "id=" + item.id,
												type : "get",
												success : function(result) {
													window.location.href = "../auctionPage.jsp?id="
															+ item.id;
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
function getMyDate(str){  
    var oDate = new Date(str),  
    oYear = oDate.getFullYear(),  
    oMonth = oDate.getMonth()+1,  
    oDay = oDate.getDate(),  
    oHour = oDate.getHours(),  
    oMin = oDate.getMinutes(),  
    oSen = oDate.getSeconds(),  
    oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间  
    return oTime;  
}; 
//补0操作
function getzf(num){  
  if(parseInt(num) < 10){  
      num = '0'+num;  
  }  
  return num;  
}