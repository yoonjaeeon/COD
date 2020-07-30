<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
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
						<h3 class="m-0 font-weight-bold " align="center">관리자 리뷰 조회</h3>
					</a>
					총 평점: <input type="text" class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
					<!-- Card Content - Collapse -->
					<div class="collapse show" id="collapseCardExample">
						<div class="card-body">
							<div class="review">
								<table class="table table-hover">
									<thead>
										<tr>
												<th>리뷰사진</th>
												<th>작성자</th>
												<th>등록일</th>
												<th>평점</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${adminReviewList }" var="review">
					<tr>
						<td style="display:none;" onclick="GoContents('${review.reviewSeq}')">${review.adminId} </td>
						<td onclick="GoContents('${review.reviewSeq}')">${review.reviewSeq}</td>
						<td onclick="GoContents('${review.reviewSeq}')"><img src="resources/upload/${review.gdsThumbImg}"style="width: 100px"></td>
						<td onclick="GoContents('${review.reviewSeq}')">${review.email }</td>
						<td onclick="GoContents('${review.reviewSeq}')"><fmt:parseDate value="${review.reviewTime }" pattern="yyyy-MM-dd HH:mm:ss" var="rt"/>
				<fmt:formatDate value="${rt}" pattern="yyyy-MM-dd"/></td>
						<td onclick="GoContents('${review.reviewSeq}')">${review.stars }</td>
						<td  onclick="GoContents('${review.seq}')">
						<c:forEach begin="1" end="${review.stars}" step="1">
						<img src="review/starImage/star.png"
						width="25" height="25" onerror="this.style.display='none';"/>
						</c:forEach>
						</td>
						
						<td><button type="button" onclick="del('${reviewSeq }')">삭제</button></td>
					
					</tr>
				</c:forEach>
			</table>
	
		</div>
	</div>

<!-- 
	<script type="text/javascript">
		function gopage(p) {
			document.searchfrm.p.value = p;
			document.searchfrm.submit();
			//location.href="EmpList.do?p="+p;
		}
	</script> -->
				</div>
			</div>
		</div>
	</div>

</body>
<br>
<br>
<ul style="margin-left:32%;" class="pagination"><li class="paginate_button page-item previous disabled" id="dataTable_previous"><a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page-link">3</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page-link">4</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page-link">5</a></li><li class="paginate_button page-item "><a href="#" aria-controls="dataTable" data-dt-idx="6" tabindex="0" class="page-link">6</a></li><li class="paginate_button page-item next" id="dataTable_next"><a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li></ul>
</html>