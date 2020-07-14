<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row3">
		<main class="hoc container clear">
			<div class="content" style="height: 52%">
				<div id="comments" align="center">
					<h2>LOGIN</h2><br>
					<form action="UsersLogin.do" method="post">
						<div style="width: 70%">
						<input type ="text" name ="id" placeholder="id" ><br>
						<input type="password" name ="pw" placeholder="pw"><br><br>
						<span>${errorMsg}</span>
						</div>
						<div>
							<input type="submit" name="submit" value="카카오 로그인 ">
							<input type="submit" name="submit" value="Login">
						</div>
					</form>
				</div>
			</div>
			<div class="clear"></div>
		</main>
	</div>
</body>
</html>