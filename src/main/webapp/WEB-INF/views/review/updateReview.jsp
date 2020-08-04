<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<h3>리뷰 수정</h3>
<form name="frm" action="updateReview" method="post" enctype="multipart/form-data">
<input type="hidden" name="reviewSeq" value="${review.reviewSeq }">
작성자: ${loginEmail} <br>
카페 이름: ${review.cafeName } <br>
<div class="form-group">
		<input type="hidden" class="form-control"
		name="adminId" id="adminId" value="${review.adminId}" readonly>
	    </div>
리뷰 내용:<br/>
<textarea cols="30" rows="10"
          name="reviewContent" id="reviewContent">${review.reviewContent}</textarea><br/>
평 점 : <input type="text" name="stars" id="stars" value="${review.stars}"/><br/>
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
<button type="submit">수정</button>
<input type="reset" value="지우기" />
</form>
