<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
						<br> <br>
						<h2>관리자(사장) 리스트</h2>									
									<input name="p" value="1" type="hidden">
										<input type="text" name="name" id="name" placeholder="관리자이름" class="two_third first">
										<button class="btn one_third"> 검색 </button><br><br>
								<br>
							<table border="1">
								<thead>
									<tr>
										<th>id</th>
										<th>이름</th>										
										<th>수정 </th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="vo">
										<tr>
											<td>${vo.id}</td>
											<td>${vo.name }</td>									
										</tr>
								</c:forEach>
								</tbody>
							</table>	<br><br>					
						<c:if test="${loginAId!=null }"><br><br>				
					<a href="AdminInsert" class="btn">관리자 등록 </a><br><br>					
				</c:if> <br> <br>


</body>
</html>