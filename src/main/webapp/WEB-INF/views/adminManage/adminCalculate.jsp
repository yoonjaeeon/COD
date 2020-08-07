<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

$(function() {
	calculateList();
});
function calculateList() {
	$.ajax({
		url : 'calculateList',
		type : 'GET',
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		error : function(xhr, status, msg) {
			alert("상태값 :" + status + " Http에러메시지 :" + msg);
		},
		success : calculateListResult
	});
}//menuList

//메뉴 목록 조회 응답
function calculateListResult(data) {
	$("tbody").empty();
	var sum = 0;
	$.each(data, function(idx, item) {
		$('<tr>').append($('<td>').html(item.orderTime))
				 .append($('<td>').html(item.price))
				 .appendTo('tbody');
		sum += item.price;
	})
	$('#total').html(sum);
}
</script>
<div class="container">
	<div class="row">
		<div class="col-5">
		<input type="date" id="date" class="form-control" name="startTime" >	
		</div>
		<div class="col-5">
		<input type="date" id="date" class="form-control" name="endTime" >
		</div>
		<div class="col-2">
		<button> 조회 </button>
		</div>
	</div>
	<br>
	<div class="row">
	
	<table id ="ctbl" class="table table-hover col-4">
		<thead>
			<tr>
				<th>날짜</th>
				<th>매출액</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
		<tfoot>
			<tr>
				<th>총계</th>
				<th id ="total"></th>
			</tr>
		</tfoot>
	</table>
	<div class="col-8"></div>
	</div>
</div>