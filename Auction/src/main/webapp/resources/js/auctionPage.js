layui.use([ 'util', 'laydate', 'layer' ], function() {
	var util = layui.util, laydate = layui.laydate, layer = layui.layer;
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

	// 倒计时
	var thisTimer, setCountdown = function(y, M, d, H, m, s) {
		var endTime = new Date(y, M || 0, d || 1, H || 0, m || 0, s || 0) // 结束日期
		, serverTime = new Date(); // 假设为当前服务器时间，这里采用的是本地时间，实际使用一般是取服务端的

		clearTimeout(thisTimer);
		util.countdown(endTime, serverTime, function(date, serverTime, timer) {
			var str = '倒计时' + date[0] + '天' + date[1] + '时' + date[2] + '分'
					+ date[3] + '秒';
			lay('#test1').html(str);
			thisTimer = timer;
		});
	};

	setCountdown(2018, 2, 21);

});
layui.use('carousel', function() {
	var carousel = layui.carousel;
	// 建造实例
	carousel.render({
		elem : '#a1',
		width : '100%' // 设置容器宽度
		,
		arrow : 'always' // 始终显示箭头
	// ,anim: 'updown' //切换动画方式
	});
});
layui.use('carousel', function() {
	var carousel = layui.carousel;
	// 建造实例
	carousel.render({
		elem : '#a2',
		width : '100%' // 设置容器宽度
		,
		arrow : 'always' // 始终显示箭头
	// ,anim: 'updown' //切换动画方式
	});
});
$(function() {
	show_art();
	add_50();
	now_price();
	offer_price();
	getendtime();
	build_bidarea();
});
// 快速出价50
function add_50() {
	$("#price_50").click(function() {
		var Request = undefined;
		Request = GetRequest();
		var art_id = Request["id"];
		if (user != null) {
			$.ajax({
				url : "http://localhost:8080/Auction/add_price_50",
				data : {
					art_id : art_id,
					user_id : user,
					price : $("#now_price").attr("price")
				},
				type : "POST",
				success : function(result) {
					if (result.code == 200){
						alert(result.extend.info);
					}
						
					window.location.href = "auctionPage.jsp?id=" + art_id;
				}
			});
		} else {
			alert("用户未登录");
		}
	});
}
// 显示目前出价
function now_price() {
	var Request = undefined;
	Request = GetRequest();
	var art_id = Request["id"];
	$
			.ajax({
				url : "http://localhost:8080/Auction/auction",
				data : {
					id : art_id,
				},
				type : "POST",
				success : function(result) {
					// alert(result.extend.artInfo.max_price);
					$("<h4></h4>").append(result.extend.artInfo.max_price)
							.append("元").appendTo("#now_price");
					var price = Number(result.extend.artInfo.max_price)
							+ Number(50);
					$("#now_price").attr("price",
							result.extend.artInfo.max_price);
					$("<span></span>").append(price).append("元").appendTo(
							"#price_50");
					$("<h4></h4>").append(price).append("元").appendTo(
							"#min_price");
				}
			});
}
function offer_price() {
	$("#offer_price_btn").click(function() {
		var Request = undefined;
		Request = GetRequest();
		var art_id = Request["id"];
		if (user != null) {
			$.ajax({
				url : "http://localhost:8080/Auction/offer_price",
				data : {
					art_id : art_id,
					user_id : user,
					price : $("input[ name='price']").val()
				},
				type : "POST",
				success : function(result) {
					if (result.code == 200){
						alert(result.extend.info);
					}
					window.location.href = "auctionPage.jsp?id=" + art_id;
				}
			});
		} else {
			alert("用户未登录");
		}
	});
}

// 展示当前展品信息
function show_art() {
	var Request = undefined;
	Request = GetRequest();
	var id = Request["id"];
	$.ajax({
		url : "http://localhost:8080/Auction/auction",
		data : "id=" + id,
		type : "get",
		success : function(result) {
			// 解析 显示拍品数据
		 build_image_table(result);
			buid_art_title(result);
		}
	});
}

