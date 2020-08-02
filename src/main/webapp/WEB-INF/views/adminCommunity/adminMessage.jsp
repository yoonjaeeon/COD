<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
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
	
var messageSeq ;
function messageUpdate(seq){
messageSeq = seq;
	/* 1 안읽음, 0 읽음	 */
}

//보낸 메세지함 
 function sendMessage(){
	$.ajax({
		url : 'sendMessage', 
		type : 'post',
		contentType: 'application/json;charset=utf-8',
		dataType : 'json',
		async : true,
		success : function(data){
			 if(typeof data.length == 0 || data == ""){
		    	 alert("보낸 메세지가 없습니다.");		 
				 $('#testBoardTable tr:gt(0)').empty();
       }else{
			$('#date').text('발신일자')
			$('#th').text('수신');
			$("#testBoardTable tr:gt(0)").empty();
				  $.each(data, function (index, item) {
	                    let html = '';
	                    html += '<tr data-toggle="modal" data-target="#contentModal" onclick="messageUpdate('+item.messageSeq+')" id="msg'+item.messageSeq+'" class="tr">';
	                    html += '<td>'+item.messageTitle+'</td>';	 
	                    html += '<td>'+item.messageDate+'</td>';    
	                    if(item.masterRead === 1){
	                    	html += '<td>'+'<i class="far fa-envelope"></i>'+'</td>';
	                        }else{
	                        	html +='<td>'+'<i class="far fa-envelope-open"></i>'+'</td>';
	                        }
	                    html += '</tr>';
	                    $("#testBoardTable").append(html);
	                });
				
			$('#messageTitle').html(data.messageTitle);
			}
		}
	})
} //end of sendMessage 

//받은 메세지함
 function receiveMessage(){
	$.ajax({
		url : 'receiveMessage',
		type : 'POST',
		contentType: 'application/json;charset=utf-8',
		dataType : 'json',
		async : true,
		success : function(data){
           if(typeof data.length == 0 || data == ""){
			    	 alert("받은 메세지가 없습니다.");		 
					 $('#testBoardTable tr:gt(0)').empty();
           }else{
				$('#th').text('읽음');
				$('#date').text('수신일자')
				$("#testBoardTable tr:gt(0)").empty();
			$.each(data, function (index, item) {
                let html = '';
                html += '<tr data-toggle="modal" data-target="#contentModal" onclick="messageUpdate('+item.messageSeq+')" id="msg'+item.messageSeq+'" class="tr">';
                html += '<td>'+item.messageTitle+'</td>';    
                html += '<td>'+item.messageDate+'</td>';    
			    	  
			    if(item.read === 1){
            	html += '<td>'+'<i class="far fa-envelope"></i>'+'</td>';
                }else{
                	html +='<td>'+'<i class="far fa-envelope-open"></i>'+'</td>';
                }
                html += '</tr>';
                $("#testBoardTable").append(html);
            });
           }
		}
		
				
	})
} 
</script>
<div class="container" align="center">
	<div class="padding2 margin3">
	<button class="btn btn-outline-info" onclick="receiveMessage()">받은 메세지</button>
	<button class="btn btn-outline-info" onclick="sendMessage()">보낸 메세지</button>
	<button class="btn btn-outline-info" onclick="send()" data-toggle="modal" data-target="#modalMessage">메세지 작성</button>
	</div>
<table class="table table-hover" id="testBoardTable">
	<tr id='tr'>
		<!-- <th><input type="checkBox" id="chkAll"></th> -->
		<th>메세지 제목</th>
		<th id="date">수신 날짜</th>
		<th id="th">읽음</th>
		<!-- data-toggle="modal" data-target="#exampleModal" -->
	</tr>
	<c:forEach items="${messageList}" var="list">
	<tbody id="tbody">
		<tr data-toggle="modal" data-target="#contentModal" onclick="messageUpdate(${list.messageSeq })" id="msg${list.messageSeq }" class="tr">
			<!-- <td><input type="checkbox" name="check"></td> -->
			<td><span id="messageTitle"></span>${list.messageTitle }</td>
			<td><span id="messageDate"></span>${list.messageDate}</td>
			<td align="center" class="readClass" id="messageRead"> <!-- 메세지 읽음표시  -->
			<span id="messageUpdate"> 
			
			<c:if test="${list.read == 1 }">
				<i class="far fa-envelope"></i>
			</c:if> 
			<c:if test="${list.read == 0 }">
				<i class='far fa-envelope-open'></i>
			</c:if>
			</span>			
			</td>
		</tr>
	</tbody>
	</c:forEach>
</table>

</div>
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
		<div class="modal-content" align="center">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">메세지 보내기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="insertMessage" class="margin2">
				<input type="text" class="form-control" id="messageTitle" name="messageTitle" placeholder="제목 입력" /><br>
				<input type="text" class="form-control"	id="messageContent" name="messageContent" placeholder="메세지 입력" />
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
			url : 'getMessage',  
			method:'post',
			data : {messageSeq:messageSeq},
			dataType :'json',
			success:function(data){
				/* if(data.Data.response.length == 0 ){
			    	  alert("받은 메세지가 없습니다.");
			    	  return false;
				}else{ */
					$('#getMessageTitle').html(data.messageTitle);
					$('#getMessageContent').html(data.messageContent);
					$('#msg'+messageSeq).find('i').removeClass('fa-envelope').addClass('fa-envelope-open');
					$('#messageCount').load("getMessageCount");
					
				/* } */
			}
		})

	})  
	
	
    </script>