<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>직원 관리 </title>
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="./resources/json.min.js"></script>
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
			$('#form1').each(function(){
				this.reset();
			});
		});
	}//init
	
	//사용자 삭제 요청
	function workerDelete() {
		//삭제 버튼 클릭
		$('body').on('click','#btnDelete',function(){
			var userId = $(this).closest('tr').find('#hidden_workerSeq').val();
			var result = confirm(userId +" 사용자를 정말로 삭제하시겠습니까?");
			if(result) {
				$.ajax({
					url:'workers/'+worker_seq,  
					type:'DELETE',
					contentType:'application/json;charset=utf-8',
					dataType:'json',
					error:function(xhr,status,msg){
						console.log("상태값 :" + status + " Http에러메시지 :"+msg);
					}, success:function(xhr) {
						console.log(xhr.result);
						userList();
					}
				});      }//if
		}); //삭제 버튼 클릭
	}//userDelete
	
	
	//사용자 수정 요청
	function workerUpdate() {
		//수정 버튼 클릭
		$('#btnUpdate').on('click',function(){
			var workerName= $('input:text[name="workerName"]').val();
			var workerGrade = $('input:text[name="workerGrade"]').val();
			var pay = $('input:number[name="pay"]').val();
			var role = $('select[name="role"]').val();		
			$.ajax({ 
			    url: "workers", 
			    type: 'PUT', 
			    dataType: 'json', 
			    data: JSON.stringify({ workerName: workerName, workerGrade:workerGrade, pay: pay, role: role }),
			    contentType: 'application/json',
			    success: function(data) { 
			        userList();
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    }
			});
		});//수정 버튼 클릭
	}//userUpdate
	
	//사용자 등록 요청
	function workerInsert(){
		//등록 버튼 클릭
		$('#btnInsert').on('click',function(){
			$("#form1")

			$.ajax({ 
			    url: "workers",  
			    type: 'POST',  
			    dataType: 'json', 
			    data :  $("#form1").serialize(),
			    //data: JSON.stringify({ id: id, name:name,password: password, role: role }),
			    /* data : JSON.stringify($("#form1").serializeObject()),
			    contentType: 'application/json', */ 
			    success: function(response) {
			    	if(response.result == true) {
			    		workerList();
			    	}
			    }, 
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    } 
			 });  
		});//등록 버튼 클릭
	}//userInsert
	
	//사용자 목록 조회 요청
	function workerList() {
		$.ajax({
			url:'workers',
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:userListResult
		});
	}//userList
	
	//사용자 목록 조회 응답
	function workerListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<td>').html(item.workerName))
			.append($('<td>').html(item.workerGrade))
			.append($('<td>').html(item.pay))
			.append($('<td>').html(item.role))
			.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
			.append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
			.append($('<input type=\'hidden\' id=\'hidden_userId\'>').val(item.id))
			.appendTo('tbody');
		});//each
	}//userListResult
</script>
</head>
<body>
<div class="container">
	<form id="form1"  class="form-horizontal">
		<h2>직원 등록 및 수정</h2>
		
		<div class="form-group">		
			<label >직원이름 :</label>
			<input type="text"  class="form-control" name="id" >
		</div>	
		<div class="form-group">
			<label>직원생일:</label>
			<input type="text"  class="form-control"  name="name" >
		</div>	
		<div class="form-group">
			<label>직원급여:</label>
			<input type="text"  class="form-control"  name="password" >
		</div>			
<!-- 		<div class="form-group">
			<label >성별:</label>
			<div class="radio">
				<label><input type="radio"  name="gender"  value="남">남</label>
			</div>
			<div class="radio">
				<label><input type="radio"  name="gender"  value="여">여</label>
			</div>	
		</div>	 -->    
		<div class="form-group">   
			<label>등급:</label>
				<select class="form-control" name="role">
					   		<option value="Admin">관리자</option>
					   		<option value="User">알바</option>
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
<div class="container">	
	<h2>직원목록</h2>
	<table class="table text-center">
		<thead>
		<tr>
			<th class="text-center">직원번호</th>
			<th class="text-center">이름</th>
			<th class="text-center">직원생일</th>
			<th class="text-center">직원등급</th>
		</tr>
		</thead>
		<tbody></tbody>
	</table>
</div>	
</body>
</html>