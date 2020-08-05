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
	
	function sendMasterMessage(adminId,seq) {	
		$('#myModal').modal('show');		
		$('#myInput').trigger('focus');
		$('#adminId').val(adminId);		
		$('#sendMessageSeq').val(seq);
	};
	
	function receiveMessage(){
		$.ajax({
			url : 'receiveMasterMessage',
			type : 'POST',
			contentType: 'application/json;charset=utf-8',
			dataType : 'json',
			async : true,
			success : function(data){
	           if(typeof data.length == 0 || data == ""){
				    	 alert("받은 메세지가 없습니다.");		 
						 $('#testBoardTable tr:gt(0)').empty();
	           }else{
				/* 	$('#th').text('읽음'); */
					$('#date').text('수신일자');
					$('#dap').text('답장');
					$('#th').text('읽음');
					$("#testBoardTable tr:gt(0)").empty();
				$.each(data, function (index, item) {
	                let html = '';
	               
                                   
	                html += '<tr class="tr" id="tr'+item.messageSeq+'">';
	                html += '<td data-toggle="modal" data-target="#contentModal" onclick="messageUpdate('+item.messageSeq+')" id="msg'+item.messageSeq+'" >'+item.messageTitle+'</td>';    
	                html += '<td data-toggle="modal" data-target="#contentModal" onclick="messageUpdate('+item.messageSeq+')" id="msg'+item.messageSeq+'" >'+item.adminId+'</td>'; 
                    html += '<td id="msg'+item.messageSeq+'" ><button data-toggle="modal" data-target="#modalMessage" onclick="sendMasterMessage('+item.adminId+','+item.messageSeq+')">답장</button></td>';
                                      
				    if(item.read === 1){
	            	html += '<td align="center" id="msg'+item.messageSeq+'">'+'<i class="far fa-envelope"></i>'+'</td>';
	                }else{
                	html +='<td align="center" id="msg'+item.messageSeq+'">'+'<i class="far fa-envelope-open"></i>'+'</td>';
	                }
	                html += '</tr>';
	                $("#testBoardTable").append(html);
	            });
	           }
			}
			
					
		})
	} 
	
	/* 답장기능 */
	 function sendMessage(){
			$.ajax({
				url : 'sendMasterMessage', 
				type : 'post',
				contentType: 'application/json;charset=utf-8',
				dataType : 'json',
				async : true,
				success : function(data){
					 if(typeof data.length == 0 || data == ""){
				    	 alert("보낸 메세지가 없습니다.");		 
						 $('#testBoardTable tr:gt(0)').empty();
		       }else{
					$('#date').text('발신일자');
					$('#th').text('발송완료');
					$('#dap').text('보낸날짜')
					$("#testBoardTable tr:gt(0)").empty();
						  $.each(data, function (index, item) {
			                    let html = '';
			                    html += '<tr data-toggle="modal" data-target="#contentModal" onclick="messageUpdate('+item.messageSeq+')" id="msg'+item.messageSeq+'" class="tr">';
			                    html += '<td>'+item.messageTitle+'</td>';	 
			                    html += '<td>'+item.adminId+'</td>';
			                    html += '<td>'+item.messageDate+'</td>';	
		                    	html += '<td align="center">O</td>';
			                    html += '</tr>';
			                    $("#testBoardTable").append(html);
			                });
					$('#messageCount').load("getMessageCount");
					$('#messageTitle').html(data.messageTitle);
					}
				}
			})
		}

</script>
<div class="container" align="center">
<button class="btn btn-outline-info" onclick="receiveMessage()">받은 메세지</button>
<button class="btn btn-outline-info" onclick="sendMessage()">보낸 메세지</button>
<button class="btn btn-outline-info" onclick="send">메세지 보내기</button><br><br>
<table  id="testBoardTable" class="table table-hover">
	<tr id='tr'>
		<!-- <th><input type="checkBox" id="chkAll"></th> -->
		<th>제목</th>
		<th>아이디</th>
		<th id="dap">답장</th>
		<th id="th">읽음</th>
		<!-- data-toggle="modal" data-target="#exampleModal" -->
	</tr>
	<c:forEach items="${messageList}" var="list">
		<tr id="tr${list.messageSeq }">
			<!-- <td><input type="checkbox" name="check"></td> -->
			<td data-toggle="modal" data-target="#contentModal" onclick="messageUpdate(${list.messageSeq })"><span id="messageTitle"></span>${list.messageTitle }</td>
			<td data-toggle="modal" data-target="#contentModal" onclick="messageUpdate(${list.messageSeq })"><span id="messageAdminId"></span>${list.adminId }</td>
			<td><button data-toggle="modal" data-target="#modalMessage" onclick="sendMasterMessage('${list.adminId }',${list.messageSeq })">답장</button></td>
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
</div>

<!-- 페이징 처리하기 -->
<form action="" id="modal" method="post"></form>

<!-- Modal -->
<div class="modal fade" id="contentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
				<input type="hidden" id="sendMessageSeq">
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
	var messageSeqs = $('#sendMessageSeq').val();
	$.ajax({
		url :'insertMasterMessage',
		method : 'post',
        data :  $("#sendModal").serialize(),
		dataType : 'json',
		success:function(data){
			alert("전송완료");
			$("#modalMessage .close").click();
			$.ajax({
				url:'getMasterSend',
				method :'post',
				data : {messageSeq:messageSeqs},
				dataType :'text',
				success:function(result){
					var seq = $('#sendMessageSeq').val();
					$('#tr'+messageSeqs).remove();
				}
			})
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