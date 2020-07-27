<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
/* 	$(function() {
		$('#myModal').on('shown.bs.modal', function() {
			$('#myInput').trigger('focus')
		})

		$()
	}); */
	
	function sendMasterMessage(value) {	
		$('#myModal').modal('show');		
		$('#myInput').trigger('focus');
		$('#adminId').val(value);		
	};
	
	

</script>

<table border="1" id="testBoardTable">
	<tr id='tr'>
		<!-- <th><input type="checkBox" id="chkAll"></th> -->
		<th>제목</th>
		<th>아이디</th>
		<th>답장</th>
		<th>읽음</th>
		<!-- data-toggle="modal" data-target="#exampleModal" -->
	</tr>
	<c:forEach items="${messageList}" var="list">
		<tr>
			<!-- <td><input type="checkbox" name="check"></td> -->
			<td data-toggle="modal" data-target="#contentModal" onclick="messageUpdate(${list.messageSeq })"><span id="messageTitle"></span>${list.messageTitle }</td>
			<td data-toggle="modal" data-target="#contentModal" onclick="messageUpdate(${list.messageSeq })"><span id="messageAdminId"></span>${list.adminId }</td>
			<td><button data-toggle="modal" data-target="#modalMessage" onclick="sendMasterMessage('${list.adminId }')">답장</button></td>
			<td align="center" class="readClass" id="messageRead"> <!-- 메세지 읽음표시  -->
			<span id="messageUpdate"> 			
			<c:if test="${list.masterRead == 1 }">
				<i class="far fa-envelope"></i>
			</c:if> 
			<c:if test="${list.masterRead == 0 }">
				<i class='far fa-envelope-open'></i>
			</c:if>
			</span>	
			</td>
		</tr>
	</c:forEach>
</table>


<!-- 페이징 처리하기 -->
<form action="" id="modal" method="post"></form>

<!-- Modal -->
<div class="modal fade" id="contentModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">메세지</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h2><span id="getMessageTitle"> </span></h2> <br>
				<span id="getMessageContent"></span>
				<%-- ${messageTitle } <br>
				${getMessageContent}fff --%>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal Message -->
<div class="modal fade" id="modalMessage" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">메세지 보내기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="post" id="sendModal" name="sendModal">
				<input type="text" name="messageTitle" placeholder="제목 입력" />
				<input type="text" id="adminId" name="adminId" readonly ><br> 
					<input type="text" name="messageContent" placeholder="메세지 입력" />
				<div class="modal-footer">
					<input type="button" onclick="sendAjax()" class="btn btn-danger" value="보내기">
				</div>
			</form>
		</div>
	</div>
</div>



<script>


var messageSeq ;
function messageUpdate(seq){
messageSeq = seq;
	/* 1 안읽음, 0 읽음	 */

}
/* function modalContent(data){
	$("tbody").empty();
	$.each(data,function(idx,item)){
		html(idx.messageTitle).append($('<br>')).html(item.messageContent)
		
	}
} */

function sendAjax(){
	var title = $('#sendtitle').val();
	var content = $('#sendContent').val();
	var adminId = $('#adminId').val();
	$.ajax({
		url :'insertMasterMessage',
		method : 'post',
        data :  $("#sendModal").serialize(),
		dataType : 'json',
		success:function(data){
			alert("전송완료");
			$("#modalMessage .close").click();
			//$('#modalMessage').modal('hide');
		}
	})
	
	}
	//모달창 메세지 받기
	 $('#contentModal').on('show.bs.modal', function (e) {
		console.log(e.target); 
		$.ajax({
			url : 'getMasterMessage',  
			method:'post',
			data : {messageSeq:messageSeq},
			dataType :'json',
			success:function(data){
				if(data == null){
					alert("data=0");
					data=0;
				}else{
					$('#getMessageTitle').html(data.messageTitle);
					$('#getMessageContent').html(data.messageContent);
					$('#messageCount').load("getMasterMessageCount");
					$('#msg'+messageSeq).find('i').removeClass('fa-envelope').addClass('fa-envelope-open');
				}
			}
		})

	})  
	

    </script>