function buid_art_title(result) {
	var art = result.extend.artInfo;
	var user = result.extend.userInfo;
	var artName = $("<h1></h1>").append(art.art_name);
	var artYears = $("<small></small>").append(" --").append(art.art_years)
			.appendTo(artName);
	$("<p></p>").append(art.art_desc).appendTo("#artDesc");
	$("#nickname").append(user.user_nickname);
	$("#phone").append(user.user_phone);
	artName.appendTo("#art_title");
}
function build_image_table(result) {
	var art = result.extend.artInfo;
	var picture= new Array();
	picture =art.picture_url.split(";");
	$.each(picture,function(index, item){
		var img = $('<img style="height: 100%">').attr("src", "."+item);
		$('<div align="center"></div>').append(img).appendTo("#x1");
	})

	layui.use('carousel', function() {
		var carousel = layui.carousel;
		// 建造实例
		carousel.render({
			elem : '#a1',
			width : '100%' // 设置容器宽度
			,
			arrow : 'always' // 始终显示箭头
		// ,anim: 'updown' //切换动画方式
		});
	});
}
function getendtime() {
	var Request = undefined;
	Request = GetRequest();
	var id = Request["id"];
	var time;
	$.ajax({
		url : "http://localhost:8080/Auction/auction",
		data : "id=" + id,
		type : "get",
		success : function(result) {
			time = new Date(result.extend.artInfo.end_time);
			var year = time.getFullYear();
			var month = time.getMonth();
			var date = time.getDate();
			var hour = time.getHours();
			var minute = time.getMinutes();
			var second = time.getSeconds();
			layui.use([ 'util','laydate'], function() {
				var laydate = layui.laydate,util = layui.util;
				var thisTimer, setCountdown = function(y, M, d, H, m, s) {
					var endTime = new Date(y, M || 0, d || 1, H || 0, m || 0, s || 0) // 结束日期
					, serverTime = new Date(); // 假设为当前服务器时间，这里采用的是本地时间，实际使用一般是取服务端的

					clearTimeout(thisTimer);
					util.countdown(endTime, serverTime, function(date, serverTime, timer) {
						var str = '倒计时' + date[0] + '天' + date[1] + '时' + date[2] + '分'
								+ date[3] + '秒';
						lay('#test1').html(str);
						thisTimer = timer;
					});
				};

				setCountdown(year, month, date,hour,minute,second);
			});
		}
	});
}
function build_bidarea() {
	var Request = undefined;
	Request = GetRequest();
	var art_id = Request["id"];
	$.ajax({
		url : "http://localhost:8080/Auction/biditem",
		data : "art_id=" + art_id,
		type : "get",
		success : function(result) {
			var bids = result.extend.bids;
			var a = 0;
			$.each(bids, function(index, item) {
				var time = getMyDate(item.bid_date);
				if(index<7){
				
				$(
						'<div class="row"><h4>竞买人' + item.user_id
								+ ' <span class="label label-default">'
								+ item.bid_price + '元</span></h4></div>')
						.appendTo("#bid_area");
				$('<div class="row"><h5>' + time + ' </h5></div>').appendTo(
						"#bid_area");
				}
				$(
						'<div class="row"><h4>竞买人' + item.user_id
								+ ' <span class="label label-default">'
								+ item.bid_price + '元</span></h4></div>')
						.appendTo("#bid_info");
				$('<div class="row"><h5>' + time + ' </h5></div>').appendTo(
						"#bid_info");
				a = a + 1;
				
			});
			if(a>7){
			var more_info = $('<a>查看全部'+a+'条拍卖信息</a>');
			more_info.appendTo("#bid_area");
			more_info.click(function() {
				$("#myModal").modal({
					backdrop : "static"
				});
			});
			}
			
		}
	});
}
// 获取拍品id
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
