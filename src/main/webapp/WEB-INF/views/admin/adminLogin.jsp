<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
var message = '${msg}';
if(message.length>0){
	alert(message);
}
	function validCheck() {
		if (frm.adminId.value == "") {
			alert("id를 입력해주세요");
			frm.adminId.focus();
			return;
		}
		if (frm.pw.value == "") {
			alert("비밀번호를 입력하세요.")
			frm.pw.focus();
			return;
		}
		frm.submit();
	}
</script>
<div class="container">

	<div class="row justify-content-center">

		<div class="col-xl-10 col-lg-12 col-md-9">

			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="*/image/admin.jpg"></div>
						<div class="col-lg-6">
							<div class="text-right">
                    <a class="small" href="memberLoginForm">일반회원 로그인 </a> / <a class="small" href="home">홈 화면으로</a>
                  			</div>
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">관리자 로그인 </h1>
								</div>
								<form class="adminLogin" action="adminLogin" method="post"
									name="frm">
									<div class="form-group">
										<input type="text" class="form-control form-control-user"
											id="adminId" name="adminId" aria-describedby="emailHelp"
											placeholder="Enter Id Address...">
									</div>
									<div class="form-group">
										<input type="password" class="form-control form-control-user"
											name="pw" id="pw" placeholder="Password">
									</div>
									<div class="form-group">
										<div class="custom-control custom-checkbox small">
											<input type="checkbox" class="custom-control-input"
												id="customCheck"> <label
												class="custom-control-label" for="customCheck">자동저장</label>
										</div>
									</div>
									<button type="button" onclick="validCheck()"
										class="btn btn-info btn-user btn-block" onclick="validCheck()"
										value="로그인">LOGIN</button>
									<hr>
								</form>
								<hr>
								<div class="text-center">
									<a class="small" href="forgot-password.html">패스워드 찾기</a>
								</div>
								<div class="text-center">
									<a class="small" href="adminInsertForm"> 관리자 회원가입</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


