
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function del(param) {
		frm.seq.value = param
		if (confirm("정말 삭제하시겠습니까?")) {
			frm.submit();
		}
	}

	function GoContents(param) {
		frm2.seq.value = param;
		frm2.submit();
	}
</script>

</head>

<body>
	<div id="listpage">
	<hr>
	<section class="posts">
		<article>
			<div>
				<div class="card shadow mb-4">
					<!-- Card Header - Accordion -->
					<a href="#collapseCardExample" class="d-block card-header py-3"
						data-toggle="collapse" role="button" aria-expanded="true"
						aria-controls="collapseCardExample">
						<h3 class="m-0 font-weight-bold " align="center">* 최근 결제 내역 *</h3>
					</a>
					<!-- Card Content - Collapse -->
					<div class="collapse show" id="collapseCardExample">
						<div class="card-body">
							<div class="order">
								<table class="table table-hover">
									<thead>
										<tr>
												<th>주문번호</th>
												<th>테이블명</th>
												<th>메뉴이름</th>
												<th>가격</th>
												<th>추가금액</th>
												<th>주문수량</th>
												<th>주문상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${orderLineList }" var="order">
					<tr>
						<td style="display:none;" onclick="GoContents('${order.orderSeq}')">${order.adminId} </td>
						<td onclick="GoContents('${order.orderSeq}')">${order.orderSeq}</td>
						<td onclick="GoContents('${order.orderSeq}')">${order.seatName}</td>
						<td onclick="GoContents('${order.orderSeq}')">${order.menuName}</td>
						<td onclick="GoContents('${order.orderSeq}')">${order.price}</td>
						<td onclick="GoContents('${order.orderSeq}')">${order.priceAdd}</td>
						<td onclick="GoContents('${order.orderSeq}')">${order.orderlineAmount}</td>
						<td onclick="GoContents('${order.orderSeq}')">${order.orderState}</td>
						<td  onclick="GoContents('${order.seq}')">
						<c:forEach begin="1" end="${order.star}" step="1">
						<img src="order/starImage/star.png"
						width="25" height="25" onerror="this.style.display='none';"/>
						</c:forEach>
						</td>
						
							<td><button type="button" onclick="del('${orderSeq }')">삭제</button></td>
					
					</tr>
				</c:forEach>
			</table>
	
		</div>
	</div>


	<script type="text/javascript">
		function gopage(p) {
			document.searchfrm.p.value = p;
			document.searchfrm.submit();
			//location.href="EmpList.do?p="+p;
		}
	</script>
				</div>
			</div>
		</div>
	</div>



</body>
<br>
<br>
<ul style="margin-left:32%;" class="pagination"><li class="paginate_button page-item previous disabled" id="dataTable_previous"><a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page-link">3</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page-link">4</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page-link">5</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="6" tabindex="0" class="page-link">6</a></li><li class="paginate_button page-item next" id="dataTable_next"><a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li></ul>
</html>