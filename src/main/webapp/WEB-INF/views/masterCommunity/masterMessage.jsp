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
	

	
	function receiveMessage(seq){
		$('.btn-warning').removeClass('btn-warning');
		$('.btn-outline-info').eq(0).addClass('btn-warning');
		
		var data = {}
		if(seq != "undefined" && seq != null && seq!= "" ){
			data = {messageSeq:seq}
		}else{
			$("#tbody").empty();
		}
		$.ajax({
			url : 'receiveMasterMessage',
			type : 'POST',
			data : data,
			dataType : 'json',
			async : true,
			success : function(data){
	           if(typeof data.length == 0 || data == ""){
				    	 alert(" 메세지가 없습니다.");
	           }else{
				/* 	$('#th').text('읽음'); */
					$('#date').text('수신일자');
					$('#dap').text('답장');
					$('#th').text('읽음');
				$.each(data, function (index, item) {
	                let html = '';
	               
                                   
	                html += '<tr class="tr" id="tr'+item.messageSeq+'" data-seq='+item.messageSeq+'>';
	                html += '<td data-toggle="modal" data-target="#contentModal" onclick="messageUpdate('+item.messageSeq+')" id="msg'+item.messageSeq+'" >'+item.messageTitle+'</td>';    
	                html += '<td data-toggle="modal" data-target="#contentModal" onclick="messageUpdate('+item.messageSeq+')" id="msg'+item.messageSeq+'" >'+item.adminId+'</td>'; 
                    html += '<td id="msg'+item.messageSeq+'" ><button data-toggle="modal" data-target="#modalMessage" data-adminId='+item.adminId+' onclick="sendMasterMessages(\''+item.adminId+ "\'," +item.messageSeq+')">답장</button></td>';
                                      
				    if(item.masterRead === 1){
	            	html += '<td align="center" id="msgs'+item.messageSeq+'">'+'<i class="far fa-envelope"></i>'+'</td>';
	                }else{
                	html +='<td align="center" id="msgs'+item.messageSeq+'">'+'<i class="far fa-envelope-open"></i>'+'</td>';
	                }
	                html += '</tr>';
	                $("#tbody").append(html);
	            });
	           }
			}
			
					
		})
	} 
	
	/* 답장기능 */
	 function sendMessage(seq){
			$('.btn-warning').removeClass('btn-warning');
			$('.btn-outline-info').eq(1).addClass('btn-warning');
		 var data = {}
			if(seq != "undefined" && seq != null && seq!= "" ){
				data = {messageSeq:seq}
			}else{
				$("#tbody").empty();
			}
			$.ajax({
				url : 'sendMasterMessage', 
				type : 'post',
				data : data,	
				dataType : 'json',
				async : true,
				success : function(data){
					 if(typeof data.length == 0 || data == ""){
				    	 alert("보낸 메세지가 없습니다.");	
		       }else{
					$('#date').text('발신일자');
					$('#th').text('발송완료');
					$('#dap').text('보낸날짜');
					
						  $.each(data, function (index, item) {
			                    let html = '';
			                    html += '<tr data-toggle="modal" data-target="#contentModal" onclick="messageUpdate('+item.messageSeq+')" id="msg'+item.messageSeq+'" class="tr" data-seq='+item.messageSeq+'>';
			                    html += '<td>'+item.messageTitle+'</td>';	 
			                    html += '<td>'+item.adminId+'</td>';
			                    html += '<td>'+item.messageDate+'</td>';	
		                    	html += '<td align="center">O</td>';
			                    html += '</tr>';
			                    $("#tbody").append(html);
			                });
					$('#messageCount').load("getMessageCount");
					$('#messageTitle').html(data.messageTitle);
					}
				}
			})
		}

</script>
<div class="container" align="center">
<button class="btn btn-outline-info" onclick="receiveMessage()" id="receive">받은 메세지</button>
<button class="btn btn-outline-info" onclick="sendMessage()" id="send">보낸 메세지</button>
<!-- <button class="btn btn-outline-info" onclick="send">메세지 보내기</button> --><br><br>
<table  id="testBoardTable" class="table table-hover">
	<tr id='tr'>
		<!-- <th><input type="checkBox" id="chkAll"></th> -->
		<th>제목</th>
		<th>아이디</th>
		<th id="dap">답장</th>
		<th id="th">읽음</th>
		<!-- data-toggle="modal" data-target="#exampleModal" -->
	</tr>
	<tbody id="tbody">
	</tbody>
</table>
<button id="more" class="btn_review">더 보기</button>
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





<script>
function sendMasterMessages(adminId,seq) {	
	$('#modalMessage').modal('show');		
	$('#myInput').trigger('focus');
	$('#adminId').val(adminId);		
	$('#sendMessageSeq').val(seq);
};

$('#more').on("click", function(p){
	 var seq = $('#tbody tr').last().data('seq');
	 if($('.btn-warning').attr('id')== 'receive' ){
		 receiveMessage(seq);	 
	 }else{
		 sendMessage(seq);
	 }
	 
	 
	})

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
					$('#msgs'+messageSeq).find('i').removeClass('fa-envelope').addClass('fa-envelope-open');
				}
			}
		})

	})  
receiveMessage();
</script>

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