layui
		.use(
				[ 'util', 'laydate', 'layer', 'form' ],
				function() {
					var util = layui.util, laydate = layui.laydate, layer = layui.layer, form = layui.form;
					// 固定块
					util.fixbar({
						bar1 : true,
						bar2 : true,
						css : {
							right : 50,
							bottom : 100
						},
						bgcolor : '#393D49',
						click : function(type) {
							if (type === 'bar1') {
								layer.msg('icon是可以随便换的')
							} else if (type === 'bar2') {
								layer.msg('两个bar都可以设定是否开启')
							}
						}
					});
					form.on('switch(switchTest)', function(data) {
						layer.msg('开关checked：'
								+ (this.checked ? 'true' : 'false'), {
							offset : '6px'
						});
						layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
								data.othis)
					});
					form.render();
					// 倒计时
					var thisTimer, setCountdown = function(y, M, d, H, m, s) {
						var endTime = new Date(y, M || 0, d || 1, H || 0,
								m || 0, s || 0) // 结束日期
						, serverTime = new Date(); // 假设为当前服务器时间，这里采用的是本地时间，实际使用一般是取服务端的

						clearTimeout(thisTimer);
						util.countdown(endTime, serverTime, function(date,
								serverTime, timer) {
							var str = date[0] + '天' + date[1] + '时' + date[2]
									+ '分' + date[3] + '秒' + '后结束';
							lay('#test2').html(str);
							thisTimer = timer;
						});
					};
					setCountdown(2018, 5, 30, 3, 3);

					laydate.render({
						elem : '#test1',
						type : 'datetime',
						done : function(value, date) {
							setCountdown(date.year, date.month - 1, date.date,
									date.hours, date.minutes, date.seconds);
						}
					});

					// 某个时间在当前时间的多久前
					var setTimeAgo = function(y, M, d, H, m, s) {
						var str = util.timeAgo(new Date(y, M || 0, d || 1,
								H || 0, m || 0, s || 0));
						lay('#test4').html(str);
					};

					laydate.render({
						elem : '#test3',
						type : 'datetime',
						done : function(value, date) {
							setTimeAgo(date.year, date.month - 1, date.date,
									date.hours, date.minutes, date.seconds);
						}
					});

				});
