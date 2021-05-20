
// 页面加载后执行绑定
$(function() {
	gettypes();
	var Request = undefined;
	Request = GetRequest();
	var state_id = Request["state_id"];
	to_page(1);
	$("#check_all").click(function() {
		$(".check_item").prop("checked", $(this).prop("checked"));
	});
	$(document).on("click", ".check_item", function() {
		var flag = $(".check_item:checked").length == $(".check_item").length;
		$("#check_all").prop("checked", flag);
	});
	$("#delete_all").click(function() {
		var art_id = "";
		$.each($(".check_item:checked"), function() {
			art_id += $(this).attr("art_id") + "-";
		});
		art_id = art_id.substring(0,art_id.length - 1);
		if (confirm("确认删除吗？")) {
			$.ajax({
				url : "http://localhost:8080/Auction/deletArtrBatch",
				data : "ids=" + art_id,
				type : "get",
				success : function(result) {
					window.location.href = "auditing2.jsp?state_id="+state_id;

				}
			});
		}
	});
	if(state_id==2){
		$("#tr").append("<th>操作</th>");
	}
});
function gettypes(){
	$.ajax({
		url : "http://localhost:8080/Auction/typelist",
		data : "pn=1",
		type : "get",
		success : function(result) {
			var types = result.extend.typeInfo;
			$.each(types, function(index, item) {
				$("#types").append("<option value='"+item.id+"'>"+item.type_name+"</option>");
			});

		}
	});
}
function to_page(pn) {
	var Request = undefined;
	Request = GetRequest();
	var state_id = Request["state_id"];
	$.ajax({
		url : "http://localhost:8080/Auction/is_auditArtlist",
		data : {
			pn : pn,
			state_id : state_id,
		},
		type : "get",
		success : function(result) {
			// 解析 显示拍品数据
			build_arts_table(result);
			// 解析 显示分页信息
			build_page_info(result);
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
	$("#art_table1 tbody").empty();
	var arts = result.extend.pageInfo.list;
	$.each(arts, function(index, item) {
		var checkBox = $("<input type='checkbox' class='check_item'/>").attr(
				"art_id", item.id);
		var checkBoxTd = $("<td></td>").append(checkBox);
		var artIdTd = $("<td></td>").append(item.id);
		var artNameTd = $("<td></td>").append(item.art_name);
		var arttypeTd = $("<td></td>");
		var auditingTd = $("<td></td>");
		if(item.arttype_id==1){
			arttypeTd.append("书画类");
		}else if(item.arttype_id==2){
			arttypeTd.append("陶艺瓷器类");
		}else if(item.arttype_id==3){
			arttypeTd.append("奇石珠宝类");
		}else if(item.arttype_id==4){
			arttypeTd.append("青铜器类");
		}else if(item.arttype_id==5){
			arttypeTd.append("乐器类");
		}else if(item.arttype_id==6){
			arttypeTd.append("雕刻类");
		}
		if(item.state_id==1){
			auditingTd.append("未审核");
		}else if(item.state_id==2){
			auditingTd.append("审核通过");
		}else if(item.state_id==5){
			auditingTd.append("审核未通过");
		}else if(item.state_id==4){
			auditingTd.append("拍卖结束");
		}else if(item.state_id==3){
			auditingTd.append("拍卖中");
		}
		var moreBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
		.append($("<span></span>").addClass("glyphicon glyphicon-th")).append("详细信息");
		var btnTd = $("<td></td>").append(moreBtn);
		var all = $("<tr></tr>").append(checkBoxTd).append(artIdTd).append(
				artNameTd).append(arttypeTd).append(auditingTd).append(btnTd).appendTo(
				"#art_table1 tbody");	
		var set_btn = $("<button></button>").addClass(
		"btn btn-info btn-sm edit_btn")
		.append("加入拍卖计划");
		var set_btnTd = $("<td></td>").append(set_btn);
		var submit_btn = $("<div class='layui-input-block'></div>").append("<button class='btn btn-primary'>提交</button>");
		if(item.state_id==2){
			all.append(set_btnTd);
		}
		moreBtn.click(function(){
			$("#art_area").empty();
			var id = $("<div></div>").addClass("form-group");				
			var id_lable = $("<label></label>").addClass("col-sm-2 control-label").append("拍品编号").appendTo(id);
			var id_info = $("<div></div>").addClass("col-sm-10").append("<p></p>").addClass("form-control-static")
			.append(item.id).appendTo(id);
			var name = $("<div></div>").addClass("form-group");				
			var name_lable = $("<label></label>").addClass("col-sm-2 control-label").append("拍品名称").appendTo(name);
			var name_info = $("<div></div>").addClass("col-sm-10").append("<p></p>").addClass("form-control-static")
			.append(item.art_name).appendTo(name);
			var remark = $("<div></div>").addClass("form-group");				
			var remark_lable = $("<label></label>").addClass("col-sm-2 control-label").append("拍品备注").appendTo(remark);
			var remark_info = $("<div></div>").addClass("col-sm-10").append("<p></p>").addClass("form-control-static")
			.append(item.art_remark).appendTo(remark);
			var desc = $("<div></div>").addClass("form-group");				
			var desc_lable = $("<label></label>").addClass("col-sm-2 control-label").append("拍品描述").appendTo(desc);
			var desc_info = $("<div></div>").addClass("col-sm-10").append("<p></p>").addClass("form-control-static")
			.append(item.art_desc).appendTo(desc);
			var years = $("<div></div>").addClass("form-group");				
			var years_lable = $("<label></label>").addClass("col-sm-2 control-label").append("拍品年份").appendTo(years);
			var years_info = $("<div></div>").addClass("col-sm-10").append("<p></p>").addClass("form-control-static")
			.append(item.art_years).appendTo(years);
			var price = $("<div></div>").addClass("form-group");				
			var price_lable = $("<label></label>").addClass("col-sm-2 control-label").append("起拍价").appendTo(price);
			var price_info = $("<div></div>").addClass("col-sm-10").append("<p></p>").addClass("form-control-static")
			.append(item.init_price).append("元").appendTo(price);
			var auditing_btn = $("<button></button>").addClass(
			"layui-btn layui-btn-normal")
			.append("审核通过");
			var auditing_btn2 = $("<button></button>").addClass(
			"layui-btn layui-btn-normal")
			.append("审核未通过");
			var picture= new Array();
			picture =item.picture_url.split(";");
			var image = $('<div style="height: 100px;width:1000px;margin-bottom: 30px;"></div>');
			$.each(picture,function(index,item){
				image.append('<img src="..'+item+'" style="height: 100%;width:100px;padding:2px">')
			})
			
			var all = $("<div></div>").addClass("thumbnail").append("<form></form>").addClass("form-horizontal");
			all.append(id).append(name).append(remark).append(desc).append(years)
			.append(price).append(image);
			if(item.state_id==1){
				all.append(auditing_btn).append(auditing_btn2);
			}
			all.appendTo("#art_area");
			$("#myModal2").modal({
				backdrop : "static"
			});
			auditing_btn.click(function() {
				if(confirm("确认么？")){
				$.ajax({
					url : "http://localhost:8080/Auction/audit_success",
					data : {
						id :item.id,
						manager_id : manager,
						},
					type : "get",
					success : function(result) {
						window.location.href = "auditing2.jsp?state_id=1";
					}
				});
				}
			});
			auditing_btn2.click(function() {
				if(confirm("确认么？")){
				$.ajax({
					url : "http://localhost:8080/Auction/audit_fail",
					data : {
						id :item.id,
						manager_id : manager,
						},
					type : "get",
					success : function(result) {
						window.location.href = "auditing2.jsp?state_id=1";
					}
				});
				}
			});
		})
		set_btn.click(function() {
			$("#myModal").modal({
				backdrop : "static"
			});
			$("#submit_area").empty();
			submit_btn.appendTo("#submit_area");
			submit_btn.click(function(){
				$.ajax({
					url : "http://localhost:8080/Auction/setArtTime",
					data : $("#time form").serialize()+"&id="+item.id,
					type : "get",
					success : function(result) {
						if(result.code==100)
						window.location.href = "auditing2.jsp?state_id=2";
						else
							alert("false");
					}
				});
			})
		});
		
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

