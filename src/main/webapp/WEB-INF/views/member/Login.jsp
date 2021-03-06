<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
    
    var message = '${msg}';
    if(message.length>0){
    	alert('${msg}');
    }
    
    function validCheck(){
    	if (frm.email.value == "") {
			alert("email를 입력해주세요");
			frm.email.focus();
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
              <div class="col-lg-11">
                  <div class="text-right">
                    <a class="small" href="home"><i class="fa fa-home"></i></a> / <a class="small" href="adminLoginForm"><b>관리자</b></a>
                  </div>
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">로그인</h1>                    
                  </div>
                  <form class="user" action="memberLogin" method="post" name="frm">
                    <div class="form-group">
                      <input type="email" class="form-control form-control-user" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter Email Address...">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" name="pw" id="pw" placeholder="Password">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">Remember Me</label>
                      </div>
                    </div>
                    <!-- <a href="memberLogin" onclick="validCheck()" class="btn btn-info btn-user btn-block">
                      Login
                    </a>    -->                 
                    <button type="button" onclick="validCheck()" class="btn btn-info btn-user btn-block" value="로그인">로그인
                    </button> 
                    <hr>
            		<%--<div id="kakao_id_login" style="text-align: center"> 
			            <a href="${kakao_url}"> 
			            <img width="223" src="resources/admin/scss/kakao/kakao_login_medium_wide.png" /></a> 
			        </div> --%>
                    <a href="${kakao_url}" class="btn btn-warning btn-user btn-block">
                      <i class="fab fa-kickstarter-k"></i>   카카오톡 로그인
                    </a>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="forgot-password.html">패스워드 찾기</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="memberInsertForm">회원가입 </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>