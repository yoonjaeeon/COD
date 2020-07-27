<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h3>좌석 등록</h3>
<form name="frm" action="insertSeat" method="post" enctype="multipart/form-data">
	작성자: ${adminId} <br>
	카페 이름:${review.cafeName } <br> 
	리뷰 내용:<br />
	<textarea cols="30" rows="10" name="reviewContent" id="reviewContent"></textarea> <br /> 
	평점 : <input type="text" name="stars" id="stars" /><br />
	대표 사진<br>
      <input type="file" id="upload" name="upload"/>
      <br><br>
     첨부 사진<br>
      <input multiple="multiple" type="file" id="uploadFile" name="uploadFile"/>
      <br><br>

	<input type="submit" value="등록" />
	<input type="reset" value="지우기" />
</form>