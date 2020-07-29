<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<div class="content row">
	<div class="col-xl-6" align="center" style="padding: 3em">
		<form name="frm" id="workerform" action="updateSeat" class="form-horizontal">
			<h4>좌석 수정</h4>
			<hr>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="좌석 번호" name="">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="인원"name="">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="좌석 사진"	name="">
			</div>
			<div class="btn-group">
				<button type="button" onclick="validCheck()">수정</button> 
			    <input type="reset" value="초기화" />
			</div>
		</form>
	</div>
</div>
</html>