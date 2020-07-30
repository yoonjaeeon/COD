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
			location.href="deleteReview?reviewSeq=" + deleteId;
		}else{
			return;
		}
	}
</script>

<h2>내가 쓴 리뷰</h2>
<div id="outter"> 
	<table border="1">
	<thead>
		<tr>
			<td>No.</td>
			<td>카페 이름</td>
			<td>대표 사진</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>평 점</td>
			<td>관리자</td>
			<td><button type="button" onclick="location.href='insertFormReview'">리뷰 작성</button></td>	
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${reviewList }" var="review">
			<tr onclick="location.href='updateFormReview?reviewSeq=${review.reviewSeq}'">
				<td>${review.reviewSeq }</td>
				<td>${review.cafeName }</td>
				<td><img src="resources/upload/${review.gdsThumbImg}"style="width: 100px"></td>
				<td>${review.email }</td>
				<td><fmt:parseDate value="${review.reviewTime }" pattern="yyyy-MM-dd HH:mm:ss" var="rt"/>
				<fmt:formatDate value="${rt}" pattern="yyyy-MM-dd"/></td>
				<td>${review.stars }</td>
				<td>${review.adminId }</td>
				<td><button type="button" onclick="idDelete('${review.reviewSeq}')">삭제</button></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<script type="text/javascript">
	function gopage(p) {
		location.href="memberReviewList?p="+p;
		//document.searchfrm.p.value = p; 검색
 		//document.searchfrm.submit();
	}
</script>
<my:paging paging="${paging}" jsfunc="gopage" />
</div>