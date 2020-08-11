<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
<script>
$(document).ready(function() {
	$('#order').DataTable(
	);
} );
function myorderList(){
	$.ajax({
		url : "myorderList",
		type : 'GET',
		dataType: 'json', 
		success : function(data) {
			console.log(data);
		},
		error : function(xhr, status, message) {
			alert(" status: " + status + " 에러:" + message);
		}
	});
}
</script>
<br><br>
<div class="container">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">나의 결제 리스트</h1>
	<!-- DataTales Example -->
			
				<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="dataTables_length" id="dataTable_length">
													
							</div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table id="order" class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0"
							role="grid" aria-describedby="dataTable_info" style="width: 100%;">

								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" aria-sort="ascending"
											aria-label="Name: activate to sort column descending"
											style="width: 74px;">주문날짜</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Position: activate to sort column ascending"
											style="width: 108px;">카페명</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Office: activate to sort column ascending"
											style="width: 55px;">결제금액</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Office: activate to sort column ascending"
											style="width: 55px;">리뷰작성</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th rowspan="1" colspan="1">주문날짜</th>
										<th rowspan="1" colspan="1">카페명</th>
										<th rowspan="1" colspan="1">결제금액</th>
										<th rowspan="1" colspan="1">리뷰작성</th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach begin="0" end="10" items="${getMemberDayOrder}" var="list">
										<tr role="row" class="odd" data-toggle="modal" data-target="#contentModal" onclick="getOrders('${list.orderTime}','${list.cafeName }')">																
											<td>
											<fmt:parseDate value="${list.orderTime}" pattern="yyyy-MM-dd" var="date"/>
											<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/>
											</td>
											<td>${list.cafeName}</td>
											<td>${list.price }</td>
											<td><button type="button" onclick="location.href='insertFormReview?orderSeq=${list.orderSeq}&cafeName=${list.cafeName}'">리뷰 쓰러 가기</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<table border="0" cellpadding="0" cellspacing="0">
					<tbody>
					<tr>
			<td class="gutter"><div class="line number1 index0 alt2" style="display: none;">1</div></td>
			<td class="code">
				<div class="container" style="display: none;">
					<div class="line number1 index0 alt2" style="display: none;">&nbsp;</div>
				</div>
			</td>
		</tr>
	</tbody>
</table>
				</div>
			</div>
		</div>

<!-- The Modal -->
<div class="modal fade" id="contentModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">카페명</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				주문상세

				<table class="table table-hover">
					<thead>
						<tr>
							<th>주문메뉴</th>
							<th>가격</th>
							<th>수량</th>
							<th>주문날짜</th>
						</tr>
					</thead>
					<tbody id="tbody">
					</tbody>
				</table>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<script>
var orderTime;
var cafeName;
function getOrders(time, name){
	orderTime = time;
	cafeName = name;

$('#contentModal').on('show.bs.modal', function (e) {
	$.ajax({
		url : 'getMemberOrders',  
		method:'post',
		data : {orderTime : orderTime, cafeName : cafeName},
		dataType :'json',
		success:function(result){
			$('#tbody').empty();
			$.each(result, function(index, item){     
				var value = "";
				if(item.orderState == 1){
					value = '<td>아이스 '+item.menuName+'</td><td>'+(parseInt(item.price)+parseInt(item.priceAdd))+'</td>'
				} else{
					value =	'<td>'+item.menuName+'</td><td>'+item.price+'</td>'
				}    
				$('#tbody').append('<tr>'+value+
				'<td>'+item.orderlineAmount+'</td>' +
				'<td>'+item.orderTime+'</td></tr>')
				
				/* <c:if test="${list.orderState == 0 }">
				<td>${list.cafeName}</td>
				<td>${list.price }</td>
				</c:if>
				
				<c:if test="${list.orderState == 0 }">
				<td>아이스 ${list.cafeName}</td>
				<td>${list.price + list.priceAdd }</td>
				</c:if> */
			})
		}
	})

})  
}

/* function getOrders(time){
	$.ajax({
		url :'getMemberOrders',
		type : 'post',
		data : {orderTime:time},
		contentType: 'application/json;charset=utf-8',
		dataType :'json',
		success : function(result){
			$.each(result, function(index, item){
				$($('#tbody'))
			})
		}
		
	})
} */
</script>
