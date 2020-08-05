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
<h2>관리자 리뷰 조회</h2>
<div id="outter"> 
	<table border="1">
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
				<td><button type="button" onclick="idDelete('${review.reviewSeq}')">삭제</button></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	총 평점 : <input type="text" name="getReviewAvg" id="getReviewAvg" value="${getReviewAvg}" readonly/>점<br />
	<script type="text/javascript">
	function gopage(p) {
		location.href="adminReviewList?p="+p;
		//document.searchfrm.p.value = p; 검색
 		//document.searchfrm.submit();
	}
</script>
<my:paging paging="${paging}" jsfunc="gopage" />
</div>