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
<textarea cols="30" rows="10"
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
대표 사진 <br>
      <input type="file" id="gdsThumbImg" name="upload" value="${review.gdsThumbImg }"/>
 <br><br>
첨부 사진 <br>
      <input multiple="multiple" type="file" id="photoGroup" name="uploadFile" value="${review.photoGroup }"/>
 <br><br>
 <div align="center">
	<c:if test="${sessionScope.loginEmail == review.email}">
	<button type="button" onclick ="button1()">수정</button>
	<input type="reset" value="지우기" />
	</c:if>
	<c:if test="${sessionScope.loginEmail != review.email }">
	<button type="button" onclick ="button2()">목록으로</button>
	</c:if>
</div>
</form>
</div>

<script>
$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  $('input:hidden[name="stars"]').val($(this).text());
	  return false;
});
</script>
