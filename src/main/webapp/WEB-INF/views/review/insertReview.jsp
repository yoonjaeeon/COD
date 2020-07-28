<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
	function validCheck() {
		//필수 입력 체크
		if (frm.reviewContent.value == "") { //trim함수
			alert("리뷰 내용을 작성해 주세요.");
			frm.reviewContent.focus();
			return;
		}
		if (frm.stars.value == "") {
			alert("평점을 입력해주세요.");
			frm.stars.focus();
			return;
		}
		frm.submit();
	}
</script>
<h3>리뷰 작성</h3>
<form name="frm" action="insertReview" method="post" enctype="multipart/form-data">
	작성자: ${loginEmail} <br>
	카페 이름:${review.cafeName } <br> 
	<div class="form-group">
		<label> 관리자:</label> <input type="text" class="form-control"
		name="adminId" id="adminId" <%-- value="${sessionScope.adminId}" readonly --%>>
	    </div>
	리뷰 내용:<br />
	<textarea cols="30" rows="10" name="reviewContent" id="reviewContent"></textarea> <br /> 
	평점 : <input type="text" name="stars" id="stars" /><br />
	대표 사진<br>
      <input type="file" id="upload" name="upload"/>
      <br><br>
     첨부 사진<br>
      <input multiple="multiple" type="file" id="uploadFile" name="uploadFile"/>
      <br><br>

	<button type="button" onclick="validCheck()">등록</button>
	<input type="reset" value="지우기" />
</form>