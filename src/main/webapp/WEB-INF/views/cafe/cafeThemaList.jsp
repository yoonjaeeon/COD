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
			<h4>COD 추천 카페</h4>
		</div>
		<div class="single_feature">
			<div class="single_feature_icon">
				<i class="fab fa-fort-awesome"></i>
			</div>
			<h4>이색 카페</h4>
		</div>
		<div class="single_feature">
			<div class="single_feature_icon">
				<i class="fas fa-birthday-cake"></i>
			</div>
			<h4>디저트 맛집</h4>
		</div>
		<div class="single_feature">
			<div class="single_feature_icon">
				<i class="fab fa-envira"></i>
			</div>
			<h4>야외석 있는</h4>
		</div>
		<div class="single_feature">
			<div class="single_feature_icon">
				<i class="fas fa-laptop"></i>
			</div>
			<h4>작업하기 좋은</h4>
		</div>
		<div class="single_feature">
			<div class="single_feature_icon">
				<i class="fas fa-coffee"></i>
			</div>
			<h4>핸드 드립</h4>
		</div>
	</div>
</div>
<div id="listpage">
	<section class="posts">
		<c:forEach begin="0" end="3">
			<article class="mini-post">
				<header class="row align-center">
					<div class="col-6">
						<h3>#해쉬태그</h3>
					</div>
					<div class="col-6">
						<i class='far fa-heart' style='font-size:24px;'></i>
			            <h2>4.3</h2>
					</div>
				</header>
				<h2 class="margin1">
					<a href="#">yedam Cafe</a>
				</h2>

				<a href="#" class="image"> <img src="resources/images/main2.jpg"
					alt=""></a>
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