<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="resources/json.min.js"></script>
<script type="text/javascript">
	$(function() {
		selectList(1);
		cafeStateUpdate();
		cafeStateUpdate1() 
	});

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

	//관리자 목록 조회 응답
	function adminListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx, item) {
			$('<tr>')
				.append($('<td>').html(item.adminId))
				.append($('<input type=\'hidden\' id=\'hidden_pw\'>').val(item.pw))
				.append($('<input type=\'hidden\' id=\'hidden_pass2\'>').val(item.pass2))
				.append($('<td>').html(item.adminPhone))
				.append($('<td>').html(item.cafeState))
				.append($('<input type=\'hidden\' id=\'hidden_adminState\'>').val(item.adminState))
				.append($('<td>').html('<button class=\'btnUpdate1\'>승인</button>'))
				.append($('<td>').html('<button class=\'btnUpdate2\'>거절</button>'))
				.appendTo('tbody');
			});
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

	$('body').on('click', '#state1', function() {
		selectList(1);
	}); //조회 버튼 클릭
	$('body').on('click', '#state2', function() {
		selectList(2);
	}); //조회 버튼 클릭
	$('body').on('click', '#state0', function() {
		selectList(0);
	}); //조회 버

	//대기상태 수정 요청
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
				data : JSON.stringify({adminId:adminId , cafeState:1} ),
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
	
</script>
<body>

	<div class="container" align="center">
		<input type="button" class="btn btn-outline-info" value="카페 등록 대기 조회"
			id="state1" /> &nbsp; 
		<input type="button"
			class="btn btn-outline-info" value="카페 관리자 조회 " id="state2" />
			&nbsp; 
		<input type="button" class="btn btn-outline-info"
			value="전체 관리자 조회 " id="state0" />
	</div>

	<hr />

	<div class="col-lg">
		<h2>관리자 리스트</h2>
		<table class="table text-center">
			<thead>
				<tr>
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
