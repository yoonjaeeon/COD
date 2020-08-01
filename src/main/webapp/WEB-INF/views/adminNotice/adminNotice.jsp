<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="./resources/json.min.js"></script>
<script type="text/javascript">
$(function(){
	adminNoticeList();
	adminNoticeSelect();
	adminNoticeDelete();
	adminNoticeInsert();
	adminNoticeUpdate();
	init();
});

//초기화
function init() {
   //초기화 버튼 클릭
   $('#btnInit').on('click',function(){
      $('#adminNoticeF').each(function(){
         this.reset();
      });
   });
}//init

//공지 등록 요청
function adminNoticeInsert(){
   $('#btnInsert').on('click',function(){
	  console.log($("#adminNoticeF").serialize())
      $.ajax({ 
          url: "adminNotice",  
          type: 'POST',  
          dataType: 'json', 
          data :  $("#adminNoticeF").serialize(),
          success: function(response) {
             if(response.result == true) {
                adminNoticeList();
             }
          }, 
          error:function(xhr, status, message) { 
              alert(" status: "+status+" er:"+message);
          } 
       });  
   });
}//adminNoticeInsert
//공지 삭제
function adminNoticeDelete() {
   //삭제 버튼 클릭
   $('body').on('click','#btnDelete',function(){
      var adminNoticeSeq = $(this).closest('tr').find('#adminNoticeSeq').val();
      $.ajax({
         url:'adminNotice/'+adminNoticeSeq,  
         type:'DELETE',
         contentType:'application/json;charset=utf-8',
         dataType:'json',
         error:function(xhr,status,msg){
            console.log("상태값 :" + status + " Http에러메시지 :"+msg);
         }, success:function(xhr) {
            console.log(xhr.result);
            adminNoticeList();
         }
      });
   }); //삭제 버튼 클릭
}//adminNoticeDelete

//메뉴 조회 요청
function adminNoticeSelect() {
   $('body').on('click','#btnSelect',function(){
      var adminNoticeSeq = $(this).closest('tr').find('#adminNoticeSeq').val();
      $.ajax({
         url:'adminNotice/'+adminNoticeSeq,
         type:'GET',
         contentType:'application/json;charset=utf-8',
         dataType:'json',
         error:function(xhr,status,msg){
            alert("상태값 :" + status + " Http에러메시지 :"+msg);
         },
         success:adminNoticeSelectResult
      });
   }); //조회 버튼 클릭
}

//메뉴 조회 응답
function adminNoticeSelectResult(adminNotice) {
	$('input:hidden[name="adminNoticeSeq"]').val(adminNotice.adminNoticeSeq);
	$('input:text[name="adminNoticeTitle"]').val(adminNotice.adminNoticeTitle);
	$('textArea[name="adminNoticeContent"]').text(adminNotice.adminNoticeContent);

}//adminNoticeSelectResult

//메뉴 수정 요청
function adminNoticeUpdate() {
   $('#btnUpdate').on('click',function(){
	   var adminNoticeSeq = $(this).closest('tr').find('#adminNoticeSeq').val();
      $.ajax({ 
          url: "adminNotice", 
          type: 'PUT', 
          dataType: 'json', 
          contentType: 'application/json',
          success: function(data) { 
              adminNoticeList();
          },
          error:function(xhr, status, message) { 
              alert(" status: "+status+" er:"+message);
          }
      });
   });
}//adminNoticeUpdate

//메뉴 목록 조회 요청
function adminNoticeList() {
   $.ajax({
      url:'adminNotice',
      type:'GET',
      contentType:'application/json;charset=utf-8',
      dataType:'json',
      error:function(xhr,status,msg){
         alert("상태값 :" + status + " Http에러메시지 :"+msg);
      },
      success:adminNoticeListResult
   });
}//adminNoticeList

//메뉴 목록 조회 응답
function adminNoticeListResult(data) {
   $("tbody").empty();
   $.each(data,function(idx,item){
      $('<tr>')
      .append($('<td>').html(item.adminNoticeTitle))
      .append($('<td>').html(item.adminNoticeTime))
      .append($('<td>').html('<i id="btnSelect" class="fas fa-eye"style="font-size:24px"\'></button>'))
      .append($('<td>').html('<i id=\'btnDelete\'class="fas fa-times-circle" style="font-size:24px"></i>'))
      .append($('<input type=\'hidden\' id=\'adminNoticeSeq\'>').val(item.adminNoticeSeq))
      .appendTo('tbody');
   });//each
}//adminNoticeListResult
	
$(document).ready(function(){
	  $("#searchNotice").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#adminNoticeTbl tr").filter(function() {
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
		<form id="form1" class="form-horizontal">
			<form class="adminNoticeF">
				<input type="text" placeholder="공지사항 제목" id="adminNoticeTitle"	name="adminNoticeTitle" style="width: 100%"><br> <br>
				<textarea placeholder="공지사항을 입력해주세요" id="adminNoticeContent"	name="adminNoticeContent" style="width: 100%; height: 150px"> </textarea>
			</form>
			<br><br>
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
		<table class="table text-center" id="adminNoticeTbl">
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