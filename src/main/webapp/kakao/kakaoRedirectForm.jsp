<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href= "https://developers.kakao.com/logout">로그아웃</a></p>
<script src='https://code.jquery.com/jquery-3.1.1.min.js'></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>

kakao.init('');


kakao.Auth.login({
	success: function(authObj) {

	kakao.API.request({
		url:'/v2/user/me',
		success: function(res){
			console.log(res);
		
			var id = res.id;
		var email = res.kakao_account.email;
		var name = res.properties.nickname;
		var html = '<br>'+email+'<br>'+name;
			
		$('body').append(html);
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