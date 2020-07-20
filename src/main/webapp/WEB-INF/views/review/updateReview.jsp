<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<h3>리뷰 수정</h3>
<form name="frm" action="updateReview">
리뷰 내용:<br/>
<textarea cols="30" rows="10"
          name="reviewContent" id="reviewContent">${review.reviewContent}</textarea><br/>
평 점 : <input type="text" name="stars" id="stars" value="${review.stars}"/><br/>
<button type="submit">수정</button>
<input type="reset" value="지우기" />
</form>
</body>
</html>