<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

function button1(){
	if(confirm("수정 하시겠습니까?")){
		frm.submit();
	}else{
		return ;
	}
}
function button2(){
	location.href="adminReviewList";
}	
</script>
<br>
<div class="post">
<h3>리뷰 수정</h3>
<form name="frm" action="updateReview" method="post" enctype="multipart/form-data">
<div class="form-group">
<input type="hidden" name="reviewSeq" value="${review.reviewSeq }">
	    </div>
리뷰 내용:<br/>
<textarea class="form-control" cols="30" rows="10"
          name="reviewContent" id="reviewContent">${review.reviewContent}</textarea><br/>
평 점 : 
	<div class="starRev">
		<c:forEach var="index" begin="1" end="5" >
		<span class="starR <c:if test="${review.stars>=index}">on</c:if>">${index }</span>
		</c:forEach>
	  	<input type="hidden" name="stars" id="stars" value="${review.stars}">
	</div>
<div class="inputArea">
 <p>대표 사진</p>
 <img src="resources/upload/${review.gdsThumbImg}"style="width: 500px"/>
 <p>리뷰 사진</p>
 <c:forEach items="${fileList}" var="file">
   <img src="resources/upload/${file.photoName}"style="width: 500px"/>
 </c:forEach>

</div>
	<c:if test="${sessionScope.loginEmail == review.email}">
대표 사진<br>
	<div class="custom-file mb-3">
	      <input type="file" class="custom-file-input" id="upload" name="upload">
	      <label class="custom-file-label" for="customFile"> 파일을 선택해 주세요 </label>
    </div>
      <br><br>
        첨부 사진<br>
      <div class="custom-file mb-3">
	      <input type="file" class="custom-file-input" id="uploadFile" name="uploadFile">
	      <label class="custom-file-label" for="customFile"> 파일을 선택해 주세요 </label>
      </div>
 <br><br>
 <div align="center">
	<button type="button" onclick ="button1()">수정</button>
	<input type="reset" value="지우기" />
	<button type="button" onclick ="button2()">목록으로</button>
</div>
</c:if>
</form>
</div>

<script>
$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  $('input:hidden[name="stars"]').val($(this).text());
	  return false;
});
/* 띄우기, 엔터 적용 */
$(document).ready(function(){
	  $("#searchNotice").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#masterNoticeTbl tr").filter(function() {
	    	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});
});

var str = document.getElementById("textarea").value;

str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');

document.getElementById("textarea").value = str;
</script>
