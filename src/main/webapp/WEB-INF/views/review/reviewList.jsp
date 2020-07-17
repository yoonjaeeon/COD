<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
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
		width: 60%;
		margin: auto;
	}
</style>
<body>
 
<h2>리뷰 목록</h2>
<div id="outter">
	<table border="1">
		<tr>
			<td>No.</td>
			<td width="50%">제목</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>평 점</td>		
		</tr>
		<c:forEach items="${reviewList }" var="review">
			<tr>
				<td>${review.reviewSeq }</td>
				<td>${review.reviewContent }</td>
				<td>${review.email }</td>
				<td><fmt:formatDate value="${review.reviewTime }" pattern="yyyy.MM.dd"/> </td>
				<td>${review.stars }</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>