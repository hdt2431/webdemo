$(function() {
	getOrder();
});
function getOrder() {
	$.ajax({
		url : "http://localhost:8080/Auction/getArtsbyState",
		data : {
			state_id : 3
		},
		type : "get",
		success : function(result) {
			var arts = result.extend.artsInfo;
			$.each(arts, function(index, item) {
				var now = new Date();
				if (now > item.end_time) {
					$.ajax({
						url : "http://localhost:8080/Auction/insertOrder2",
						type : "get",
						data : "id=" + item.id,
						success : function(result) {
						}
					});
				}
			})
		}
	});
}