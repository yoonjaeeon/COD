<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="container">
		<h2>member list</h2>
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<colgroup>
					<col style="width: auto;" />
					<col style="width: 25%;" />
					<col style="width: 25%;" />
					<col style="width: 15%;" />				
				</colgroup>
				<thead>
					<tr>
						<th>email</th>
						<th>birthday</th>
						<th>phone</th>
						<th>nickname</th>			
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty memberList }">
							<tr>
								<td colspan="5" align="center">데이터가 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty memberList}">
							<c:forEach var="list" items="${MemberList}">
								<tr>
									<td><c:out value="${list.email}" /></td>
									<td><c:out value="${list.pw}" /></td>
									<td><c:out value="${list.birthday}" /></td>
									<td><c:out value="${list.nickname}" /></td>								
								</tr>
							</c:forEach>
						</c:when>
						<>
					</c:choose>
				</tbody>
			</table>
		</div>
				<button class="btn btn-sm btn-primary" name="btnSearch"
					id="btnSearch">검색</button>
			</div>
		</div>
		<!-- search{e} -->
	</div>
</article>

