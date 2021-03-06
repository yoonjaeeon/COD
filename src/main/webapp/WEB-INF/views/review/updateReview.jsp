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
<h4>리뷰 내용</h4>
<textarea class="form-control" cols="30" rows="10"
          name="reviewContent" id="reviewContent">${review.reviewContent}</textarea><br/>
<h4>평 점</h4>
	<div class="starRev">
		<c:forEach var="index" begin="1" end="5" >
		<span class="starR <c:if test="${review.stars>=index}">on</c:if>">${index }</span>
		</c:forEach>
	  	<input type="hidden" name="stars" id="stars" value="${review.stars}">
	</div>
<div class="inputArea">
 <h4>대표사진</h4>
 <img src="resources/upload/${review.gdsThumbImg}"style="width: 500px"/>
 <h4>리뷰 사진</h4>
 <div class="row">
 <c:forEach items="${fileList}" var="file">
   <div class="col-4">
   <img src="resources/upload/${file.photoName}"style="width: 100%; max-height: 200px; overflow: hidden"/>
   </div>
 </c:forEach>
 </div>

</div>
	<c:if test="${sessionScope.loginEmail == review.email}">
	<div class="row">
    	<div class="col-6">    
		    <h4>대표 사진</h4>
			<div class="custom-file mb-3">
			      <input type="file" class="custom-file-input" id="upload" name="upload" >
			      <label class="custom-file-label" for="customFile"> 파일을 선택해 주세요 </label>
		    </div>
	    </div>
      <br><br>
      <div class="col-6">
		      <h4>첨부 사진</h4>
		      <div class="custom-file mb-3">
			      <input multiple="multiple" class="custom-file-input" type="file" id="uploadFile" name="uploadFile">
		      	  <label class="custom-file-label" for="customFile"> 파일을 선택해 주세요 </label>
		      </div>
      </div>
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
$(".custom-file-input").on("change", function() {
	  var fileName = $(this).val().split("\\").pop();
	  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
var str = document.getElementById("textarea").value;
str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
document.getElementById("textarea").value = str;
</script>
