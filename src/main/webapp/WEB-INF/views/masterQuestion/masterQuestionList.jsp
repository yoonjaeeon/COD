<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<h2>문의글 리스트</h2>
<input name="p" value="1" type="hidden">
<input type="text" name="name" id="name" placeholder="제목 "
	class="two_third first">
<button class="btn one_third">검색</button>
<br>
<br>
<br>
<table border="1">
	<thead>
		<tr>
			<th>이름</th>
			<th>아이디 </th>
			<th>제목 </th>
			<th>연락처 </th>
			<th>내용</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="vo">
			<tr>
				<td>${vo.adminid}</td>
				<td>${vo.cafe_state }</td>
				<td>${vo.admin_phone }</td>
				<td>${vo.admin_state }</td>
				<td>${vo.admin_state }</td>
				<c:if test="${loginA Id !=null }">
					<td><a href=" =${vo.}"><img
							src=" "  /></a></td>
				</c:if>
			</tr>
		</c:forEach>
	</tbody>
</table>
<br>
<br>
