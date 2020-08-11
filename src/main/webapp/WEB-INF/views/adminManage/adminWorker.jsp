<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="resources/json.min.js"></script>
<script type="text/javascript" >


	$(function(){
		workerList();
	 	workerSelect();
		workerDelete();
		workerInsert();
		workerUpdate(); 
		init();
	});	
	//초기화
	function init() {
		//초기화 버튼 클릭
		$('#btnInit').on('click',function(){
			$('#workform').each(function(){
				this.reset();
			});
		});
	}//init	
	//사용자 등록 요청
	function workerInsert(){
		//등록 버튼 클릭
		$('#btnInsert').on('click',function(){
			console.log($("#workform").serialize());
			$.ajax({ 
			    url: "adminWorker",  
			    type: 'POST',  
			    dataType: 'json', 
			    data : $("#workform").serialize(),			    
			    success: function(response) {
			    	console.log(response.kkk)
			    	if(response.result == true) {
			    		workerList();
			    	}
			    }, 
			    error:function(xhr, status, message) { 
			        alert(""+ status+" 정보를 입력해주세요 "+message);
			    } 
			 });  
		});//등록 버튼 클릭
	}//userInsert	
	//사용자 삭제 요청
	function workerDelete() {
		//삭제 버튼 클릭
		$('body').on('click','#btnDelete',function(){
			var workerSeq = $(this).closest('tr').find('.workerSeq').val();
			var result = confirm(" 사용자를 정말로 삭제하시겠습니까?");
			if(result) {
				$.ajax({
					url:'adminWorker/'+ workerSeq,  
					type:'DELETE',
					contentType:'application/json;charset=utf-8',
					dataType:'json',
					error:function(xhr,status,msg){					
						console.log("상태값 :" + status + " Http에러메시지 :"+msg);
					}, success:function(xhr) {
						console.log(xhr.result);
						workerList();
						
					}
				});      }//if
		}); //삭제 버튼 클릭
	}//userDelete
	
	//사용자 조회 요청
	function workerSelect() {
		//조회 버튼 클릭
		$('body').on('click','#btnSelect',function(){
			var workerSeq = $(this).closest('tr').find('.workerSeq').val();
			console.log(workerSeq);
			//특정 사용자 조회
			$.ajax({
				url:'adminWorker/' + workerSeq,
				type:'GET',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:workerSelectResult
			});
		}); //조회 버튼 클릭
	}//userSelect
	
	//사용자 조회 응답
	function workerSelectResult(worker) {
		$('input:text[name="workerName"]').val(worker.workerName);
		$('input:text[name="workerBirth"]').val(worker.workerBirth);
		$('input:text[name="pay"]').val(worker.pay);
		$('input:hidden[name="workerSeq"]').val(worker.workerSeq);
		$('select[name="workerGrade"]').val(worker.workerGrade).attr("selected", "selected","selected");
		//$('select[name="role"]').val(worker.role).attr("selected", "selected");
	}//userSelectResult
	
	//사용자 수정 요청
	function workerUpdate() {
		//수정 버튼 클릭
		$('#btnUpdate').on('click', function(){	
			console.log(JSON.stringify($("#workform").serializeObject()));
			$.ajax({ 
			    url: "adminWorker/", 
			    type: 'PUT', 
			    dataType: 'json', 			    
			   	data : JSON.stringify($("#workform").serializeObject()),		
			    contentType:'application/json;charset=utf-8',
			    success: function(data) { 
			       workerList();
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" 에러:"+message);
			    }
			});
		});//수정 버튼 클릭
	}//userUpdate
	
	
	//사용자 목록 조회 요청
	function workerList() {
		$.ajax({
			url:'adminWorker',
			type:'GET',			
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " 에러 메세지:"+msg);
			},
			success:workerListResult
		});
	}//직원 리스트 조회
	
	//사용자 목록 조회 응답
	function workerListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<td>').html(item.workerName))
			.append($('<td>').html(item.pay))
			.append($('<td>').html(item.workerGrade))
			.append($('<td>').html(item.workerBirth))
			.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
			.append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
			.append($('<input type=\'hidden\' class=\'workerSeq\'>').val(item.workerSeq))
			.appendTo('tbody');
		});//each
	}//userListResult
</script>
<body>
<div class="container">
	<div class="row">
		<div class="col-lg-6">
		<form id="workform"  class="form-horizontal">				
			<input type="hidden" class="form-control" name="workerSeq" id="workerSeq">				
			<h2>직원 등록 및 수정</h2>
			<div class="form-group">		
				<label >직원이름 :</label>
				<input type="text"  class="form-control" name="workerName" id="workerName">
			</div>	
			<div class="form-group">
				<label>직원생일:</label>
				<input type="text"  class="form-control"  name="workerBirth" id="workerBirth">
			</div>	
			<div class="form-group">
				<label>직원급여:</label>
				<input type="text"  class="form-control"  name="pay" id="pay">
			</div>			
			<div class="form-group">   
				<label>등급:</label>
					<select class="form-control" name="workerGrade">
						   		<option value="0">매니저</option>
						   		<option value="1">정직원</option>
						   		<option value="2">알바</option>
					</select>
			</div>  
			<div class="btn-group">      
				<input type="button"  class="btn btn-primary" value="등록"  id="btnInsert" /> 
				<input type="button"  class="btn btn-primary" value="수정"  id="btnUpdate" />
				<input type="button"  class="btn btn-primary" value="초기화" id="btnInit" />		
					</div>
		</form>
		</div>
	<hr/>		
	<div class="col-lg-6">
		<h2>직원목록</h2>
		<table class="table text-center">
			<thead>
			<tr>				
				<th class="text-center">직원이름</th>
				<th class="text-center">월급/시급</th>
				<th class="text-center">직원등급</th>
				<th class="text-center">직원생일</th>
				<th class="text-center">직원조회</th>
				<th class="text-center">직원삭제</th>
			</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</div>
</div>
</body>