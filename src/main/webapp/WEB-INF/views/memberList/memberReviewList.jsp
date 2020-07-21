<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- <script>
	function idDelete(deleteId){
		var result = confirm("정말 삭제 하시겠습니까?");
		if(result){
			if("${vo.id}" == "${loginId}"||"${loginId}" == "admin"){ //trim함수
				location.href="MemberDelete.do?id=" + deleteId;
				return;
			} else {
				alert("본인이 아닙니다.")	
			}
		}	
	}
</script> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<style>
	h2 {
		text-align: center;
	}
	table {
		width: 100%;
	}
	#outter {
		display: block;
		width: 80%;
		margin: auto;
	}
</style>
<body>
 
<h2>내가 쓴 리뷰</h2>
<div id="outter"> 
	<table border="1">
		<tr>
			<td>No.</td>
			<td>카페 이름</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>평 점</td>		
		</tr>
		<c:forEach items="${reviewList }" var="review">
			<tr>
				<td>${review.reviewSeq }</td>
				<td><a href="updateFormReview?email=${review.email}">${review.cafeName }</a></td>
				<td>${review.email }</td>
				<td><fmt:parseDate value="${review.reviewTime }" pattern="yyyy-MM-dd HH:mm:ss" var="rt"/>
				<fmt:formatDate value="${rt}" pattern="yyyy-MM-dd"/></td>
				<td>${review.stars }</td>
				<td><button type="button" onclick="idDelete('${vo.id}')">삭제</button></td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>