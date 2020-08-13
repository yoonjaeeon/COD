<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- review -->
<c:forEach items="${cafeReviewList }" var="review">
	<div class="col-lg-6 col-md-12 col-sm-12">
		<div class="container row more">
			<div class="col-lg-6 col-md-12 col-sm-12" align="center">
				<div class="image fit">
				<img src="resources/upload/${review.gdsThumbImg}" style="width: 100%; height: 200px" />
				</div>
			</div>
			<div class="col-lg-6 col-md-12 col-sm-12" align="center">
			<div style="height: 180px; overflow: scroll;" >
			<h6 class="published reviewtitle" data-reviewseq="${review.reviewSeq }"> ${review.reviewContent}</h6>
			</div>
			<h6 class="published">
			<fmt:parseDate value="${review.reviewTime }" pattern="yyyy-MM-dd HH:mm:ss" var="rt" />
			<fmt:formatDate value="${rt}" pattern="yyyy-MM-dd" /></h6>
			<h6 class="published"><i class='fas fa-star'></i>${review.stars}</h6>
			</div>
		</div>
	</div>
</c:forEach>

<script>
$(document).ready(function(){
    $('.more').click(function(){ 
    	reviewSeq = $(this).find(".reviewtitle").attr("data-reviewseq");
    	window.open('reviewDetail/'+reviewSeq, '리뷰상세페이지',
        'width=900, height=600, left=150, top=100, location=no, status=no, scrollbars=yes');
    }); 
});
</script>