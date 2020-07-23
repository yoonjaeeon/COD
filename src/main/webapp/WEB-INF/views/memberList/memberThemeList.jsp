<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<c:if test="${not empty theme.bookmarks}">
							<i class="far fa-heart" style="color: red" ></i><%-- id='bookmark${theme.bookmarkSeq }' --%>
						</c:if>
						<c:if test="${empty theme.bookmarks}">
							<i class="far fa-heart"></i>
						</c:if>
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