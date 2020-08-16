<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="padding2" align="center">
	<h3>${search } 에 대한 검색결과</h3>
	<hr>
	<div class="main_slicks">
		<c:if test="${empty sCafe}">
		<div>
			<h4>검색 결과가 없습니다</h4>
		</div>
		</c:if>
		<c:forEach items="${sCafe }" var="list">
			<div>
				<article class="mini-post">
					<header class="row">
						<div class="col-sm-10">
							<h3>
								<a href="cafe?adminId=${list.adminId}">${list.cafeName }</a>
							</h3>
							<h4>${list.cafeHashtag }</h4>
						</div>
						 <div class="col-sm-2">
							<div class="heart" data-class="${list.bookmarks}">
							<c:if test="${!empty sessionScope.loginEmail}">
								<c:if test="${!empty list.bookmarks}">
									<i class="far fa-heart" data-placement="top" title="즐겨찾기 "
										data-toggle="tooltip" style="color: red" data-id='${list.adminId}'
										id="bookmarkDelete${list.bookmarkSeq}"></i>
								</c:if>
								<c:if test="${empty list.bookmarks}">
									<i class="far fa-heart" data-placement="top" title="즐겨찾기 "
										data-toggle="tooltip" data-id='${list.adminId}'></i>
								</c:if>
								</c:if>
							</div>
							
								<c:if test="${empty sessionScope.loginEmail}">
									<i class="far fa-heart" data-placement="top" title="로그인이 필요한 기능 "
										data-toggle="tooltip" ></i>
								</c:if>
							<h4>${list.stars }</h4> 
						</div> 
					</header>
					<a href="cafe?adminId=${list.adminId}" class="image"> <img
						class="slick" src="resources/upload/${list.cafeThumbnail}" alt="">
					</a>
				</article>
			</div>
		</c:forEach>
	</div>
</div>
<script>
$('[data-toggle="tooltip"]').tooltip()
$('.heart').on('click', function(){
	var i = $(this).find('i')
	console.log($(this).data('class')) 
	if(i.css('color')=='rgb(255, 0, 0)'){
		if(!confirm("정말 즐겨찾기목록에서 삭제하시겠습니까?")){
			return
		}else
		/* 클린한 곳에서 id를 찾아서 8번째 문자를 반환시켜줌 */
		var seq = $(this).find('i').attr('id').substr(14);
		$.ajax({
			url :'deleteBookmark?', 
			data : {bookmarkSeq:seq},
			method : 'post',
			dataType :'json' ,
			success:function(){
				$("#bookmarkDelete"+seq).css('color','black');
				$(this).find('i').attr("id","bookmarkInsert")
				i.toggleClass('red');
				//.attr.idadd('id', 'id="bookmarkDelete${theme.bookmarkSeq} ')
				//$("#bookmark"+seq).closest('article').remove() /* closest 조상중에서 찾음 */
			} 
		})
	}else{
		if(!confirm("즐겨찾기목록에 등록하시겠습니까?")){
			return
		}
		var result = $(this).find('i');
		
		var id = $(this).find('i').data('id')
		$.ajax({
			url :'insertBookmark', 
			data : {adminId:id },
			method : 'post',
			dataType :'json' ,
			success:function(data){
				result.attr('style', 'color:red')
				.attr('id', 'bookmarkDelete'+data.bookmarkSeq)    				
			} 
		})
	}	  
})
</script>