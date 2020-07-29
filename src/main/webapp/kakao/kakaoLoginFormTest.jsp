<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



리다이렉트 예제 - authorize, login, loginForm<br>
<a href = "kakaologin1.jsp"> 로그인 이동</a><p>


페이지내 처리 예제 - createLoginButton<br>
<a id = "kakao-login-bin"> 로그인 이동</a><br>

<p>
<a href= "https://developers.kakao.com/logout">로그아웃</a></p>

<script src='https://code.jquery.com/jquery-3.1.1.min.js'></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>

	// var client_email = null;
	//<![CDATA[
		//사용할 앱의 JavaScript 키를 설정해주세요 
	kakao.init('0bb9eafc3a1ab150ed68b1b3120d2c61');
	// 카카오 로그인 버튼을 생성합니다 .
	kakao.Auth.createLoginButton({
	container: '#kakao-login-btn',
	success: function(authObj) {
		kakao.API.request({
			url:'/v2/user/me',
			success: function(res){
				console.log(res);
			var id = res.id;
			var email = res.kakao_account.email;
			var name = res.properties.nickname;
			var html = '<br>'+email+'<br>'+name;
			
			html += '<br><img src="' +image +'">';
				
			}
			
		})
		
	}
	
	})
		
		



</body>
</html>