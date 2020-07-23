<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center">
	<h1>즐겨찾는 카페 리스트</h1>
</div>

<div id="listpage">
	<section class="posts">
		<c:forEach items="${getBookmarks}" var="bookmark">
			<%-- <article>
				<a href="#" class="image fit"><img src="resources/upload/main1.jpg" alt=""></a>
				<header>
					<h2>${bookmark.adminId }</h2>
					<h4>${bookmark.cafeThumbnail }</h4>
				</header>
				<i class='far fa-heart' style='font-size: 24px;'></i>
				<h2>4.3</h2>
			</article> --%>
			
				<article class="mini-post">
				<header class="row">
					<div class="col-sm-10">
						<h3>
							<a href="cafe?adminId=${bookmark.adminId }">${bookmark.cafeName }</a>
						</h3>
						<h4>#해쉬태그</h4>
					</div>
					<div class="col-sm-2">
					
					<!-- 좋아요 -->					
						<%-- <c:if test="${not empty bookmark.email}"> --%>
						<!-- onMouseOver="this.innerHTML='즐겨찾기 해제'"
								onMouseOut="this.innerHTML='ABOUT STYLE'" -->
								
							<i class="far fa-heart" style="color: red" id="bookmark${bookmark.bookmarkSeq}"></i>
						<%-- </c:if>
						<c:if test="${empty bookmark.email}">
							<i class="far fa-heart" id="insertBookmark"></i>
						</c:if> --%>
						<!-- 좋아요 끝-->		
										
						
						
						<!-- 별점 -->
						<c:if test="${!empty bookmark.stars }">
						<h4>${bookmark.stars }</h4>
						</c:if>											
						<c:if test="${empty bookmark.stars }"> 
						<h4>0.0</h4>
						</c:if>
						
					</div>
				</header>
				<a href="cafe?adminId=${bookmark.adminId }" class="image"><img
					src="resources/upload/${bookmark.cafeThumbnail }" alt=""></a>
			</article>
		</c:forEach>
	</section>
</div>

<script>
						$(function(){ /* bookmark로 시작하는 id에 접근 */
							$('[id^="bookmark"]').on('click', function(){
								if(!confirm("정말 즐겨찾기목록에서 삭제하시겠습니까?")){
									return
								}
								/* 클린한 곳에서 id를 찾아서 8번째 문자를 반환시켜줌 */
								var seq = $(this).attr('id').substr(8);
								$.ajax({
									url :'deleteBookmark?', 
									data : {bookmarkSeq:seq},
									method : 'post',
									dataType :'json' ,
									success:function(data){
										$("#bookmark"+seq).closest('article').remove() /* closest 조상중에서 찾음 */
									} 
								})
							})
						})
						
						$}
						
						/* $(function(){
							$('#insertBookmark').on('click', function(){
								$.ajax({
									url : insertBookmark,
									method : 'post',
									data :{email:sessionScope.loginEmail},
									dataType : 'json',
									success:function(data){
										if(data == null){
											$('#insertBookmark').attr('style','red');
										}
									}
										
								});
							});
						});
						
						$(function(){
							$('#bookmark').on('click', function(){
								$.ajax({
									url : deleteBookmark,
									method : 'post',
									data : {email:sessionScope.loginEmail},
									dataType : 'json',
									success:function(data){
										if(data != null){
											$('#Bookmark').attr('style','black');
										}if(data == null){
											$('#Bookmark').attr('style','red');
										}
									}
								});
							});
						}); */
						</script>