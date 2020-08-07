<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script>
function deleteMaster() {
	location.href="deleteMaster";
		
}


</script>

<div class="row">
	<div class="col-sm-12">
		<table class="table table-bordered dataTable" id="dataTable"
			width="100%" cellspacing="0" role="grid"
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
					<tr role="row" class="odd" >
						<td>${masterList.adminId}</td>
						<td>${masterList.pw}</td>
						<td>${masterList.adminPhone }</td>
						<td><button type="button"onclick="location.href='deleteMaster">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="row">
	<div class="col-sm-12 col-md-5"></div>
	<div class="col-sm-12 col-md-7">
		<div class="dataTables_paginate paging_simple_numbers"
			id="dataTable_paginate">
			<ul class="pagination">
				<li class="paginate_button page-item previous disabled"
					id="dataTable_previous"><a href="#" aria-controls="dataTable"
					data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>
				<li class="paginate_button page-item active"><a href="#"
					aria-controls="dataTable" data-dt-idx="1" tabindex="0"
					class="page-link">1</a></li>
				<li class="paginate_button page-item "><a href="#"
					aria-controls="dataTable" data-dt-idx="2" tabindex="0"
					class="page-link">2</a></li>
				<li class="paginate_button page-item "><a href="#"
					aria-controls="dataTable" data-dt-idx="3" tabindex="0"
					class="page-link">3</a></li>
				<li class="paginate_button page-item "><a href="#"
					aria-controls="dataTable" data-dt-idx="4" tabindex="0"
					class="page-link">4</a></li>

				<li class="paginate_button page-item next" id="dataTable_next"><a
					href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
					class="page-link">Next</a></li>
			</ul>
		</div>
	</div>
</div>