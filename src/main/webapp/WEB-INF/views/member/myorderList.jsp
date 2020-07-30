<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">나의 결제 리스트</h1>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-body">
			<div class="table-responsive">
				<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="dataTables_length" id="dataTable_length">
								<label>보기 <select name="dataTable_length"
									aria-controls="dataTable"
									class="custom-select custom-select-sm form-control form-control-sm"><option
											value="10">10</option>
										<option value="25">25</option>
										<option value="50">50</option>
										<option value="100">100</option></select>
								</label>
							</div>
						</div>
						<div class="col-sm-12 col-md-6">
							<div id="dataTable_filter" class="dataTables_filter">
								<label>검색 :<input type="search"
									class="form-control form-control-sm" placeholder="카페명"
									aria-controls="dataTable"></label>
							</div>
						</div>
					</div>
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
											style="width: 74px;">주문날짜</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Position: activate to sort column ascending"
											style="width: 108px;">카페명</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1"
											aria-label="Office: activate to sort column ascending"
											style="width: 55px;">결제금액</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th rowspan="1" colspan="1">주문날짜</th>
										<th rowspan="1" colspan="1">카페명</th>
										<th rowspan="1" colspan="1">결제금액</th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach begin="0" end="10" items="${getMyorderList}"
										var="list">
										<tr role="row" class="odd" data-toggle="modal"
											data-target="#contentModal">
											<td>
											<fmt:formatDate value="${list.orderTime}" pattern="yyyy-MM-dd"/></td>
											<td>${list.price }</td>
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
										id="dataTable_previous"><a href="#"
										aria-controls="dataTable" data-dt-idx="0" tabindex="0"
										class="page-link">Previous</a></li>
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
										href="#" aria-controls="dataTable" data-dt-idx="7"
										tabindex="0" class="page-link">Next</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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
					<tbody>
						<c:forEach begin="0" end="3">
							<a href="getMyMenuList">
								<tr>
									<td>${menuName }</td>
									<td>${price }</td>
									<td>${orderlineAmount }</td>
									<td>${orderTime }</td>									
								</tr>
							</a>
						</c:forEach>
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

