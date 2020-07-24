<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 테마 아이콘  -->
<div class="main_feature text-center">
	<div class="icon_slick">
		<div class="single_feature">
			<div class="single_feature_icon">
				<i class="far fa-thumbs-up"></i>
			</div>
			<h4>내주변</h4>
		</div>
		<div class="single_feature" onclick="location.href='areaList?cafeAddress=중구'">
			<div class="single_feature_icon" >
				<i class="fab fa-fort-awesome"></i>
			</div>
			<h4>중구</h4>
		</div>
		<div class="single_feature" onclick="location.href='areaList?cafeAddress=남구'">
			<div class="single_feature_icon">
				<i class="fas fa-birthday-cake"></i>
			</div>
			<h4>남구</h4>
		</div>
		<div class="single_feature" onclick="location.href='areaList?cafeAddress=서구'">
			<div class="single_feature_icon">
				<i class="fab fa-envira"></i>
			</div>
			<h4>서구</h4>
		</div>
		<div class="single_feature" onclick="location.href='areaList?cafeAddress=북구'">
			<div class="single_feature_icon">
				<i class="fas fa-laptop"></i>
			</div>
			<h4>북구</h4>
		</div>
		<div class="single_feature" onclick="location.href='areaList?cafeAddress=동구'">
			<div class="single_feature_icon">
				<i class="fas fa-coffee"></i>
			</div>
			<h4>동구</h4>
		</div>
		<div class="single_feature" onclick="location.href='areaList?cafeAddress=수성구'">
			<div class="single_feature_icon">
				<i class="fas fa-coffee"></i>
			</div>
			<h4>수성구</h4>
		</div>
		<div class="single_feature" onclick="location.href='areaList?cafeAddress=달서구'">
			<div class="single_feature_icon">
				<i class="fas fa-coffee"></i>
			</div>
			<h4>달서구</h4>
		</div>
		<div class="single_feature" onclick="location.href='areaList?cafeAddress=달성군'">
			<div class="single_feature_icon">
				<i class="fas fa-coffee"></i>
			</div>
			<h4>달성군</h4>
		</div>
	</div>
</div>
<div id="listpage">
	<section class="posts">
		<c:forEach items="${getArea}" var="area">
			<article class="mini-post">
				<header class="row">
					<div class="col-sm-9">
						<h3>
							<a href="cafe?adminId=${area.adminId }">${area.cafeName }</a>
						</h3>
						<h4>#해쉬태그</h4>
					</div>
					<div class="col-sm-3">
						<div class="heart" data-class="${area.bookmarks}">
							<c:if test="${empty sessionScope.loginEmail}">
								<i class="far fa-heart"></i>
							</c:if>
							<c:if test="${(not empty sessionScope.loginEmail) and (sessionScope.loginEmail eq area.bookmarks)}">
								<i class="far fa-heart" style="color:red" data-placement="top" title="즐겨찾기 "	data-toggle="tooltip"						
							id="bookmarkDelete${area.bookmarkSeq}" ></i>
							</c:if>
							<c:if test="${(not empty sessionScope.loginEmail) and (sessionScope.loginEmail ne area.bookmarks) }">
								<i class="far fa-heart" data-id='${area.adminId}' style="color:black" data-placement="top" title="즐겨찾기 "	
							data-toggle="tooltip" id="bookmarkInsert"></i>
							</c:if>
						</div>
						<h4><i class='fas fa-star'></i>${area.stars }</h4>
					</div>
				</header>
				<a href="cafe?adminId=${area.adminId }" class="image"><img src="resources/upload/${area.cafeThumbnail }"
					alt=""></a>
			</article>
		</c:forEach>
	</section>
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
				$(this).find('i').removeAttr( 'id' )
				$(this).find('i').addAttr("id","bookmarkInsert")
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


	$('.icon_slick').slick({
		slidesToShow : 9,
		slidesToScroll : 1,
		autoplay : true,
		autoplaySpeed : 2000,
		responsive : [ {
			breakpoint : 800,
			settings : {
				slidesToShow : 7,
				slidesToScroll : 1
			}
		}, {
			breakpoint : 600,
			settings : {
				slidesToShow : 5,
				slidesToScroll : 1
			}
		}, {
			breakpoint : 480,
			settings : {
				slidesToShow : 4,
				slidesToScroll : 1
			}
		} ]
	});
</script>