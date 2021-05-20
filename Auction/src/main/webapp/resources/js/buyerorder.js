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
	var Request = undefined;
	Request = GetRequest();
	var type_id = Request["type_id"];
	if(type_id==3||type_id==2){
		$("#tr").append("<th>操作</th>");
	}
	$("#check_all").click(function() {
		$(".check_item").prop("checked", $(this).prop("checked"));
	});
	$(document).on("click", ".check_item", function() {
		var flag = $(".check_item:checked").length == $(".check_item").length;
		$("#check_all").prop("checked", flag);
	});
	$("#delete_all").click(function() {
		var order_id = "";
		$.each($(".check_item:checked"), function() {
			order_id += $(this).attr("order_id") + "-";
		});
		order_id = order_id.substring(0,order_id.length - 1);
		if (confirm("确认删除吗？")) {
			$.ajax({
				url : "http://localhost:8080/Auction/deleteOrderBatch",
				data : "ids=" + order_id,
				type : "get",
				success : function(result) {
					window.location.href = "buyerorder.jsp?type_id="+type_id;

				}
			});
		}
	});
	$
			.ajax({
				url : "http://localhost:8080/Auction/getOrderByBuerIdandTypeId",
				data : {
					id : user,
					typeid : type_id
				},
				type : "get",
				success : function(result) {
					if (result.extend.OrderInfo == "") {
						$("<h3>您还没有相关订单</h3>").appendTo("#order_area");
					}
					$.each(result.extend.OrderInfo,function() {
										$
												.ajax({
													url : "http://localhost:8080/Auction/auction2",
													type : "get",
													data : {
														id : this.artId

													},
													success : function(result) {
														var order = result.extend.orderInfo;
														var art = result.extend.artInfo;
														var seller = result.extend.owner;
														var buyer = result.extend.winer;
														var rptinfo = result.extend.rInformation;
														var checkBox = $("<input type='checkbox' class='check_item'/>").attr(
																"order_id", order.id);
														var checkBoxTd = $("<td></td>").append(checkBox);
														var artIdTd = $("<td></td>").append(order.id);
														var artNameTd = $("<td></td>").append(art.art_name);
														var artPeiceTd = $("<td></td>").append(art.max_price);
														var endtime = getMyDate(art.end_time);
														var auditingTd = $("<td></td>").append(endtime);
														var typeTd = $("<td></td>");
														var moreBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
														.append($("<span></span>").addClass("glyphicon glyphicon-th")).append("详细信息");
														var btnTd = $("<td></td>").append(moreBtn);
														
														var all = $("<tr></tr>").append(checkBoxTd).append(artIdTd).append(
																artNameTd).append(artPeiceTd).append(auditingTd).append(typeTd).append(btnTd).appendTo(
																"#art_table1 tbody");
														if(order.orderTypeId==1){
															typeTd.append("未付款");
														}else if(order.orderTypeId==3){
															typeTd.append("待发货");
															var Deliver_buttonTd = $('<td><button type="button" class="btn btn-info glyphicon glyphicon-pencil btn-sm">填写物流</button></td>');
															all.append(Deliver_buttonTd);
															Deliver_buttonTd.click(function() {
																		$("#myModal").modal({
																		backdrop : "static"
																	});
																	});
															$("#submit").click(function() {
																				$.ajax({
																							url : "http://localhost:8080/Auction/setlogistics",
																							type : "POST",
																							data : $(
																									"#logistics form")
																									.serialize()
																									+ "&artId="
																									+ art.id,
																							success : function(
																									result) {
																								if (result.code == 100) {
																									alert("成功");
																									window.location = "buyerorder.jsp?type_id=3";
																								} else {
																									alert("不能为空");
																								}
																							},
																							error : function(
																									result) {
																								alert("error");
																							}
																						});
																			});
														}else if(order.orderTypeId==2){
															typeTd.append("待评价");
															var comment_buttonTd = $('<td><button type="button" class="btn btn-info glyphicon glyphicon-pencil btn-sm">评论订单</button></td>');
															all.append(comment_buttonTd);
															comment_buttonTd
																	.click(function() {
																		$(
																				"#myModal2")
																				.modal(
																						{
																							backdrop : "static"
																						});
																	});
														}else if(order.orderTypeId==4){
															typeTd.append("待收货");
														}else if(order.orderTypeId==5){
															typeTd.append("已完成");
														}
														var artname = $("<div></div>").addClass("form-group");
														var artname_lable = $("<label></label>").addClass("col-sm-2 control-label")
																.append("商品名")
																.appendTo(artname);
														var artname_info = $("<div></div>").addClass("col-sm-10")
																.append("<p>"+ art.art_name+ "</p>")
																.addClass("form-control-static")
																.appendTo(artname);
														var price = $("<div></div>").addClass("form-group");
														var price_lable = $("<label></label>")
																.addClass("col-sm-2 control-label")
																.append("成交价")
																.appendTo(price);
														var price_info = $("<div></div>").addClass("col-sm-10")
																.append("<p>"+ art.max_price+ "元"+"</p>")
																.addClass("form-control-static")
																.appendTo(price);
														var sellername = $("<div></div>").addClass("form-group");
														var sellername_lable = $("<label></label>").addClass("col-sm-2 control-label")
																.append("卖家昵称")
																.appendTo(sellername);
														var sellername_info = $("<div></div>").addClass("col-sm-10")
																.append("<p>"+ seller.user_nickname+ "</p>")
																.addClass("form-control-static")
																.appendTo(sellername);
														var phone = $("<div></div>").addClass("form-group");
														var phone_lable = $("<label></label>").addClass("col-sm-2 control-label")
																.append("卖家联系方式")
																.appendTo(phone);
														var phone_info = $("<div></div>").addClass("col-sm-10")
																.append("<p>"+ seller.user_phone+ "</p>")
																.addClass("form-control-static")
																.appendTo(phone);
														var buyername = $("<div></div>").addClass("form-group");
														var buyername_lable = $("<label></label>")
																.addClass("col-sm-2 control-label")
																.append("买家昵称")
																.appendTo(buyername);
														var buyername_info = $("<div></div>")
																.addClass("col-sm-10")
																.append("<p>"+ buyer.user_nickname+ "</p>")
																.addClass("form-control-static")
																.appendTo(buyername);
														var phone2 = $("<div></div>").addClass("form-group");
														var phone2_lable = $("<label></label>").addClass("col-sm-2 control-label")
																.append("买家联系方式")
																.appendTo(phone2);
														var phone2_info = $("<div></div>").addClass("col-sm-10")
																.append("<p>"+ buyer.user_phone+ "</p>")
																.addClass("form-control-static")
																.appendTo(phone2);
														var artname1 = $("<div></div>").addClass("form-group");
														var artname1_lable = $("<label></label>").addClass("col-sm-2 control-label")
																.append("买家地址")
																.appendTo(artname1);
														var artname1_info = $("<div></div>").addClass("col-sm-10")
																.append("<p>"+ rptinfo.address+ "</p>")
																.addClass("form-control-static")
																.appendTo(artname1);
														var comment = $("<div></div>").addClass("form-group");
														var comment_lable = $("<label></label>").addClass("col-sm-2 control-label")
																.append("评论")
																.appendTo(comment);
														var comment_info = $("<div></div>").addClass("col-sm-10")
																.append("<p>"+ order.comment+ "</p>")
																.addClass("form-control-static")
																.appendTo(comment);
														var pay_button = $('<button type="button" class="btn btn-primary">付款</button>');
														pay_button.click(function() {
																	$.ajax({
																				url : "http://localhost:8080/Auction/pay",
																				type : "get",
																				data : "artId="
																						+ art.id,
																				success : function(
																						result) {
																					if (result.code == 100) {
																						alert("成功");
																						window.location = "buyerorder.jsp?type_id=1";
																					}
																				},
																				error : function(
																						result) {
																					alert("error");
																				}
																			});
																});
														var table = $("<div></div>").addClass(
														"thumbnail").append(
														"<form></form>").addClass(
														"form-horizontal").append(name)
														.append(address)
														table.append(artname).append(price)
																.append(sellername)
																.append(phone)
																.append(buyername)
																.append(phone2)
																.append(artname1);
														var take_over_button = $('<button type="button" class="btn btn-primary">确认收货</button>');
														take_over_button
																.click(function() {
																	$
																			.ajax({
																				url : "http://localhost:8080/Auction/take_over",
																				type : "get",
																				data : "artId="
																						+ art.id,
																				success : function(
																						result) {
																					if (result.code == 100) {
																						alert("成功");
																						window.location = "buyerorder.jsp?type_id=4";
																					}
																				},
																				error : function(
																						result) {
																					alert("error");
																				}
																			});
																});
														$("#submit2")
																.click(
																		function() {
																			$
																					.ajax({
																						url : "http://localhost:8080/Auction/comment",
																						type : "POST",
																						data : $(
																								"#comment form")
																								.serialize()
																								+ "&artId="
																								+ art.id,
																						success : function(
																								result) {
																							if (result.code == 100) {
																								alert("成功");
																								window.location = "buyerorder.jsp?type_id=4";
																							} else {
																								alert("不能为空");
																							}
																						},
																						error : function(
																								result) {
																							alert("error");
																						}
																					});
																		});
														if (result.extend.ordertype == 1) {
															table
																	.append(pay_button);
														} else if (result.extend.ordertype == 3) {
															table
																	.append(Deliver_button);
														} else if (result.extend.ordertype == 4) {
															table
																	.append(take_over_button);
														} else if (result.extend.ordertype == 2) {
															table
																	.append(comment_button);
														}else if (result.extend.ordertype == 5) {
															table
															.append(comment);
												}
														
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
												moreBtn.click(function(){
													$("#order_area").empty();
													$("#myModal3").modal({
														backdrop : "static"
													});
													table.appendTo("#order_area");
												});	
												
													},
													error : function(result) {
														alert("error");
													}
												});

										
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
