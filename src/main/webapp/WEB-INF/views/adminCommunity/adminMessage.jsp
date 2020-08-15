<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<style>
ul {
    list-style:none;
    margin:0 auto;
    padding:0;
}

li {
    margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
}
</style>

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
 function sendMessage(seq){
	 var data = {}
		if(seq != "undefined" && seq != null && seq!= "" ){
			data = {messageSeq:seq}
		}else{
			$("#tbody").empty();
		}$.ajax({
			url : 'sendMessage', 
			type : 'post',
			dataType : 'json',
			data : data,
			async : true,
			success : function(data){
				 if(typeof data.length == 0 || data == ""){
			    	 alert("메세지가 없습니다.");		 
	       }else{
				$('#date').text('발신일자')
				$('#th').text('수신');
				$("#tbody tr:gt(0)").empty();
					  $.each(data, function (index, item) {
		                    let html = '';
		                    html += '<tr data-toggle="modal" data-target="#contentModal3" onclick="messageUpdate('+item.messageSeq+')" id="msg'+item.messageSeq+'" class="tr" data-seq='+item.messageSeq+'>';
		                    html += '<td>'+item.messageTitle+'</td>';	 
		                    html += '<td>'+item.messageDate+'</td>';    
		                    if(item.masterRead === 1){
		                    	html += '<td>'+'<i class="far fa-envelope"></i>'+'</td>';
		                        }else{
		                        	html +='<td>'+'<i class="far fa-envelope-open"></i>'+'</td>';
		                        }
		                    html += '</tr>';
		                    $("#tbody").append(html);
		                    
		                });
					
				$('#messageTitle').html(data.messageTitle);
				}
			}
		})
} //end of sendMessage 

var messageSeq ;
function messageUpdate(seq){
messageSeq = seq;
	/* 1 안읽음, 0 읽음	 */
}

//받은 메세지함
 function receiveMessage(seq){
	var data = {}
	if(seq != "undefined" && seq != null && seq!= "" ){
		data = {messageSeq:seq}
	}else{
		$("#tbody").empty();
	}
	$.ajax({
		url : 'receiveMessage',
		type : 'POST',
		data : data,	
		dataType : 'json',
		async : true,
		success : function(data){
           if(typeof data.length == 0 || data == ""){
			    	 alert("메세지가 없습니다.");
           }else{
				$('#th').text('읽음');
				$('#date').text('수신일자')
			//	$("#tbody tr:gt(0)").empty();
			$.each(data, function (index, item) {
                let html = '';
                html += '<tr data-toggle="modal" data-target="#contentModal3" onclick="messageUpdate('+item.messageSeq+')" id="msg'+item.messageSeq+'" class="tr" data-seq='+item.messageSeq+'>';
                html += '<td>'+item.messageTitle+'</td>';    
                html += '<td>'+item.messageDate+'</td>';    
			    	  
			    if(item.read === 1){
            	html += '<td id="msgss'+item.messageSeq+'">'+'<i class="far fa-envelope"></i>'+'</td>';
                }else{
                	html +='<td id="msgss'+item.messageSeq+'">'+'<i class="far fa-envelope-open"></i>'+'</td>';
                }
                html += '</tr>';
                $("#tbody").append(html);
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
	<tbody id="tbody">


	</tbody>
	
</table>
<button id="more" class="btn btn_review">더 보기</button>
</div>
<!-- 페이징 처리하기 -->
<script type="text/javascript">
	function gopage(p) {
		location.href="adminMessage?p="+p;
		//document.searchfrm.p.value = p; 검색
 		//document.searchfrm.submit();
	}
</script>

<form action="" id="modal" method="post"></form>
<!-- Modal -->
<div class="modal fade" id="contentModal3" tabindex="-1" role="dialog"
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
				<textarea class="form-control"	id="messageContent" name="messageContent" placeholder="메세지 입력"></textarea>
				<div class="modal-footer">
					<input type="submit" class="btn btn-danger" value="보내기">
				</div>
			</form>
		</div>
	</div>
</div>



<script>

$('#more').on("click", function(p){//페이징 처리 more버튼 누르면  값을 받아옴
	 var seq = $('#tbody tr').last().data('seq');
	 receiveMessage(seq);
	 /* $.ajax({
		 url:"adminMessage",
		 data :{messageSeq : seq}
	 }) */
	})

var messageSeq ;
function messageUpdate(seq){ 
	messageSeq = seq;
}

//모달창 메세지 받기
$('#contentModal3').on('show.bs.modal', function() {
	$.ajax({
		url : 'getMessage',  
		method:'post',
		data : {messageSeq:messageSeq},
		dataType :'json',
		success:function(data){
				$('#contentModal3 #getMessageTitle').html(data.messageTitle);
				$('#contentModal3 #getMessageContent').html(data.messageContent);
				$('#msgss'+messageSeq).find('i').removeClass('fa-envelope').addClass('fa-envelope-open');
				$('#messageCount').load("getMessageCount");
		}
	});
});
receiveMessage();


</script>