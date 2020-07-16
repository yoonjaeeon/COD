<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	직원 출퇴근 ON/OFF<br>
	<table>
		<tr>
			<th>직원명</th>
			<th>출근</th>
			<th>퇴근</th>
		</tr>
	</table>
</div>
<div>테이블 ON/OFF</div>
<div>
	공지사항<br>
	<form action="insertAdminNotice">
		<input type="text" placeholder="공지사항 제목" id="adminNoticeTitle"
			name="adminNoticeTitle"><br>
		<textarea id="adminNotice" placeholder="공지사항을 입력해주세요"
			id="adminNoticeContent" name="adminNoticeContent"> 
		</textarea>
		<br> <input type="submit" value="등록">
	</form>
</div>
<div>
	주문현황
	<table>
		<tr>
			<th>테이블번호</th>
			<th>메뉴</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
		</tr>
	</table>
</div>
<div></div>
