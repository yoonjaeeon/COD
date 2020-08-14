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
<br>
<div class="post">
<h3 align="center">리뷰 작성</h3>
<form name="frm" action="insertReview" method="post" enctype="multipart/form-data">
<%-- 	작성자: ${loginEmail} <br>
	카페 이름: ${param.cafeName } <br>  --%>
	<div class="form-group">
		<input type="hidden" class="form-control"
		name="orderSeq" id="orderSeq" value="${param.orderSeq}">
	    </div>
	리뷰 내용:<br />
	<textarea class="form-control" cols="30" rows="10" name="reviewContent" id="reviewContent"></textarea> <br /> 
	<div class="starRev">
	  <span class="starR on">1</span>
	  <span class="starR">2</span>
	  <span class="starR">3</span>
	  <span class="starR">4</span>
	  <span class="starR">5</span>
	  <input type="hidden" name="stars" id="stars" value="1">
	</div>
	대표 사진<br>
	<div class="custom-file mb-3">
	      <input type="file" class="custom-file-input" id="upload" name="upload">
	      <label class="custom-file-label" for="customFile"> 파일을 선택해 주세요 </label>
    </div>
      <br><br>
        첨부 사진<br>
      <div class="custom-file mb-3">
	      <input type="file" class="custom-file-input" id="uploadFile" name="uploadFile">
	      <label class="custom-file-label" for="customFile"> 파일을 선택해 주세요 </label>
      </div>
      <br><br>
	<div align="center">
	<button type="button" onclick="validCheck()">등록</button>
	<input type="reset" value="지우기" />
	</div>
</form>
</div>
<script>

$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  $('input:hidden[name="stars"]').val($(this).text());
	  return false;
});

$(document).ready(function(){
	  $("#searchNotice").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#masterNoticeTbl tr").filter(function() {
	    	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});
});

var str = document.getElementById("textarea").value;

str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');

document.getElementById("textarea").value = str;
</script>