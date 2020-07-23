<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<script>
	function idDelete(deleteId){
	/* 	var result = confirm("정말 삭제 하시겠습니까?"); */
		location.href="deleteReview?reviewSeq=" + deleteId;
/* 		if(result){
			if("${reivew.reivewSeq}" == "${loginId}"||"${loginId}" == "admin"){ //trim함수
				location.href="deleteReview?reviewSeq=" + deleteId;
				return;
			} else {
				alert("본인이 아닙니다.")	
			}
		}	 */
	}
</script>

<h2>내가 쓴 리뷰</h2>
<div id="outter"> 
	<table border="1">
		<tr>
			<td>No.</td>
			<td>카페 이름</td>
			<td>리뷰 사진</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>평 점</td>
			<td><button type="button" onclick="location.href='insertFormReview'">리뷰 작성</button></td>	
		</tr>
		<c:forEach items="${reviewList }" var="review">
			<tr>
				<td>${review.reviewSeq }</td>
				<td><a href="updateFormReview?reviewSeq=${review.reviewSeq}">${review.cafeName }</a></td>
				<%-- <td>${review.gdsThumbImg }</td> --%>
				<td><img src="resources/upload/${review.gdsThumbImg}"style="width: 80px"></td>
				<td>${review.email }</td>
				<td><fmt:parseDate value="${review.reviewTime }" pattern="yyyy-MM-dd HH:mm:ss" var="rt"/>
				<fmt:formatDate value="${rt}" pattern="yyyy-MM-dd"/></td>
				<td>${review.stars }</td>
				<td><button type="button" onclick="idDelete('${review.reviewSeq}')">삭제</button></td>
			</tr>
		</c:forEach>
	</table>
<%-- 	<script type="text/javascript">
	function gopage(p) {
		document.searchfrm.p.value = p;
/* 		document.searchfrm.submit();
		location.href="memberReviewList?p="+p; */
	}
</script>
<my:paging paging="${paging}" jsfunc="gopage" /> --%>
</div>