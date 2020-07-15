<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>   

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
