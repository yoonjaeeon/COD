<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="./resources/json.min.js"></script>
<script type="text/javascript">
	$(function() {
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
		$('#btnInit').on('click', function() {
			$('#form1').each(function() {
				this.reset();
			});
		});
	}//init

	//사용자 삭제 요청
	function adminNoticeDelete() {
		//삭제 버튼 클릭
		$('body').on('click', '#btnDelete', function() {
			var adminNoticeId = $(this).closest('tr').find('#hidden_adminNoticeId').val();
			var result = confirm(adminNoticeId + " 사용자를 정말로 삭제하시겠습니까?");
			if (result) {
				$.ajax({
					url : 'adminNotices/' + adminNoticeId,
					type : 'DELETE',
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',
					error : function(xhr, status, msg) {
						console.log("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(xhr) {
						console.log(xhr.result);
						adminNoticeList();
					}
				});
			}//if
		}); //삭제 버튼 클릭
	}//adminNoticeDelete

	//사용자 조회 요청
	function adminNoticeSelect() {
		//조회 버튼 클릭
		$('body').on('click', '#btnSelect', function() {
			var adminNoticeId = $(this).closest('tr').find('#hidden_adminNoticeId').val();
			//특정 사용자 조회
			$.ajax({
				url : 'adminNotices/' + adminNoticeId,
				type : 'GET',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				error : function(xhr, status, msg) {
				/* 	alert("상태값 :" + status + " Http에러메시지 :" + msg); */
				},
				success : adminNoticeSelectResult
			});
		}); //조회 버튼 클릭
	}//adminNoticeSelect

	//사용자 조회 응답
	function adminNoticeSelectResult(adminNotice) {
		$('input:text[name="id"]').val(adminNotice.id);
		$('input:text[name="name"]').val(adminNotice.name);
		$('input:text[name="password"]').val(adminNotice.password);
		$('select[name="role"]').val(adminNotice.role).attr("selected", "selected");
	}//adminNoticeSelectResult

	//사용자 수정 요청
	function adminNoticeUpdate() {
		//수정 버튼 클릭
		$('#btnUpdate').on('click', function() {
			var id = $('input:text[name="id"]').val();
			var name = $('input:text[name="name"]').val();
			var password = $('input:text[name="password"]').val();
			var role = $('select[name="role"]').val();
			$.ajax({
				url : "adminNotices",
				type : 'PUT',
				dataType : 'json',
				data : JSON.stringify({
					id : id,
					name : name,
					password : password,
					role : role
				}),
				contentType : 'application/json',
				success : function(data) {
					adminNoticeList();
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});
		});//수정 버튼 클릭
	}//adminNoticeUpdate

	//사용자 등록 요청
	function adminNoticeInsert() {
		//등록 버튼 클릭
		$('#btnInsert').on('click', function() {
			$("#form1")

			$.ajax({
				url : "adminNotices",
				type : 'POST',
				dataType : 'json',
				data : $("#form1").serialize(),
				//data: JSON.stringify({ id: id, name:name,password: password, role: role }),
				/* data : JSON.stringify($("#form1").serializeObject()),
				contentType: 'application/json', */
				success : function(response) {
					if (response.result == true) {
						adminNoticeList();
					}
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});
		});//등록 버튼 클릭
	}//adminNoticeInsert

	//사용자 목록 조회 요청
	function adminNoticeList() {
		$.ajax({
			url : 'adminNotices',
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			error : function(xhr, status, msg) {
				/* alert("상태값 :" + status + " Http에러메시지 :" + msg); */
			},
			success : adminNoticeListResult
		});
	}//adminNoticeList

	//사용자 목록 조회 응답
	function adminNoticeListResult(data) {
		$("tbody").empty();
		$.each(data, function(idx, item) {
			$('<tr>').append($('<td>').html(item.id)).append(
					$('<td>').html(item.name)).append(
					$('<td>').html(item.password)).append(
					$('<td>').html(item.role)).append(
					$('<td>').html('<button id=\'btnSelect\'>조회</button>'))
					.append(
							$('<td>').html(
									'<button id=\'btnDelete\'>삭제</button>'))
					.append(
							$('<input type=\'hidden\' id=\'hidden_adminNoticeId\'>')
									.val(item.id)).appendTo('tbody');
		});//each
	}//adminNoticeListResult
</script>
</head>
<body>
	<div class="container row">
		<div class="col-6">
		<form id="form1" class="form-horizontal">
			<h2>공지사항 등록 및 수정</h2>
			<form class="adminNoticeF" action="insertAdminNotice">
					<input type="text" placeholder="공지사항 제목" id="adminNoticeTitle" name="adminNoticeTitle" style="width: 100%"><br> <br>
					<textarea placeholder="공지사항을 입력해주세요" id="adminNoticeContent"	name="adminNoticeContent" style="width: 100%; height: 100px"> </textarea><br><br>
			</form>
			<div class="btn-group">
				<input type="button" class="btn btn-primary" value="등록" id="btnInsert" /> 
				<input type="button" class="btn btn-primary" value="수정" id="btnUpdate" /> 
				<input type="button" class="btn btn-primary" value="초기화" id="btnInit" />
			</div>
		</form>
		</div>
		<div class="col-6">
		<h2>공지사항 목록</h2>
		<table class="table text-center">
			<thead>
				<tr>
					<th class="text-center">제목</th>
					<th class="text-center">작성일자</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		</div>
	</div>
	<hr />