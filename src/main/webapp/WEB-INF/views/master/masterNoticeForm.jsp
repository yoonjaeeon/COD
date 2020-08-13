<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

  <script src="http://code.jquery.com/jquery-1.11.0.js"> </script>
  <script src="pager.js"> </script>

<script src="./resources/json.min.js"></script>
<script type="text/javascript">
$(function(){
	masterNoticeList();
	masterNoticeSelect();
	masterNoticeDelete();
	masterNoticeInsert();
	masterNoticeUpdate();
	init();
});

//초기화
function init() {
   //초기화 버튼 클릭
   $('#btnInit').on('click',function(){
      $('#masterNoticeF').each(function(){
         this.reset();
         $('textArea[name="masterNoticeContent"]').text("");
      });
   });
}//init

//공지 등록 요청
function masterNoticeInsert(){
   $('#btnInsert').on('click',function(){
	  console.log($("#masterNoticeF").serialize())
      $.ajax({ 
          url: "masterNotice",  
          type: 'POST',  
          dataType: 'json', 
          data :  $("#masterNoticeF").serialize(),
          success: function(response) {
             if(response.result == true) {
                masterNoticeList();
             }
          }, 
          error:function(xhr, status, message) { 
              alert(" status: "+status+" er:"+message);
          } 
       });  
   });
}//masterNoticeInsert
//공지 삭제
function masterNoticeDelete() {
   //삭제 버튼 클릭
   $('body').on('click','#btnDelete',function(){
      var masterNoticeSeq = $(this).closest('tr').find('#masterNoticeSeq').val();
      $.ajax({
         url:'masterNotice/'+masterNoticeSeq,  
         type:'DELETE',
         contentType:'application/json;charset=utf-8',
         dataType:'json',
         error:function(xhr,status,msg){
            console.log("상태값 :" + status + " Http에러메시지 :"+msg);
         }, success:function(xhr) {
            console.log(xhr.result);
            masterNoticeList();
         }
      });
   }); //삭제 버튼 클릭
}//masterNoticeDelete

//메뉴 조회 요청
function masterNoticeSelect() {
   $('body').on('click','#btnSelect',function(){
      var masterNoticeSeq = $(this).closest('tr').find('#masterNoticeSeq').val();
      $.ajax({
         url:'masterNotice/'+masterNoticeSeq,
         type:'GET',
         contentType:'application/json;charset=utf-8',
         dataType:'json',
         error:function(xhr,status,msg){
            alert("상태값 :" + status + " Http에러메시지 :"+msg);
         },
         success:masterNoticeSelectResult
      });
   }); //조회 버튼 클릭
}

//메뉴 조회 응답
function masterNoticeSelectResult(masterNotice) {
	$('input:hidden[name="masterNoticeSeq"]').val(masterNotice.masterNoticeSeq);
	$('input:text[name="masterNoticeTitle"]').val(masterNotice.masterNoticeTitle);
	$('textArea[name="masterNoticeContent"]').text(masterNotice.masterNoticeContent);
}//masterNoticeSelectResult

//메뉴 수정 요청
function masterNoticeUpdate() {
   $('#btnUpdate').on('click',function(){
      $.ajax({ 
          url: "masterNotice", 
          type: 'PUT', 
          data: JSON.stringify($("#masterNoticeF").serializeObject()),
          dataType: 'json', 
          contentType: 'application/json',
          success: function(data) { 
              masterNoticeList();
          },
          error:function(xhr, status, message) { 
              alert(" status: "+status+" er:"+message);
          }
      });
   });
}//masterNoticeUpdate

//메뉴 목록 조회 요청
function masterNoticeList() {
   $.ajax({
      url:'masterNotice',
      type:'GET',
      contentType:'application/json;charset=utf-8',
      dataType:'json',
      error:function(xhr,status,msg){
         alert("상태값 :" + status + " Http에러메시지 :"+msg);
      },
      success:masterNoticeListResult
   });
}//masterNoticeList

//메뉴 목록 조회 응답
function masterNoticeListResult(data) {
   $("tbody").empty();
   $.each(data,function(idx,item){
      $('<tr>')
      .append($('<td>').html(item.masterNoticeTitle))
      .append($('<td>').html(item.masterNoticeDate))
      .append($('<td>').html('<i id="btnSelect" class="fas fa-eye"style="font-size:24px"\'></button>'))
      .append($('<td>').html('<i id=\'btnDelete\'class="fas fa-times-circle" style="font-size:24px"></i>'))
      .append($('<input type=\'hidden\' id=\'masterNoticeSeq\'>').val(item.masterNoticeSeq))
      .appendTo('tbody');
   });//each
}//masterNoticeListResult
	
$(document).ready(function(){
	  $("#searchNotice").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#masterNoticeTbl tr").filter(function() {
	    	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});
});
</script>
</head>
<body>
	<div align="center" class="container">
		<h4>공지사항</h4>
		<br>
		<form id="masterNoticeF" class="form-horizontal">
				<input type="text" placeholder="공지사항 제목" id="masterNoticeTitle"	name="masterNoticeTitle" style="width: 100%" required><br> <br>
				<textarea placeholder="공지사항을 입력해주세요" id="masterNoticeContent"	name="masterNoticeContent" style="width: 100%; height: 150px" required></textarea>
				<input type="hidden" id="masterNoticeSeq" name="masterNoticeSeq"><br> <br>
			<br>
			<div class="btn-group">
				<input type="button" class="btn" value="등록" id="btnInsert" />
				<input type="button" class="btn" value="수정" id="btnUpdate" />
				<input type="button" class="btn" value="초기화" id="btnInit" />
			</div>
		</form>
		<br>
		<br>

		<h6 align="left">공지사항 목록</h6>
		<div class="row" style="margin-bottom: 1em">
			<div class="col-6"></div>
			<input class="form-control col-5" id="searchNotice" type="text"	placeholder="Search..">
			<i class="fa fa-search col-1" style="font-size: 24px;"></i>
		</div>
		<table class="table text-center" id="masterNoticeTbl">
			<thead>
				<tr>
					<th class="text-center">제목</th>
					<th class="text-center">작성일자</th>
					<th class="text-center">조회</th>
					<th class="text-center">삭제</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>

	<hr />