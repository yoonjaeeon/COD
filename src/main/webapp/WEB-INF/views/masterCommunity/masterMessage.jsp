<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

var messageSeq ;
function messageUpdate(seq){
messageSeq = seq;
	/* 1 안읽음, 0 읽음	 */
}

	$(function() {
		$('#myModal').on('shown.bs.modal', function() {
			$('#myInput').trigger('focus')
		})

		$()
	});
	
	function send() {
		$(function() {
			$('#myModal').on('shown.bs.modal', function() {
				$('#myInput').trigger('focus')
			})

			$()
		})
	};
	
	

</script>

<table border="1" id="testBoardTable">
	<tr id='tr'>
		<!-- <th><input type="checkBox" id="chkAll"></th> -->
		<th>제목</th>
		<th>아이디</th>
		<th>답장</th>
		<!-- data-toggle="modal" data-target="#exampleModal" -->
	</tr>
	<c:forEach items="${messageList}" var="list">
		<tr data-toggle="modal" data-target="#contentModal" onclick="messageUpdate(${list.messageSeq })" id="msg${list.messageSeq }" class="tr">
			<!-- <td><input type="checkbox" name="check"></td> -->
			<td><span id="messageTitle"></span>${list.messageTitle }</td>
			<td><span id="messageAdminId"></span>${list.adminId }</td>
			<td align="center" class="readClass" id="messageRead"> <!-- 메세지 읽음표시  -->
			<a>답장</a>
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
			<form action="insertMessage">
				<input type="text" id="messageTitle" name="messageTitle"
					placeholder="제목 입력" /><br> <input type="text"
					id="messageContent" name="messageContent" placeholder="메세지 입력" />
				<div class="modal-footer">
					<input type="submit" class="btn btn-danger" value="보내기">
				</div>
			</form>
		</div>
	</div>
</div>



<script>



/* function modalContent(data){
	$("tbody").empty();
	$.each(data,function(idx,item)){
		html(idx.messageTitle).append($('<br>')).html(item.messageContent)
		
	}
} */
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
					$('#msg'+messageSeq).find('i').removeClass('fa-envelope').addClass('fa-envelope-open');
					$('#messageCount').load("getMasterMessageCount");
				}
			}
		})

	})  
	
	
    </script>