<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
html, body {
  font-size: 20px;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: border-box;
}

body {
  padding: 40px;
  margin: 0;
  line-height: 1.5;
  background-color: #fff;
  font-family: Roboto, Helvetica, Arial, sans-serif;
  color: #333;
}

h1 {
  margin-top: 2em;
  line-height: 1.25;
  text-align: center;
  color: black;
}

/* highlight colors */
::-moz-selection {
  background-color: #333;
  color: white;
}

::selection {
  background-color: #333;
  color: white;
}

/* wrapper */
.wrapper {
  max-width: 80%;
  padding-right: 10em;
  padding-left: 10em;
  margin-right: auto;
  margin-left: auto;
}

/* tabs */
.tabs {
  border-right: 1px solid #ccc;
}
.tabs:after {
  content: "";
  display: table;
  clear: both;
}
.tabs input[type=radio] {
  display: none;
}
.tabs label {
  display: block;
  float: left;
  width: 33.33333%;
  padding: 1em;
  border: 1px solid #ccc;
  border-right: none;
  background-color: #f7f7f7;
  text-align: center;
  font-weight: 700;
  color: #2ebaae;
  cursor: pointer;
  -webkit-transition: background-color 150ms ease-in-out;
  transition: background-color 150ms ease-in-out;
}
.tabs label:hover {
  background-color: white;
}
.tabs [id^="tab"]:checked + label {
  border-bottom-color: white;
  background: white;
  color: #333;
}

.tab-content {
  display: none;
  float: left;
  width: 100%;
  padding: 1em;
  border-bottom: 1px solid #ccc;
  border-left: 1px solid #ccc;
  background-color: white;
}

#tab1:checked ~ #tab-content1,
#tab2:checked ~ #tab-content2,
#tab3:checked ~ #tab-content3 {
  display: block;
}

.other-content {
  color: white;
}

@media only screen and (max-width: 768px) {
  body, html {
    font-size: 18px;
  }
}
@media only screen and (max-width: 645px) {
  .tabs label {
    float: none;
    width: 100%;
  }
}
@media only screen and (max-width: 480px) {
  body, html {
    font-size: 16px;
  }
}
</style>

<script>
$(function(){
	$.ajax({
		url : "adminList",
		type : 'PUT',
		dataType : 'json',
		data : JSON.stringify({adminId:"${id}" , cafeState:0} ),
		contentType : 'application/json;charset=utf-8'
	})
});
</script>

<div class="wrapper">
	<h1>입점 심사가 거절 당했습니다</h1><br><br><br>
	<div align="center">
	<h6> * 자세한 사항은 아래 안내를 참고 하세요 *</h4><br><br><br>
	</div>
	<div class="tabs cf">
		<input type="radio" name="tabs" id="tab1" checked>
		<label for="tab1">
        	승인이 거절 될 경우 
      </label>
		<input type="radio" name="tabs" id="tab2">
		<label for="tab2">
        	관리자 문의        	
      </label>
		<input type="radio" name="tabs" id="tab3">
		<label for="tab3">
        	관리자 연락 문의
      </label>
		<div id="tab-content1" class="tab-content">
			＊사업자 번호가 불확실 할때.<br>
			＊필수 입력창이 비어있을때. <br>
			＊매장에 따른 문제가 있을때 . <br>
		</div>
		<div id="tab-content2" class="tab-content">
			＊관리자문의 번호: 010-2566-2896, 010-7607-6012<br>
			＊이메일: ha2896@naver.com <br>
		</div>
		<div id="tab-content3" class="tab-content">
			＊사업자 번호 기재가 올바르지 않으면 심사가 밀립니다.<br>
	        ＊카페 등록 후 3일~5일 정도 심사가 이루어 집니다.
		</div>
	</div>
	<br><br>
	<div align="center">
	<br><br>
	<div align="center">
	<button type="button" onclick="location.href='home'">홈으로</button>
	
	
	</div>

	</div>

