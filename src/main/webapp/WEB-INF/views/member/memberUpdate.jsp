<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
 
	function validCheck() {
		if (frm.pw.value == "") {
			alert("비밀번호를 입력하세요.")
			frm.pw.focus();
			return;
		} 
		if (frm.pw2.value == "") {
			alert("비밀번호를 확인해주세요!");
			frm.pw2.focus();
			return;
		}

		alert("수정이 완료 되었습니다");
		frm.submit();
	} 
	
	/* function pwValidCheck() {
		var alphaDigit = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		var reg = /^(?=.*?[a-z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{4,}$/;
		var pw = $("#pw").val();

		if (frm.pw.value.length < 4) {
			alert("※ 비밀번호는 4자리 이상 입력하셔야 합니다!");
			frm.pw.value = frm.pw2.value = "";
			frm.pw.focus();
			return;
		}
		if (frm.pw.value.indexOf(" ") >= 0) {
			alert(" ※ 비밀번호에는 공백이 들어가면 안됩니다!");
			frm.pw.value = frm.pw2.value = "";
			frm.pw.focus();
			return;
		}
		if (frm.pw.value.reg < 0) {
			alert("※ 패스워드는  영문/숫자/특수  문자를  혼합하여 입력해주세요! ");
			frm.pw.value = frm.pw2.value = "";
			frm.pw.focus();
			return;
		}
		if (false == reg.test(pw)) {
			alert("※ 패스워드는 영어/특수문자를 넣어야 합니다!");
			frm.pw.value = frm.pw2.value = "";
			frm.pw.focus();
			return;
		} 
	} */
</script>

<div class="content">
	<h2>회원 정보 수정 </h2>
	<form action="updateMemberForm" name="frm">		
			PW <span id="alert-success" style="display: none;" >비밀번호가 일치합니다.</span>
			<span id="alert-danger"  style="display: none; color: #d92742; font-weight: bold;"> 비밀번호가 일치하지 않습니다.</span> 
			<input type="password" id="pw" name="pw" class="pw" placeholder=" ※ 패스워드는 특수문자,영문 1개 이상을 포함하여야 합니다 ※  "><br />
			pw(확인) <input type="password" id="pw2" class="pw" placeholder="패스워드 확인  "> <br /> <br />
			닉네임 <input type="text" name="nickname" value="${member.nickname}" /><br /> <br /> 
			핸드폰 번호 <input type="text" name="phone" value="${member.phone}"/><br /> <br /> 
			생년월일<input type="date" name="birthday" /><br /> <br />
			<div class="align-center" style="margin-top: 30px">
			<br> <br>
			<div class="align-center" style="margin-top: 30px">
				<button type="button" onclick="validCheck()">수정완료</button>
			<input type="reset" value="지우기">
			</div>
		</div>
	</form>
</div>
<!-- <script>
	$('.pw').focusout(function() {
		var pwd1 = $("#pw").val();
		var pwd2 = $("#pw2").val();
		if (pwd1 != '' && pwd2 == '') {

		} else if (pwd1 != "" || pwd2 != "") {
			if (pwd1 == pwd2) {
				$("#alert-success").css('display', 'inline-block');
				$("#alert-danger").css('display', 'none');
				pwValidCheck();
			} else {
				alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
				$("#alert-success").css('display', 'none');
				$("#alert-danger").css('display', 'inline-block');
				$("#pw").val("");
				$("#pw2").val("");
				frm.pw.focus();
			}
		}
	});
</script>
 -->