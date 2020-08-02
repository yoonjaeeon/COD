<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.on{
	color:red;
}
.off{
	color:green;
}
</style>
<script>
$(function(){
	seatList();
	workerList();
});
//메뉴 목록 조회 요청
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
}
//자리 목록 조회 요청
function seatList() {
   $.ajax({
      url:'seat',
      type:'GET',
      contentType:'application/json;charset=utf-8',
      dataType:'json',
      error:function(xhr,status,msg){
         alert("상태값 :" + status + " Http에러메시지 :"+msg);
      },
      success:seatListResult
   });
}//seatList
//메뉴 목록 조회 응답
function workerListResult(data) {
   $("#workers").empty();
   $.each(data,function(idx,item){
      $('<div>').addClass('col-md-4 col-sm-6').addClass('wtbl')
      .append($('<div>').html('<i class="fas fa-user fa-2x"></i> <br>').addClass('workerIcon'))
      .append($('<div>').html(item.workerName ))
      .append($('<input type=\'hidden\' class=\'workerSeq\'>').val(item.workerSeq))
      .appendTo('#workers');
      if(item.workerState ==1){
    	 $('.workerIcon').addClass('off')
      }
   });//each
}//menuListResult
//메뉴 목록 조회 응답
function seatListResult(data) {
	$("#tblView").empty();
	   $.each(data,function(idx,item){
		  $('<div>').addClass('col-md-4 col-sm-6').addClass('stbl')
		  			.append($('<div>').html('<i class="fas fa-cog fa-2x"></i><br>').addClass('tblIcon'))
		  			.append($('<div>').html(item.seatName))
		  			.append($('<input type=\'hidden\' class=\'seatSeq\'>').val(item.seatSeq))
	      .appendTo('#tblView');
		  if(item.seatReserve ==0){
			  $('.tblIcon').addClass('off')
		  }else{
			  $('.tblIcon').addClass('on')
		  }
	   });
}//menuListResult
//출퇴기능
$('body').on('click', '.wtbl', function() {
	var workerSeq = $(this).find('.workerSeq').val();
	$.ajax({
		url : "adminWorker/" + workerSeq,
		type : 'GET',
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		error : function(xhr, status, msg) {
			alert("상태값 :" + status + " Http에러메시지 :" + msg);
		},
		success : workerSelectResult
	});
}); //조회 버튼 클릭

//출석 조회 응답
function workerSelectResult(worker) {
	if (worker.workerState == 0) {
		workerUpdate(worker.workerSeq, 1);
	} else {
		workerUpdate(worker.workerSeq, 0);
	}
}//츨석 업데이트
function workerUpdate(workerSeq, workerState) {
	if (workerState == 1) {
		$.post("commute", {workerSeq : workerSeq});
	}
	$.ajax({
		url : "workerState",
		type : 'PUT',
		data : JSON.stringify({
			workerSeq : workerSeq,
			workerState : workerState
		}),
		dataType : 'json',
		contentType : 'application/json;charset=utf-8',
		success : function(data) {
			workerList();
		},
		error : function(xhr, status, message) {
			alert(" status: " + status + " 에러:" + message);
		}
	});
}

//좌석 on off
$('body').on('click', '.stbl', function() {
	var seatSeq = $(this).find('.seatSeq').val();
	$.ajax({
		url : "seat/" + seatSeq,
		type : 'GET',
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		error : function(xhr, status, msg) {
			alert("상태값 :" + status + " Http에러메시지 :" + msg);
		},
		success : function(data){
			if(data.seatReserve==0){
				seatUpdate(data.seatSeq, 1);
			}else{
				seatUpdate(data.seatSeq, 0);
			}
		}
	});
});
function seatUpdate(seatSeq, seatReserve) {
	$.ajax({
		url : "seatReserve",
		type : 'PUT',
		data : JSON.stringify({
			seatSeq : seatSeq,
			seatReserve : seatReserve
		}),
		dataType : 'json',
		contentType : 'application/json;charset=utf-8',
		success : function(data) {
			seatList();
		},
		error : function(xhr, status, message) {
			alert(" status: " + status + " 에러:" + message);
		}
	});
}
</script>
<div class="row" style="margin: 3em">
	<!-- 메인왼쪽 -->
	<div class="col-lg-6">
		<!-- 알바생 출석체크  -->
		<div class="card mb-4">
			<div class="card-header">
				<h6 class="m-0 font-weight-bold">* 출 퇴근 *</h6>
			</div>
			<div class="card-body">
				<div class="row workericon" align="center" id="workers">
					
				</div>
			</div>
		</div>
		<!-- 테이블 on off -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold">* 테이블 ON/OFF *</h6>
			</div>
			<div class="card-body">
				<div class="row cafetables" align="center" id="tblView">
				</div>
			</div>
		</div>
	</div>
	
	<!-- 메인오른쪽 -->
	<div class="col-lg-6">

		<!-- 공지사항등록 -->
		<div class="card shadow mb-4">
			<div
				class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold">* 공지사항 *</h6>
				<div class="dropdown no-arrow">
					<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					 <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
					</a>
					<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
						<div class="dropdown-header">공지사항 관리</div>
						<!-- 목록p 링크걸기 -->
						<a class="dropdown-item" href="adminNoticeList"> 목록 보기 </a>
					</div>
				</div>
			</div>
			<!-- 공지사항등록 -->
			<div class="card-body" align="center">
				<form class="adminNoticeF" action="insertAdminNotice">
					<input type="text" placeholder="공지사항 제목" id="adminNoticeTitle" name="adminNoticeTitle" style="width: 100%"><br> <br>
					<textarea placeholder="공지사항을 입력해주세요" id="adminNoticeContent"	name="adminNoticeContent" style="width: 100%; height: 100px"> </textarea><br><br>
					<input type="submit" value="등록" class="btn btn-outline-info" style="margin-right: 2em">
					<input type="reset"	value="지우기" class="btn btn-outline-info">
				</form>
			</div>
		</div>
		<!-- Collapsable Card Example -->
		<div class="card shadow mb-4">
			<!-- Card Header - Accordion -->
			<a href="#collapseCardExample" class="d-block card-header py-3"
				data-toggle="collapse" role="button" aria-expanded="true"
				aria-controls="collapseCardExample">
				<h6 class="m-0 font-weight-bold text-primary"> <i class="far fa-bell"></i> * 주문현황 * <span class="badge badge-danger badge-counter">7</span></h6>
			</a>
			<!-- Card Content - Collapse -->
			<div class="collapse show" id="collapseCardExample">
				<div class="card-body">
					<div class="order">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>NO</th>
									<th>T번호</th>
									<th>주문내역</th>
									<th>완료</th>
									<th>거절</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach begin="0" end="3">
									<!-- 상세정보 볼 수 있는 modal,,,?뭐든 작업하기 -->
									<a href="#">
									<tr>
										<td>N</td>
										<td>T-N</td>
										<td>아메리카노 1, 라떼2</td>
										<!-- onclick 메소드 필요 함 -->
										<td><i class="fas fa-heart"></i></td>
										<td><i class="fas fa-times"></i></td>
									</tr>
									</a>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>