<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>관리자(사장) 리스트</h2>
<input name="p" value="1" type="hidden">
<input type="text" name="name" id="name" placeholder="관리자이름"
	class="two_third first">
<button class="btn one_third">검색</button>
<br>
<br>
<br>
<table border="1">
	<thead>
		<tr>
			<th>id</th>
			<th>카페 입점상태</th>
			<th>관리자 핸드폰 번호 </th>
			<th>관리자 권한 </th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="vo">=
			<tr>
				<td>${vo.adminid}</td>
				<td>${vo.cafe_state }</td>
				<td>${vo.admin_phone }</td>
				<td>${vo.admin_state }</td>
				<c:if test="${loginAId !=null }">
					<td><a href=" =${vo.}"><img
							src=" "  /></a></td>
					<td><a href=" =${vo.n_seq}"><img
							src=" " /></a></td>
				</c:if>
			</tr>
		</c:forEach>
	</tbody>
</table>
<br>
<br>
<c:if test="${loginAId!=null }">
	<br>
	<br>
	<a href="AdminInsert" class="btn">관리자 등록 </a>
	<br>
	<br>
</c:if>
