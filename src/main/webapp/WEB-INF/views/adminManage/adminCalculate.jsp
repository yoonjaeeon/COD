<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

$(function() {
	calculateList();
	searchCalculateList();
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
		$('<tr>').append($('<td id="time">').html(item.orderTime))
				 .append($('<td>').html(item.price))
				 .appendTo('tbody');
		sum += item.price;
	})
	$('#total').html(sum);
}
function searchCalculateList() {
   $('body').on('click','#btnSelect',function(){
      $.ajax({
         url:'calculateList',
         type:'GET',
         data: $("#search").serialize(),
         dataType:'json',
         error:function(xhr,status,msg){
            alert("상태값 :" + status + " Http에러메시지 :"+msg);
         },
         success:calculateListResult
      });
   }); //조회 버튼 클릭
}
$('body').on('click','#ctbl tr',function(){
	var orderTime = $(this).children().eq(0).text();
	console.log(orderTime);
	$.ajax({
	   url:'calculateList/'+orderTime,
	   type:'GET',
	   contentType:'application/json;charset=utf-8',
	   dataType:'json',
	   error:function(xhr,status,msg){
	      alert("상태값 :" + status + " Http에러메시지 :"+msg);
	   },
	   success:calSelectResult
	});
});

//메뉴 목록 조회 응답
function calSelectResult(data) {
	$("#detail").empty();
	$.each(data, function(idx, item) {		
		if(item.orderState == 1){
			name = '아이스 '+item.MENU_NAME;
			price = (parseInt(item.PRICE)+parseInt(item.PRICE_ADD))
		} else{
			name =	item.MENU_NAME
			price = item.PRICE
		}
		total = item.ORDERLINE_AMOUNT * price;
		$('<div class="row">').append($('<div>').addClass('col-6').html(name))
								.append($('<div>').addClass('col-2').html(price))
								.append($('<div>').addClass('col-2').html(item.ORDERLINE_AMOUNT))
								.append($('<div>').addClass('col-2').html(total))
								.appendTo('#detail');
	})
}
</script>
<div class="container">

	<form id="search" class="row">
		<div class="col-5">
		<input type="date" id="date" class="form-control" name="startTime" >	
		</div>
		<div class="col-5">
		<input type="date" id="date" class="form-control" name="endTime" >
		</div>
		<div class="col-2">
		<button class="btn btn-outline-info" id = "btnSelect" type="button"> 조회 </button>
		</div>
	</form>

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
	<div class="col-8" id="detail" style="padding: 3em;"></div>
		
	</div>
</div>