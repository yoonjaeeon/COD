<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

<script>
function idDelete(deleteId){
	window.event.stopPropagation()
	var result = confirm("정말 삭제 하시겠습니까?");
	if(result){
		location.href="deleteMaster?adminId=" + deleteId;
	}else{
		return;
	}
}
$(document).ready(function() {
	$('#order').DataTable(
	);
} );
function masterList(){
	$.ajax({
		url : "masterList",
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
<div class="container">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">마스터 관리자 리스트</h1>
	<!-- DataTales Example -->
				<div class="col-sm-12 col-md-6">
					<table id="order" class="table table-bordered dataTable"
					id="dataTable" width="100%" cellspacing="0" role="grid"
					aria-describedby="dataTable_info" style="width: 100%;">
						<thead>
							<tr role="row">
								<th class="sorting_asc" tabindex="0" aria-controls="dataTable"
									rowspan="1" colspan="1" aria-sort="ascending"
									aria-label="Name: activate to sort column descending"
									style="width: 74px;">아이디</th>
								<th class="sorting" tabindex="0" aria-controls="dataTable"
									rowspan="1" colspan="1"
									aria-label="Position: activate to sort column ascending"
									style="width: 108px;">패스워드</th>
								<th class="sorting" tabindex="0" aria-controls="dataTable"
									rowspan="1" colspan="1"
									aria-label="Office: activate to sort column ascending"
									style="width: 55px;">연락처</th>
								<th class="sorting" tabindex="0" aria-controls="dataTable"
									rowspan="1" colspan="1"
									aria-label="Office: activate to sort column ascending"
									style="width: 55px;">삭제</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th rowspan="1" colspan="1">아이디</th>
								<th rowspan="1" colspan="1">패스워드</th>
								<th rowspan="1" colspan="1">연락처</th>
								<th rowspan="1" colspan="1">삭제</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach items="${masterList}" var="masterList">
								<tr role="row" class="odd">
									<td>${masterList.adminId}</td>
									<td>${masterList.pw}</td>
									<td>${masterList.adminPhone }</td>
									<td><button type="button" onclick="idDelete('${masterList.adminId}')">삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<table border="0" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td class="gutter"><div class="line number1 index0 alt2"
								style="display: none;">1</div></td>
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
