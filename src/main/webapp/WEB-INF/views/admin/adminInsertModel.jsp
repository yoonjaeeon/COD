<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script>
function validCheck() {
	/* not null 값 무조건 들어가야하니까 비면 경고창  */
	if (frm.id.value == "") {
		alert("id를 입력해주세요");
		frm.id.focus();
		return;
	}
		frm.submit();
}

</script>
</head>
<body>

<h2> 관리자 회원가입 </h2> <br>
		ID 
		<span id="idCheck"></span>
		<input type="text" name="id" id=admin_id" placeholder="관리자 아이디 "onchange="idDupCheck()" /> <br/>	<br/>						
		PW		
		 <input type="password" id="pw" name="pw" class="pw" placeholder=" ※ 패스워드 ※  "><br/>
		2차 비밀번호 
		<input type="password" id="pw2" class="pw2" placeholder="2차 패스워드   "> <br/><br/>
			
		핸드폰 번호 
		<input type="text" name="admin_phone" /><br/><br/>		
				<button type="button" onclick="validCheck()">회원가입</button>
				<input type="reset" value="지우기" />
		</div>
</body>
</html>