<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>

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
</script>

	<button onclick="send()" data-toggle="modal" data-target="#modalMessage">메세지 작성</button>
	
	
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>메세지 제목</th>
			<th>읽음</th>
			<!-- data-toggle="modal" data-target="#exampleModal" -->
		</tr>
		 <c:forEach items="${messageList}" var="list">   
		<form action="">
		<tr  data-toggle="modal" data-target="#contentModal">
			<td>${list.messageSeq }</td>
			<td>${list.messageTitle }</td>
			<td align="center">
			<c:if test="${list.read == 1 }">
			<i class="far fa-envelope"></i> 
			</c:if>
			<c:if test="${list.read == 0 }">
			<i class='far fa-envelope-open'></i>
			</c:if>
			
			</td>
		</tr>
		 </form> 
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
				${getMessageContent}
				</div>				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">확인</button>
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
				<input type="text" id="messageTitle" name="messageTitle" placeholder="제목 입력" /><br>
				<input type="text" id="messageContent" name="messageContent" placeholder="메세지 입력" />
				<div class="modal-footer">
				<input type="submit" class="btn btn-danger" value="보내기">
				</div>
				</form>
			</div>
		</div>
	</div>