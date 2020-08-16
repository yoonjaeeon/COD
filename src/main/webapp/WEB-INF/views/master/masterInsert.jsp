<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function validCheck() {
		/* not null 값 무조건 들어가야하니까 비면 경고창  */
		if (frm.adminId.value == "") {
			alert("id를 입력해주세요");
			frm.id.focus();
			return;
		}
		if (frm.pw.value == "") {
			alert("비밀번호를 입력하세요.")
			frm.pw.focus();
			return;
		}
		alert("마스터 멤버 등록완료 ");
		frm.submit();
	}
</script>

<div align="center">
<h3>마스터 관리자 추가</h3><br><br>
<form action="masterInsert" name="frm" style="width: 70%" >
	<input type="text" class="form-control" name="adminId" id="adminId" placeholder="아이디" onchange="idDupCheck()" />
	<br /> 
	<input type="password" class="form-control pw" id="pw" name="pw" placeholder=" 비밀번호 입력  "><br />
	<input type="text" class="form-control" name="adminPhone" placeholder=" 연락처 입력 " /><br /> <br /> 

	<button type="button" class="btn btn-outline-info" onclick="validCheck()">마스터  등록</button>
	<input type="reset" class="btn btn-outline-info" value="지우기">

</form>
</div>
