<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<script>
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
</script>
<h3>리뷰 작성</h3>
<form name="frm" action="insertReview">
카페 이름 : <input type="text" name="cafeName" id="cafeName"/><br/>
리뷰 내용:<br/>
<textarea cols="30" rows="10"
          name="reviewContent" id="reviewContent"></textarea><br/>
평점 : <input type="text" name="stars" id="stars"/><br/>
<button type="button" onclick="validCheck()">등록</button>
<input type="reset" value="지우기" />
</form>
</body>
</html>