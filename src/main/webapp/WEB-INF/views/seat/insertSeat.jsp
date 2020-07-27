<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- <script>
	function validCheck(){
		//필수 입력 체크
		if(frm.reviewContent.value == ""){ //trim함수
			alert("리뷰 내용을 작성해 주세요.");
			frm.reviewContent.focus();
			return;
		}
		if(frm.stars.value == ""){
			alert("평점을 입력해주세요.");
			frm.stars.focus();
			return;
		}
		//체크박스
	/* 	hobby = document.getElementsByName("hobby");
		var cnt = 0;
		for(i=0; i<hobby.length; i++){
			if(hobby[i].checked == true) {
				cnt++;
			}
		} */
		frm.submit();
	}
</script> -->
<div class="content row">
	<div class="col-xl-6" align="center" style="padding: 3em">
		<form name="frm" id="workerform" action="insertSeat"
			class="form-horizontal">
			<h4>좌석 등록</h4>
			<hr>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="좌석 번호"
					name="name">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="인원" name="pay">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="좌석 사진"
					name="birthday">
			</div>
			<div class="btn-group">
				<button type="button" onclick="validCheck()">등록</button>
				<input type="reset" value="지우기" />
			</div>
		</form>
	</div>
</html>