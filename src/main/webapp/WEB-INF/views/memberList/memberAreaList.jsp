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
		<div class="single_feature">
			<div class="single_feature_icon">
				<i class="fab fa-fort-awesome"></i>
			</div>
			<h4>중구</h4>
		</div>
		<div class="single_feature">
			<div class="single_feature_icon">
				<i class="fas fa-birthday-cake"></i>
			</div>
			<h4>남구</h4>
		</div>
		<div class="single_feature">
			<div class="single_feature_icon">
				<i class="fab fa-envira"></i>
			</div>
			<h4>서구</h4>
		</div>
		<div class="single_feature">
			<div class="single_feature_icon">
				<i class="fas fa-laptop"></i>
			</div>
			<h4>북구</h4>
		</div>
		<div class="single_feature">
			<div class="single_feature_icon">
				<i class="fas fa-coffee"></i>
			</div>
			<h4>동구</h4>
		</div>
		<div class="single_feature">
			<div class="single_feature_icon">
				<i class="fas fa-coffee"></i>
			</div>
			<h4>수성구</h4>
		</div>
		<div class="single_feature">
			<div class="single_feature_icon">
				<i class="fas fa-coffee"></i>
			</div>
			<h4>달서구</h4>
		</div>
		<div class="single_feature">
			<div class="single_feature_icon">
				<i class="fas fa-coffee"></i>
			</div>
			<h4>달성군</h4>
		</div>
	</div>
</div>
<div id="listpage">
	<section class="posts">
		<c:forEach begin="0" end="3">
			<article class="mini-post">
				<header class="row">
					<div class="col-sm-10">
						<h3>
							<a href="single.html">yedam Cafe</a>
						</h3>
						<h4>#해쉬태그</h4>
					</div>
					<div class="col-sm-2">
						<i class="far fa-heart"></i>
						<h4>4.3</h4>
					</div>
				</header>
				<a href="#" class="image"><img src="resources/images/main2.jpg"
					alt=""></a>
			</article>
		</c:forEach>
	</section>
</div>
<script>
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