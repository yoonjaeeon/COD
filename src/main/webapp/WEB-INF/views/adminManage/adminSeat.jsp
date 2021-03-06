<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.seatimg
{width : 50px}
</style>
<script src="resources/json.min.js"></script>
<script type="text/javascript" >

	$(function(){
		seatList();

		seatSelect();
		
		seatDelete();
		
		seatInsert();
	
		seatUpdate(); 
		
		init();
	});	
	//초기화
	function init() {
		//초기화 버튼 클릭
		$('#btnInit').on('click',function(){
			$('#seatform').each(function(){
				this.reset();
			});
		});
	}//init	
	//사용자 등록 요청
	function seatInsert(){
		//등록 버튼 클릭
		$('#btnInsert').on('click',function(){
			console.log($("#seatform").serialize());
			var form = $('#seatform')[0];
			var data = new FormData(form);
			$.ajax({ 
			    url: "seat",  
			    type: 'POST',
			    dataType: 'json', 
			    enctype: 'multipart/form-data',
			    data :data,
			    contentType:false,
			    processData: false,
			    cache: false,
			    success: function(data) {
			    	console.log(data.kkk)
			    	if(data.result == true) {
			    		seatList();
			    	}
			    }, 
			    error:function(xhr, status, message) { 
			        alert(""+ status+" 정보를 입력해주세요 "+message);
			    } 
			 });  
		});//등록 버튼 클릭
	}//userInsert	
	
	//사용자 삭제 요청
	function seatDelete() {
		//삭제 버튼 클릭
		$('body').on('click','#btnDelete',function(){
			var seatSeq = $(this).closest('tr').find('.seatSeq').text();
			var result = confirm(seatSeq +" 사용자를 정말로 삭제하시겠습니까?");
			if(result) {
				$.ajax({
					url:'seat/'+ seatSeq,  
					type:'DELETE',
					contentType:'application/json;charset=utf-8',
					cache: false,
					dataType:'json',
					error:function(xhr,status,msg){
						console.log("상태값 :" + status + " Http에러메시지 :"+msg);
					}, success:function(xhr) {
						console.log(xhr.result);
						seatList();
					}
				});      }//if
		}); //삭제 버튼 클릭
	}//userDelete
	
	//사용자 조회 요청
	function seatSelect() {
		//조회 버튼 클릭
		$('body').on('click','#btnSelect',function(){
			var seatSeq = $(this).closest('tr').find('.seatSeq').text();
			console.log(seatSeq);
			//특정 사용자 조회
			$.ajax({
				url:'seat/' + seatSeq,
				type:'GET',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:seatSelectResult
			});
		}); //조회 버튼 클릭
	}//userSelect
	
	//사용자 조회 응답
	function seatSelectResult(seat) {
		$('input:hidden[name="adminId"]').val(seat.adminId);
		$('input:hidden[name="seatSeq"]').val(seat.seatSeq);
		$('input:text[name="seatName"]').val(seat.seatName);	
		$('select[name="seatSize"]').val(seat.seatSize).attr("selected", "selected","selected","selected");
		/* $('input[file="seatImg"]').val(seat.seatImg); */
		$('#seatImg').attr("src", "resources/upload/" + seat.seatImg);
		//$('select[name="role"]').val(worker.role).attr("selected", "selected");
	}//userSelectResult
	
	
	//사용자 수정 요청
	function seatUpdate() {
		//수정 버튼 클릭
		$('#btnUpdate').on('click', function(){	
	/* 		var seatSeq = $('input:text[name="seatSeq"]').val();
			var seatName = $('input:text[name="seatName"]').val();
			var adminId = $('input:text[name="adminId"]').val();
			var seatSize = $('select[name="seatSize"]').val();
			var seatImg = $('input:file[name="upload"]').val(); */
			var form = $('#seatform')[0];
			var data = new FormData(form);
			$.ajax({ 
			    url: "seatup", 
			    type: 'post', 
			    dataType: 'json',
			    data : data, /* JSON.stringify({seatSeq:seatSeq, 
			    	seatName:seatName, 
			    	adminId:adminId,
			    	seatSize:seatSize, 
			    	seatImg:seatImg }) */
			 /*    contentType:'application/json;charset=utf-8', */
			    enctype: 'multipart/form-data',
			    contentType:false,
			    processData: false,
			    cache: false,
			    success: function(data) { 
			    	seatList();
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" 에러:"+message);
			    }
			});
		});//수정 버튼 클릭
	}//userUpdate
	
	
	//사용자 목록 조회 요청
	function seatList() {
		$.ajax({
			url:'seat',
			type:'GET',			
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " 에러 메세지:"+msg);
			},
			success:seatListResult
		});
	}//직원 리스트 조회
	
	//사용자 목록 조회 응답
	function seatListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<input type=\'hidden\' id=\'adminId\'>').html(item.adminId))
			.append($('<input type=\'hidden\' class=\'seatSeq\'>').html(item.seatSeq))
			/* .append($('<td>').html(item.adminId))
			.append($('<td id=\'seatSeq\'></td>').html(item.seatSeq)) */
			.append($('<td>').html(item.seatName))					
			.append($('<td>').html(item.seatSize))
			.append($('<td>').html("<img class='seatimg' src='resources/upload/"+ item.seatImg +"'>"))
			.append($('<td>').html('<i id="btnSelect" class="fas fa-eye"style="font-size:24px"\'></button>'))
      		.append($('<td>').html('<i id=\'btnDelete\'class="fas fa-times-circle" style="font-size:24px"></i>'))
			.appendTo('tbody');
		});//each
	}//userListResult
</script>

<div class="container">
	<div class="row">
			<div class="col-lg-6">
				<form id="seatform" class="form-horizontal" method="post"  enctype="multipart/form-data" >
					<h2>좌석 등록</h2>
					<div class="form-group">
						<input type="hidden" name="adminId">
					</div>
					<div class="form-group">
						<input type="hidden" name="seatSeq">
					</div> 	 		
					<div class="form-group">
						<label> 좌석 이름:</label> <input type="text" class="form-control"
							name="seatName" id="seatName" >
					</div>
					<div class="form-group">   
						<label>인원 선택:</label>
						<select class="form-control" name="seatSize">
					   		<option value="1">1~2인 이상</option>
					   		<option value="2">2~4인 이상</option>
					   		<option value="3">단체석</option>
						</select>
					</div>  
 					<div class="form-group">
						<label>좌석 사진:</label><br> 
						<div class="custom-file mb-3">
					      <input type="file" class="custom-file-input" id="upload" name="upload">
					      <label class="custom-file-label" for="customFile"> 파일을 선택해 주세요 </label>
					    </div>
				    </div>
					<div class="btn-group" style="margin-left: 7em">      
						<input type="button"  class="btn btn-outline-info" value="등록"  id="btnInsert" /> 
						<input type="button"  class="btn btn-outline-info" value="수정"  id="btnUpdate" />
						<input type="button"  class="btn btn-outline-info" value="초기화" id="btnInit" />		
					</div>
				</form>
			</div>
				<div class="inputArea col-lg-6">
 					<p>좌석 사진</p>
 					<img id="seatImg" style="width: 100%; max-height: 300px; overflow: hidden;">
 				</div>
			</div>
	<div>
		<div class="col-lg-6">
		<br><br>
		<h2>좌석 목록</h2>
		<table class="table text-center">
			<thead>
			<tr>
				<th>좌석 이름</th>
				<th>인원</th>
				<th>좌석 사진</th>
				<th>조회</th>
				<th>삭제</th>
			</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
 </div>
</div>
<script>
// Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>

