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
	$('#commute').DataTable(
	);
} );
function calculateList(){
	$.ajax({
		url : "commuteworkerlist",
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
<div align="center">
<div style="width: 80%">
<table id="commute" class="display" style="width: 100%">
	<thead>
		<tr>
			<th>출근날짜</th>
			<th>Name</th>
			<th>출근시간</th>
			<th>퇴근시간</th>
			<th>일급</th>
		</tr>
	</thead>
	<tbody>
	
		<c:forEach items="${commute}" var="commute">
			<fmt:parseDate value="${commute.COMMUTE_DAY}" pattern="yyyy-MM-dd" var="date"/>
			<fmt:parseDate value="${commute.START_TIME}" pattern="yyyy-MM-dd HH:mm" var="start"/>
			<fmt:parseDate value="${commute.END_TIME}" pattern="yyyy-MM-dd HH:mm" var="end"/>
			<fmt:formatNumber value="${commute.DAY_PAY}" pattern="#,###.## 원" var="pay"/>
			<tr>
				<td><fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/></td>
				<td>${commute.WORKER_NAME }</td>
				<td><fmt:formatDate value="${start}" pattern="HH:mm"/></td>
				<td><fmt:formatDate value="${end}" pattern="HH:mm"/></td>
				<td>${pay }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

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

<!-- The Modal -->
<div class="modal fade" id="contentModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">카페명</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
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