<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script src='https://code.jquery.com/jquery-3.1.1.min.js'></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
		
		kakao.init('0bb9eafc3a1ab150ed68b1b3120d2c61');
		 
		kakao.Auth.authorize({
			redirectUri: 'https://redd-on.com/kakaoRedirectForm.jsp'	 
		})
	
		kakao.Auth.login({
			success: function(authObj) {
		
			kakao.API.request({
				url:'/v2/user/me',
				success: function(res){
				console.log(res);						
				var email = res.kakao_account.email;
				var name = res.properties.nickname;
								
			
				}
				
			})
			console.log(authObj);
			var token = authObj.access_token;
			
			},
			fail: function(err) {
				alert(JSON.stringify(err));
				
			}
		});



</script>


</body>
</html>