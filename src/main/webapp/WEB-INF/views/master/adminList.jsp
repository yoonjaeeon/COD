<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="resources/json.min.js"></script>
<script type="text/javascript">

	$(function() {
		selectList(1);
		cafeStateUpdate();
		cafeStateU-pdate1() 
       //	adminList();
		// cafeInfo();
	});

	
	// 행 클릭시 카페 상세 이벤트
	/* function cafeInfo() {
		$.ajax({
			$('body').on('click', function() {					
			
			
			}		
		})	
	} */
		
	//사용자 목록 조회 요청
	function adminList() {
		$.ajax({
			url : 'adminList',
			type : 'GET',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " 에러 메세지:" + msg);
			},
			success : adminListResult
		});
	}
		
	function cafeList(adminId){
		location.href = "cafeList?adminId=" + adminId;
		
	}
	
	// 부트스트랩 아작스 모달 검색 
		
		
	//관리자 목록 조회 응답
	function adminListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx, item) {
			$('<tr>' )
				.append($('<td>').append($('<a>').attr({"href":"javascript:void(0)", "onclick":"cafeList(\'" +item.adminId + "\')"}).html(item.adminId)))
				.append($('<input type=\'hidden\' id=\'hidden_pw\'>').val(item.pw))
				.append($('<input type=\'hidden\' id=\'hidden_pass2\'>').val(item.pass2))
				.append($('<td>').html(item.adminPhone))
				.append($('<td>').html(item.cafeState))
				.append($('<input type=\'hidden\' id=\'hidden_adminState\'>').val(item.adminState))
				.append($('<td>').html('<button class=\'btnUpdate1\'>승인</button>'))
				.append($('<td>').html('<button class=\'btnUpdate2\'>거절</button>'))
				.appendTo('tbody');
			});
		//$('#contentModal').modal()
	}

	//사용자 상태따른 목록보기
	function selectList(cafeState) {
		$.ajax({
			url : 'adminList/' + cafeState,
			type : 'GET',
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : adminListResult
		});
	}

	$('body').on('click', '#state1', function() { selectList(1); }); //조회 버튼 클릭
	$('body').on('click', '#state2', function() { selectList(2); }); //조회 버튼 클릭
	$('body').on('click', '#state3', function() { selectList(3); }); //조회 버튼 

	//대기상태 승인으로 바꿈  카페 상태 , 날짜 디비에 입력 
	function cafeStateUpdate() {
		//수정 버튼 클릭
		$('body').on('click','.btnUpdate1', function() {			
			var adminId = $(this).parent().parent().children().eq(0).text();
			var tr = $(this).parent().parent();
			console.log(adminId);
			//var adminId = $('tbody').find('#adminId').val();
			$.ajax({
				url : "adminList",
				type : 'PUT',
				dataType : 'json',
				data : JSON.stringify({adminId:adminId , cafeState:2} ),
				contentType : 'application/json;charset=utf-8',
				success : function(data) {
					//	adminList();
					tr.remove();
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " 에러:" + message);
				}
			});
		});//수정 버튼 클릭
	}//userUpdate
	//대기상태 수정 요청
		
	
	// 카페 승인 거절 
	function cafeStateUpdate1() {
		//수정 버튼 클릭
		$('body').on('click','.btnUpdate2', function() {			
			var adminId = $(this).parent().parent().children().eq(0).text();
			var tr = $(this).parent().parent();
			console.log(adminId);
			//var adminId = $('tbody').find('#adminId').val();
			$.ajax({
				url : "adminList",
				type : 'PUT',
				dataType : 'json',
				data : JSON.stringify({adminId:adminId , cafeState:3} ),
				contentType : 'application/json;charset=utf-8',
				success : function(data) {
				//adminList();	
					tr.remove();
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " 에러:" + message);
				}
			});
		});//수정 버튼 클릭
	}//userUpdate
	
	
	
	//admin 아이디 검색 
	
	$(document).ready(function(){
		  $("#searchMenu").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#adminTbl tr").filter(function() {
		    	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});
	});
	
	
</script>


<body>
	<hr />
	<div class="container" align="center">
		<input type="button" class="btn btn-outline-info" value="카페 등록 대기 " id="state1" /> &nbsp; 
		<input type="button" class="btn btn-outline-info" value="카페 관리자  " id="state2" /> &nbsp; 
		<input type="button" class="btn btn-outline-info" value="카페 승인 거절 " id="state3" />
	</div>
      <div class="row" style="margin-bottom: 1em">
      	<div class="col-6"></div>
      	<input class="form-control col-5" id="searchMenu" type="text" placeholder="관리자 아이디 ">
      	<i class="fa fa-search col-1" style="font-size:24px;" ></i>
      </div>
	<div class="col-lg">
		<h2>관리자 리스트</h2>
		<table class="table text-center" id="adminTbl">
			<thead>
				<tr >
					<th class="text-center">관리자 아이디</th>
					<th class="text-center">관리자 연락처</th>
					<th class="text-center">관리자 대기 상태</th>
					<th class="text-center">상태승인</th>
					<th class="text-center">상태거절</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</body>

</head>

<%-- 
<!-- Modal -->
<div class="modal fade" id="contentModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">관리자 상세 </h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h2><span id="getMessageTitle"> </span></h2> <br>
				<span id="getMessageContent"></span>
				${messageTitle } <br>
				${getMessageContent}fff
				
				<!--  여기다 카페명 . 카페 주소 . 카페 사진 . 카페 연락처  -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

 --%>
