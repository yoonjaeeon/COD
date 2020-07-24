<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.fa-heart {cursor:pointer;}
.red{color:red}

</style>


<!-- 테마 아이콘  -->
<div class="main_feature text-center">
	<div class="icon_slick">
		<div class="single_feature">
			<div class="single_feature_icon" >
				<i class="far fa-thumbs-up"></i>
			</div>
			<h4>추천 카페</h4>
		</div>
		<div class="single_feature" onclick="location.href='themeList?cafeTheme=t1'">
			<div class="single_feature_icon">
				<i class="fab fa-fort-awesome"></i>
			</div>
			<h4>이색 카페</h4>
		</div>
		<div class="single_feature" onclick="location.href='themeList?cafeTheme=t2'">
			<div class="single_feature_icon">
				<i class="fas fa-birthday-cake"></i>
			</div>
			<h4>디저트 맛집</h4>
		</div>
		<div class="single_feature" onclick="location.href='themeList?cafeTheme=t3'">
			<div class="single_feature_icon">
				<i class="fab fa-envira"></i>
			</div>
			<h4>야외석 있는</h4>
		</div>
		<div class="single_feature" onclick="location.href='themeList?cafeTheme=t4'">
			<div class="single_feature_icon">
				<i class="fas fa-laptop"></i>
			</div>
			<h4>작업하기 좋은</h4>
		</div>
		<div class="single_feature" onclick="location.href='themeList?cafeTheme=t5'">
			<div class="single_feature_icon">
				<i class="fas fa-coffee"></i>
			</div>
			<h4>핸드 드립</h4>
		</div>
	</div>
</div>
<div id="listpage">
	<section class="posts">
		<c:forEach items="${getTheme }" var="theme">
<%-- 		<article class="mini-post" id="ThemaListView">	
			<header class="row">
						<div class="col-sm-10">
							<h3>
								<a href="single.html">${theme.cafeName }
								<img src="resources/images/'${theme.cafeThumbnail }'" alt="">
								</a>
							</h3>							
							<h4>#해쉬태그</h4>
						</div>
						<div class="col-sm-2">
						<c:if test="${not empty theme.bookmarks}">
							<i class="far fa-heart" style="color:red"></i>
						</c:if>
						<c:if test="${empty theme.bookmarks}">
							<i class="far fa-heart"></i>
						</c:if>
							<h4>${theme.stars }</h4>
						</div>
					</header>
		</article> --%>

			<article class="mini-post">
				<header class="row">
					<div class="col-sm-10">
						<h3>
							<a href="cafe?adminId=${theme.adminId }">${theme.cafeName }</a>
						</h3>
						<h4>#해쉬태그</h4>
					</div>
					<div class="col-sm-2">
					<div class="heart" data-class="${theme.bookmarks}">
						<c:if test="${not empty theme.bookmarks}">
							<i class="far fa-heart" style="color: red" data-placement="top" title="즐겨찾기  취소"	data-toggle="tooltip"						
							id="bookmarkDelete${theme.bookmarkSeq}" 
							></i><%-- id='bookmark${theme.bookmarkSeq }' --%>
						</c:if>
						<c:if test="${empty theme.bookmarks}">
							<i class="far fa-heart" data-id='${theme.adminId}' style="color:black" data-placement="top" title="즐겨찾기  등록"	
							data-toggle="tooltip" id="bookmarkInsert"></i>
						</c:if> 
						</div>
						<h4>${theme.stars }</h4>
					</div>
				</header>
				<a href="cafe?adminId=${theme.adminId }" class="image"><img
					src="resources/upload/${theme.cafeThumbnail }" alt=""></a>
			</article>
		</c:forEach>
	</section>
</div>
<script>
$(function(){ /* bookmark로 시작하는 id에 접근 */
	
	//tooltip 지정
    $('[data-toggle="tooltip"]').tooltip()
    
    
    //bookmark 삭제
/* 	$('[id^="bookmarkDelete"]').on('click', function(){
		if(!confirm("정말 즐겨찾기목록에서 삭제하시겠습니까?")){
			return
		}
		// 클린한 곳에서 id를 찾아서 8번째 문자를 반환시켜줌 
		var seq = $(this).attr('id').substr(14);
		$.ajax({
			url :'deleteBookmark?', 
			data : {bookmarkSeq:seq},
			method : 'post',
			dataType :'json' ,
			success:function(data){
				$("#bookmark"+seq).closest('article').remove()  //closest 조상중에서 찾음 
			} 
		})
	}) */

	//tooltip 지정
    $('.heart').on('click', function(){
    	var i = $(this).find('i')
    	console.log($(this).data('class')) 
    	if($(this).data('class') != ""){
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
    				$("#bookmarkDelete${theme.bookmarkSeq}").attr('style', 'color:black');
    				$(this).find('i').removeAttr( 'id' );
    				$(this).find('i').addAttr("id","bookmarkInsert");
    				i.toggleClass('red');
					//.attr.idadd('id', 'id="bookmarkDelete${theme.bookmarkSeq} ')
    				//$("#bookmark"+seq).closest('article').remove() /* closest 조상중에서 찾음 */
    			} 
    		})
    	}else{
    		if(!confirm("즐겨찾기목록에 등록하시겠습니까?")){
    			return
    		}
    		var id = $(this).data('id')
    		$.ajax({
    			url :'insertBookmark?', 
    			data : {adminId:id },
    			method : 'post',
    			dataType :'json' ,
    			success:function(){
    				$("#bookmark"+seq).closest('article').remove() 
    				$("#bookmarkInsert").attr('style', 'color:red')
    									.attr.idadd('id', 'id="bookmarkDelete${theme.bookmarkSeq} ')
    			} 
    		})
    	}
    	
    	
    	  	
    	  
    })
    /* closest 조상중에서 찾음 */
    //bookmark 등록
	/* $('[id^="bookmarkInsert"]').on('click', function(){
		if(!confirm("정말 즐겨찾기목록에 등록하시겠습니까?")){
			return
		}
		var id = $(this).data('id')
		$.ajax({
			url :'insertBookmark?', 
			data : {adminId:id },
			method : 'post',
			dataType :'json' ,
			success:function(data){
				$("#bookmark"+seq).closest('article').remove() 
				$("#bookmarkInsert").attr('style', 'color:red')
									.attr.idadd('id', 'id="bookmarkDelete${theme.bookmarkSeq} ')
			} 
		})
	}) */
});



$('.icon_slick').slick({
	slidesToShow : 6,
	slidesToScroll : 1,
	autoplay : true,
	autoplaySpeed : 2000,
	responsive : [ {
		breakpoint : 600,
		settings : {
			slidesToShow : 3,
			slidesToScroll : 1
		}
	}, {
		breakpoint : 480,
		settings : {
			slidesToShow : 3,
			slidesToScroll : 1
		}
	} ]
});
</script>