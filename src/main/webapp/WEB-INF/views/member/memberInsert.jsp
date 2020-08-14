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
      if (frm.nickname.value == "") {
         alert("닉네임을 입력해주세요");
         frm.nickname.focus();
         return;

      }
      if (frm.phone.value == "") {
         alert("핸드폰번호를 입력해주세요");
         frm.phone.focus();
         return;

      }
      if (frm.birthday.value == "") {
         alert("생년월일을 입력해주세요");
         frm.birthday.focus();
         return;
      }
        
      alert("회원가입을 축하합니다!");
      frm.submit();
   }
	////// 아이디 중복체크 
	/////////아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
	function fn_idChk(){
		$.ajax({
			url : "idcheck",
			type : "post",
			dataType : "json",
			data : {"email" : $("#email").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 아이디입니다.");
					frm.email.value ="";
				}else if(data == null ||  data == ""){
					$("#idCheck").attr("value", "Y");
					$("#idCheck").css('display', 'inline-block');
				}
			}
		})
	}	
   ///////비밀번호
   
   function pwValidCheck() {
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
	  

   }
</script>
<div class="content">
<h2>일반 회원가입</h2>
<form action="memberInsert" name="frm" method="post">
   <br> EMAIL <span id="idCheck" style="display:none;">사용가능한 아이디 입니다.</span>
 <input class="form-control" type="text" id="email" name="email" onchange="fn_idChk();" />

   <br />
   
    PW <span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span> 
       <span id="alert-danger"  style="display: none; color: #d92742; font-weight: bold;">
      비밀번호가 일치하지 않습니다.</span> 
      <input type="password" id="pw" name="pw" class="pw" placeholder=" ※ 패스워드는 특수문자,영문 1개 이상을 포함하여야 합니다 ※  "><br />
  
  
   pw(확인) <input type="password" id="pw2" class="pw" placeholder="패스워드 확인  "> <br /> <br />
  
   닉네임     <input type="text" name="nickname" /><br /> <br /> 
   핸드폰 번호 <input type="text" id="phone" name="phone" maxlength="13" placeholder="010-0000-0000"/><br /> <br /> 
   생년월일   <input type="date" name="birthday" /><br /> <br />
   <div class="align-center" style="margin-top: 30px">
      <br> <br>
      <div class="align-center" style="margin-top: 30px">
         <button type="button" onclick="validCheck()">회원가입</button>
         <input type="reset" value="지우기">
      </div>
   </div>
</form>
</div>
<script>
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
   
   var autoHypenPhone = function(str){
	    str = str.replace(/[^0-9]/g, '');
	    var tmp = '';
	    if( str.length < 4){
	        return str;
	    }else if(str.length < 7){
	        tmp += str.substr(0, 3);
	        tmp += '-';
	        tmp += str.substr(3);
	        return tmp;
	    }else if(str.length < 11){
	        tmp += str.substr(0, 3);
	        tmp += '-';
	        tmp += str.substr(3, 3);
	        tmp += '-';
	        tmp += str.substr(6);
	        return tmp;
	    }else{              
	        tmp += str.substr(0, 3);
	        tmp += '-';
	        tmp += str.substr(3, 4);
	        tmp += '-';
	        tmp += str.substr(7);
	        return tmp;
	    }

	    return str;
	}


	var phone = document.getElementById('phone');

	phone.onkeyup = function(){
	console.log(this.value);
	this.value = autoHypenPhone( this.value ) ;  
	}
</script>