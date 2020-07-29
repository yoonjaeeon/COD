<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			var seatSeq = $(this).closest('tr').find('#seatSeq').text();
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
			var seatSeq = $(this).closest('tr').find('#seatSeq').text();
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
		$('input:text[name="adminId"]').val(seat.adminId);
		$('input:text[name="seatSeq"]').val(seat.seatSeq);
		$('input:text[name="seatName"]').val(seat.seatName);	
		$('select[name="seatSize"]').val(seat.seatSize).attr("selected", "selected","selected","selected");
		$('input[file="seatImg"]').val(seat.seatImg);
		
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
			.append($('<td>').html(item.adminId))
			.append($('<td id=\'seatSeq\'></td>').html(item.seatSeq))
			.append($('<td>').html(item.seatName))					
			.append($('<td>').html(item.seatSize))
			.append($('<td>').html(item.seatImg))
			.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
			.append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
			.appendTo('tbody');
		});//each
	}//userListResult
</script>
<body>
<div class="container">
	<div class="row">
			<div class="col-lg-6">
				<form id="seatform" class="form-horizontal" method="post"  enctype="multipart/form-data" >
					<h2>좌석 등록</h2>
					<div class="form-group">
						<label> 관리자:</label> <input type="text" class="form-control"
							name="adminId" id="adminId" value="${sessionScope.adminId}" readonly>
					</div>
					<div class="form-group">
						<label> 좌석 번호:</label> <input type="text" class="form-control"
							name="seatSeq" id="seatSeq" readonly>
					</div>
					<div class="form-group">
						<label> 좌석 이름:</label> <input type="text" class="form-control"
							name="seatName" id="seatName" >
					</div>
					<div class="form-group">   
						<label>인원 선택:</label>
						<select class="form-control" name="seatSize">
							   		<option value="2">1~2인 이상</option>
							   		<option value="4">2~4인 이상</option>
							   		<option value="5">단체석</option>
						</select>
					</div>  
 					 <div class="form-group">
					<label>좌석 사진:</label><br> 
					<input type="file" name="upload" id="upload" >
					</div> 
					<div class="btn-group">      
						<input type="button"  class="btn btn-primary" value="등록"  id="btnInsert" /> 
						<input type="button"  class="btn btn-primary" value="수정"  id="btnUpdate" />
						<input type="button"  class="btn btn-primary" value="초기화" id="btnInit" />		
					</div>
				</form>
			</div>
					<div class="inputArea">
 					<p>대표 사진</p>
 					<img id="seatImg" src="resources/upload/${seat.seatImg}"style="width: 500px">
 					<img src="resources/upload/${seat.seatImg}"style="width: 500px">
 					</div>
			</div>
		</div>	
	<div>
		<div class="col-lg-6">
		<h2>좌석 목록</h2>
		<table class="table text-center">
			<thead>
			<tr>
			    <th class="text-center">관리자</th>				
				<th class="text-center">좌석 번호</th>
				<th class="text-center">좌석 이름</th>
				<th class="text-center">인원</th>
				<th class="text-center">좌석 사진</th>
			</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</div>
</body>
<%-- <h1>카페 좌석 관리</h1>
<style>
	div { text-align: center; }
</style>
<div class="container">
	<div style="float:right;">
       <button onclick="location='insertSeatForm'">좌석 등록</button>
    </div>
	<div id="listpage">
		<section class="posts">
				<article >
						<div class="row"> 
						<c:forEach begin="0" end="3">
						<div class="col-md-6">
						<a href="#" class="image fit"><img src="resources/images/main2.jpg"	alt="" style="width: 60%"></a>
							<h3>
								<a href="updateSeatForm">좌석 번호</a>
							</h3>
							<h4>1~2인이상</h4>
						</div>				
						</c:forEach>
						</div>
				</article>
		</section>
	</div>
</div> --%>