// 页面加载后执行绑定
$(function() {
	gettypes2();
	 getAllnews();
	to_page(1);
	
});
function to_page(pn) {
	var Request = undefined;
	Request = GetRequest();
	var typeid = Request["typeid"];
	$.ajax({
		url : "http://localhost:8080/Auction/typeArtlist",
		data : {
			pn : pn,
			typeid : typeid,
			state_id : 3,
		},
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
function getAllnews(){
	$.ajax({
		url : "http://localhost:8080/Auction/getAllnews",
		type : "get",
		success : function(result) {
			var news = result.extend.newsInfo;
			$.each(news,function(index, item){
				var box = $('<div class="panel panel-info"></div>')
				.append('<div class="panel-heading"><h3 class="panel-title">'+item.title+'</h3></div>')
				.append('<div class="panel-body">'+item.content+'</div>').appendTo("#news_area");
			})
		}
	});
}
function gettypes2(){
	var Request = undefined;
	Request = GetRequest();
	var typeid = Request["typeid"];
	$.ajax({
		url : "http://localhost:8080/Auction/gettype",
		data : "typeid="+typeid,
		type : "get",
		success : function(result) {
			var types = result.extend.typeInfo;
			$("#title").append(types.type_name);
			$("#title2").append('<h2 style="margin-top: 0;">'+types.type_name+'拍卖会</h2>');
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
						var image = $('<img  class="img-rounded img-responsive">').attr("src", "."+picture[0]);
						var artId = $("<h3></h3>").append(item.art_name);
						var now = new Date();
						var time2 = new Date(item.end_time);
						var year = time2.getFullYear();
						var month = time2.getMonth();
						var date = time2.getDate();
						var hour = time2.getHours();
						var minute = time2.getMinutes();
						var second = time2.getSeconds();
						var time = $('<blockquote class="layui-elem-quote" style="margin-top: 10px;"><div id="x1'+index+'"></div></blockquote>');
						layui.use([ 'util','laydate'], function() {
							var laydate = layui.laydate,util = layui.util;
							var thisTimer, setCountdown = function(y, M, d, H, m, s) {
								var endTime = new Date(y, M || 0, d || 1, H || 0, m || 0, s || 0) // 结束日期
								, serverTime = new Date(); // 假设为当前服务器时间，这里采用的是本地时间，实际使用一般是取服务端的

								clearTimeout(thisTimer);
								util.countdown(endTime, serverTime, function(date, serverTime, timer) {
									var str = '倒计时' + date[0] + '天' + date[1] + '时' + date[2] + '分'
											+ date[3] + '秒';
									lay('#x1'+index+'').html(str);
									thisTimer = timer;
								});
							};

							setCountdown(year, month, date,hour,minute,second);
						});
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
						var a3 = $("<div></div>").addClass("col-xs-6")
								.appendTo(a2);
						var a4 = $("<div></div>").addClass("col-xs-4")
								.appendTo(a2);
						var a5 = $("<div></div>").addClass("col-xs-3")
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
						var loveBtn1 = $('<button type="button" class="btn btn-danger glyphicon glyphicon-heart">关注</button>');
						var loveBtn2 = $('<button type="button" class="btn btn-danger glyphicon glyphicon-heart">已关注</button>');

						if (user != null) {
							$.ajax({
										url : "http://localhost:8080/Auction/isFollowed",
										type : "get",
										data : {
											art_id :item.id,
											user_id :user
										},
										success : function(result) {
											if(result.code==100){
												var show = $("<div></div>").addClass("row").append(
												"<div></div>").addClass("row").append(
												"<div></div>").addClass("thumbnail").append(
												"<div></div>").addClass("caption").append(
												loveBtn2).append(a1).append(a6).append(a2)
												.appendTo(art_table);
											}else{
												var show = $("<div></div>").addClass("row").append(
												"<div></div>").addClass("row").append(
												"<div></div>").addClass("thumbnail").append(
												"<div></div>").addClass("caption").append(
												loveBtn1).append(a1).append(a6).append(a2)
												.appendTo(art_table);
											}
										}
									});
						} else {
							var show = $("<div></div>").addClass("row").append(
							"<div></div>").addClass("row").append(
							"<div></div>").addClass("thumbnail").append(
							"<div></div>").addClass("caption").append(
							loveBtn1).append(a1).append(a6).append(a2)
							.appendTo(art_table);
						}
						image.css({
							"height" : "170px"
						}).appendTo(image_table);
						$("<div></div>").addClass("row").css({
							"width" : "1000px",
							"height" : "300px"
						}).append(art_table).append(image_table).appendTo(
								"#art_table");

						loveBtn1.click(function() {
									if (user != null) {
										$.ajax({
													url : "http://localhost:8080/Auction/insertFollow",
													type : "get",
													data : {
														art_id :item.id,
														user_id :user
													},
													success : function(result) {
														if(result.code==100){
															window.location.href = "./typePage.jsp?typeid="
																+ item.arttype_id;
														}
													}
												});
									} else {
										alert("用户未登录");
									}
								});
						loveBtn2.click(function() {{
							if (confirm("确认取消关注吗？")) {	
							$.ajax({
											url : "http://localhost:8080/Auction/deleteFollowed",
											type : "get",
											data : {
												art_id :item.id,
												user_id :user
											},
											success : function(result) {
												if(result.code==100){
													window.location.href = "./typePage.jsp?typeid="
														+ item.arttype_id;
												}
											}
										});
							}
						}
						});
						// 参与竞拍点击事件
						editBtn
								.click(function() {
									$
											.ajax({
												url : "http://localhost:8080/Auction/add_heat",
												data : "id=" + item.id,
												type : "get",
												success : function(result) {
													window.location.href = "./auctionPage.jsp?id="
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
