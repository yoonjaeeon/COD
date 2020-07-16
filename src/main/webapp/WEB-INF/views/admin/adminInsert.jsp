<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/login";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
			});
			
				
			
		})
	</script>
	<body>
		<section id="container">
			<form action="/member/register" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="admin_Id">아이디</label>
					<input class="form-control" type="text" id="adminId" name="Id" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="pw">패스워드</label>
					<input class="form-control" type="pw" id="pw" name="Pw" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="pw2">2차 패스워드 </label>
					<input class="form-control" type="text" id="pw2" name="pw2" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="pw2">핸드폰번호  </label>
					<input class="form-control" type="text" id="admin_phone" name="admin_phone" />
				</div>
				
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
	</body>
	
</html>
