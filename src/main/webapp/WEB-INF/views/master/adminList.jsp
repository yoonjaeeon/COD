<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="resources/json.min.js"></script>
<script type="text/javascript" >

	$(function(){
		adminList();
		adminUpdate(); 
	});	
	
	//사용자 목록 조회 요청
	function adminList() {
		$.ajax({
			url:'adminList',
			type:'GET',			
			dataType:'json',
			data : 1,
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " 에러 메세지:"+msg);
			},
			success:adminListResult
		});
	}
	
	//관리자 목록 조회 응답
	function adminListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<td>').html(item.adminId))
			.append($('<input type=\'hidden\' id=\'hidden_pw\'>').val(item.pw))
			.append($('<input type=\'hidden\' id=\'hidden_pass2\'>').val(item.pass2))
			.append($('<td>').html(item.cafeState))
			.append($('<td>').html(item.adminPhone))
			.append($('<input type=\'hidden\' id=\'hidden_adminState\'>').val(item.adminState))
			.append($('<td>').html('<button id=\'btnUpdate1\'>승인</button>'))
			.append($('<td>').html('<button id=\'btnUpdate2\'>거절</button>'))
			.appendTo('tbody');
		});
	}
	
	
	/* //관리자 단건조회 요청
	function adminSelect1() {
		//조회 버튼 클릭
		$('body').on('click','#btnSelect',function(){
			var adminId = $(this).closest('tr').find('#hidden_adminId').val();
			//특정 사용자 조회
			$.ajax({
				url:'adminList/' + adminId,
				type:'GET',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:adminSelect1Result
			});
		}); //조회 버튼 클릭
	}//userSelect */
	
	/* //사용자 조회 응답
	function adminSelect1Result(admin) {
		$('input:text[name="adminId"]').val(admin.adminId);
		$('input:text[name="cafeState"]').val(admin.cafeState);
		$('input:text[name="adminPhone"]').val(admin.adminPhone);		
		//$('select[name="role"]').val(worker.role).attr("selected", "selected");
	}//userSelectResul */t
		
	//대기상태 수정 요청
	function cafeStateUpdate() {
		//수정 버튼 클릭
		$('#btnUpdate').on('click', function(){	
			var cafeState = $('input:text[name="cafeState"]').val();				
			    url: "adminList",
			    type: 'PUT', 
			    dataType: 'json', 
			    data : JSON.stringify({cafeState: cafeState}),
			    contentType:'application/json;charset=utf-8',
			    success: function(data) { 
			       adminList();
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" 에러:"+message);
			    }
			});
		});//수정 버튼 클릭
	}//userUpdate

	//사용자 삭제 요청
	function workerDelete() {
		//삭제 버튼 클릭
		$('body').on('click','#btnDelete',function(){
			var workerSeq = $(this).closest('tr').find('#hidden_workerSeq').val();
			var result = confirm(workerSeq +" 사용자를 정말로 삭제하시겠습니까?");
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
		
	
	//사용자 수정 요청
	function workerUpdate() {
		//수정 버튼 클릭
		$('#btnUpdate').on('click', function(){	
			var workerSeq = $('tbody').find('#hidden_workerSeq').val();
			var workerName = $('input:text[name="workerName"]').val();
			var workerBirth = $('input:text[name="workerBirth"]').val();
			var pay = $('input:text[name="pay"]').val();
			var workerGrade = $('select[name="workerGrade"]').val();			
			$.ajax({ 
			    url: "adminWorker", 
			    type: 'PUT', 
			    dataType: 'json', 
			    data : JSON.stringify({workerSeq:workerSeq, workerName: workerName, workerBirth:workerBirth,workerGrade: workerGrade, pay: pay}),
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
	

	
</script>
<body>
	
      <div class= "container" align="center">
      <input type="button" class="btn btn-outline-info" value="카페 등록 대기 조회" id="adminList1"/> &nbsp;
      <input type="button" class="btn btn-outline-info" value="카페 관리자 조회 " id="btnUpdate" /> &nbsp;
      <input type="button" class="btn btn-outline-info" value="전체 관리자 조회 " id="btnInit" />
      </div>

	<hr/>
	
	<div class="col-lg">
		<h2>관리자 대기 리스트  </h2>
		<table class="table text-center">
			<thead>
			<tr>				
				<th class="text-center">관리자 아이디</th>
				<th class="text-center">관리자 연락처</th>
				<th class="text-center">관리자 대기 상태</th>			
				<th class="text-center">상태승인 </th>
				<th class="text-center">상태거절 </th>
			</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</body>
