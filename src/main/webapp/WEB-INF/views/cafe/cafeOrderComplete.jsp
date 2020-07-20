<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
	<h1>주문이 완료되었습니다.</h1>
	<table border="1">
		<tr>
			<th>메뉴명</th>
			<th>수량</th>
			<th>금액</th>
			<th>주문날짜</th>
		</tr>
		<tr>
			<td>아메리카노</td>
			<td>2</td>
			<td>4000</td>
			<td>2020-07-21 11:30</td>
		</tr>
	</table>
	<br>
	<h3>총 주문 금액 : 4000원</h3>
	<button onclick="location.href='home'">메인으로</button>
</div>