<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<style>
#outter tbody td{cursor:pointer}
</style>
<script>
	function idDelete(deleteId){
		window.event.stopPropagation()
		var result = confirm("정말 삭제 하시겠습니까?");
		if(result){
			location.href="adminDeleteReview?reviewSeq=" + deleteId;
		}else{
			return;
		}
	}
</script>
<div class="container"> 
	<h2 align="center">관리자 리뷰 조회</h2>
	<div id="outter"> 
		<div align="right">

			총 평점 : <b>${getReviewAvg}</b> 점<br /><br />

		</div>
		<table class="table table-hover" >
		<thead>
			<tr>
				<td>리뷰 사진</td>
				<td>작성자</td>
				<td>등록일</td>
				<td>평 점</td>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${adminReviewList }" var="review">
					<tr onclick="location.href='updateFormReview?reviewSeq=${review.reviewSeq}&cafeName=${review.cafeName}'">
						<td><img src="resources/upload/${review.gdsThumbImg}"style="width: 100px"></td>
						<td>${review.email }</td>
						<td><fmt:parseDate value="${review.reviewTime }" pattern="yyyy-MM-dd HH:mm:ss" var="rt"/>
						<fmt:formatDate value="${rt}" pattern="yyyy-MM-dd"/></td>
						<td>${review.stars }</td>
					</tr>
				</c:forEach>
				<c:if test="${empty adminReviewList }">
					<th>등록된 리뷰가 없습니다.</th>
				</c:if>
			</tbody>
		</table>
		</div>
		<script type="text/javascript">
		function gopage(p) {
			location.href="adminReviewList?p="+p;
		}
		</script>
		<div align="center">
			<my:paging paging="${paging}" jsfunc="gopage"/>
		</div>
	</div>
