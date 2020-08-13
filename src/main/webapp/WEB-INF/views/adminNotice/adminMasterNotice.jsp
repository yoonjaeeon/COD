<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-lg-12">
		<h4>공지사항</h4>
		<table class="table">
			<tr>
				<th>제목</th>
				<th>작성일자</th>
			</tr>
			<c:forEach items="${list }" var="list">
				<tr id="tr" data-toggle="modal" data-target="#contentModal1s"
					onclick="seq(${list.masterNoticeSeq})">
					<td>${list.masterNoticeTitle }</td>
					<td>${list.masterNoticeDate }</td>
				</tr>
			</c:forEach>
		</table>
		<div align="center">
			<button type="button" class="btn btn-info"
				onclick="location.href='admin'">홈으로</button>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="contentModal1s" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">공지사항</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h2>
					<span id="getMessageTitle"></span>
				</h2>
				<br> <span id="getMessageContent"></span>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>
<script>
var $seq;
function seq(seq){
	$seq = seq;
}
$('#contentModal1s').on('show.bs.modal', function (e) {
	$.ajax({
		url:'masterNotice/'+$seq,
		method:'GET',
		/* url : 'getAdminMasterNotice',
		data: {masterNoticeSeq:$seq},
		method:'POST', */
		dataType :'json',
		success:function(result){
				$('#contentModal1s #getMessageTitle').html(result.masterNoticeTitle);
				$('#contentModal1s #getMessageContent').html(result.masterNoticeContent);
		}
	});
});
</script>

