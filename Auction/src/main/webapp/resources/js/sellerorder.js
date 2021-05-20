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
			$("#headpicture").attr("src", "../images/111.jpg");
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
	var Request = undefined;
	Request = GetRequest();
	var type_id = Request["type_id"];
	$
			.ajax({
				url : "http://localhost:8080/Auction/getOrderByBuerIdandTypeId",
				data : {
					id : user,
					typeid : type_id
				},
				type : "get",
				success : function(result) {

					$
							.each(
									result.extend.OrderInfo,
									function() {
										$
												.ajax({
													url : "http://localhost:8080/Auction/auction",
													type : "get",
													data : {
														id : this.artId

													},
													success : function(result) {
														var art = result.extend.artInfo;
														var seller = result.extend.owner;
														var buyer = result.extend.winer;
														var rptinfo = result.extend.rInformation;
														var artname = $(
																"<div></div>")
																.addClass(
																		"form-group");
														var artname_lable = $(
																"<label></label>")
																.addClass(
																		"col-sm-2 control-label")
																.append("商品名")
																.appendTo(
																		artname);
														var artname_info = $(
																"<div></div>")
																.addClass(
																		"col-sm-10")
																.append(
																		"<p>"
																				+ art.art_name
																				+ "</p>")
																.addClass(
																		"form-control-static")
																.appendTo(
																		artname);
														var price = $(
																"<div></div>")
																.addClass(
																		"form-group");
														var price_lable = $(
																"<label></label>")
																.addClass(
																		"col-sm-2 control-label")
																.append("成交价")
																.appendTo(price);
														var price_info = $(
																"<div></div>")
																.addClass(
																		"col-sm-10")
																.append(
																		"<p>"
																				+ art.max_price
																				+ "元"
																				+ "</p>")
																.addClass(
																		"form-control-static")
																.appendTo(price);
														var sellername = $(
																"<div></div>")
																.addClass(
																		"form-group");
														var sellername_lable = $(
																"<label></label>")
																.addClass(
																		"col-sm-2 control-label")
																.append("卖家昵称")
																.appendTo(
																		sellername);
														var sellername_info = $(
																"<div></div>")
																.addClass(
																		"col-sm-10")
																.append(
																		"<p>"
																				+ seller.user_nickname
																				+ "</p>")
																.addClass(
																		"form-control-static")
																.appendTo(
																		sellername);
														var phone = $(
																"<div></div>")
																.addClass(
																		"form-group");
														var phone_lable = $(
																"<label></label>")
																.addClass(
																		"col-sm-2 control-label")
																.append(
																		"卖家联系方式")
																.appendTo(phone);
														var phone_info = $(
																"<div></div>")
																.addClass(
																		"col-sm-10")
																.append(
																		"<p>"
																				+ seller.user_phone
																				+ "</p>")
																.addClass(
																		"form-control-static")
																.appendTo(phone);
														var buyername = $(
																"<div></div>")
																.addClass(
																		"form-group");
														var buyername_lable = $(
																"<label></label>")
																.addClass(
																		"col-sm-2 control-label")
																.append("买家昵称")
																.appendTo(
																		buyername);
														var buyername_info = $(
																"<div></div>")
																.addClass(
																		"col-sm-10")
																.append(
																		"<p>"
																				+ buyer.user_nickname
																				+ "</p>")
																.addClass(
																		"form-control-static")
																.appendTo(
																		buyername);
														var phone2 = $(
																"<div></div>")
																.addClass(
																		"form-group");
														var phone2_lable = $(
																"<label></label>")
																.addClass(
																		"col-sm-2 control-label")
																.append(
																		"买家联系方式")
																.appendTo(
																		phone2);
														var phone2_info = $(
																"<div></div>")
																.addClass(
																		"col-sm-10")
																.append(
																		"<p>"
																				+ buyer.user_phone
																				+ "</p>")
																.addClass(
																		"form-control-static")
																.appendTo(
																		phone2);
														var artname1 = $(
																"<div></div>")
																.addClass(
																		"form-group");
														var artname1_lable = $(
																"<label></label>")
																.addClass(
																		"col-sm-2 control-label")
																.append("买家地址")
																.appendTo(
																		artname1);
														var artname1_info = $(
																"<div></div>")
																.addClass(
																		"col-sm-10")
																.append(
																		"<p>"
																				+ rptinfo.address
																				+ "</p>")
																.addClass(
																		"form-control-static")
																.appendTo(
																		artname1);
														var pay_button = $('<button type="button" class="btn btn-primary">付款</button>');
														pay_button
																.click(function() {
																	alert(111);
																});
														table
																.append(artname)
																.append(price)
																.append(
																		sellername)
																.append(phone)
																.append(
																		buyername)
																.append(phone2)
																.append(artname1)
																.append(
																		pay_button);

													},
													error : function(result) {
														alert("error");
													}
												});

										var name = $("<div></div>").addClass(
												"form-group");
										var name_lable = $("<label></label>")
												.addClass(
														"col-sm-2 control-label")
												.append("商品id").appendTo(name);
										var name_info = $("<div></div>")
												.addClass("col-sm-10")
												.append(
														"<p>" + this.artId
																+ "</p>")
												.addClass("form-control-static")
												.appendTo(name);
										var address = $("<div></div>")
												.addClass("form-group");
										var address_lable = $("<label></label>")
												.addClass(
														"col-sm-2 control-label")
												.append("下单时间").appendTo(
														address);
										var time = getMyDate(this.startTime);
										var address_info = $("<div></div>")
												.addClass("col-sm-10")
												.append("<p>" + time + "</p>")
												.addClass("form-control-static")
												.appendTo(address);

										var table = $("<div></div>").addClass(
												"thumbnail").append(
												"<form></form>").addClass(
												"form-horizontal").append(name)
												.append(address).appendTo(
														"#order_area");
									});
				}
			});
});
function rptinfo_area(result) {
	var rpts = result.extend.rptInfo;
	$.each(result.extend.rptInfo,
			function() {
				var name = $("<div></div>").addClass("form-group");
				var name_lable = $("<label></label>").addClass(
						"col-sm-2 control-label").append("姓名").appendTo(name);
				var name_info = $("<div></div>").addClass("col-sm-10").append(
						"<p></p>").addClass("form-control-static").append(
						rpts.name).appendTo(name);
				$("<div></div>").addClass("thumbnail").append("<form></form>")
						.addClass("form-horizontal").append(name).appendTo(
								"#rptinfo_area");
			});
}

$("#address").click(function() {
	$("#myModal").modal({
		backdrop : "static"
	});
});
$("#submit").click(function() {
	$.ajax({
		url : "http://localhost:8080/Auction/insertRpt",
		type : "POST",
		data : $("#address form").serialize() + "&user_id=" + user,
		success : function(result) {
			if (result.code == 100) {
				alert("成功");
				window.location = "rptInfo.jsp";
			} else {
				alert("不能为空");
			}
		},
		error : function(result) {
			alert("error");
		}
	});
});
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
function build_area(result) {

}
