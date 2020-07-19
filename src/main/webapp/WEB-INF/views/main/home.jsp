<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="main_slick">
	<c:forEach var="index" begin="1" end="3">
		<div>
			<img src="resources/images/main${index}.jpg" alt="img" class="image fit" style="max-height:400px; overflow: hidden">
		</div>
	</c:forEach>
</div>
<!-- <i class="far fa-envelope"></i> <i class='far fa-envelope-open'></i> -->
<!-- 아이콘/지도  -->
<div class="row">
	<!-- icon -->
	<div class="col-6 padding1">
		<div class="main_feature text-center">
			<div class="row">
				<div class="col-sm-4">
					<div class="single_feature">
						<div class="single_feature_icon">
							<i class="far fa-thumbs-up"></i>
						</div>
						<h4>추천 카페</h4>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="single_feature">
						<div class="single_feature_icon">
							<i class="fab fa-fort-awesome"></i>
						</div>
						<h4>이색 카페</h4>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="single_feature">
						<div class="single_feature_icon">
							<i class="far fa-lemon"></i>
						</div>

						<h4>디저트 맛집</h4>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="single_feature">
						<div class="single_feature_icon">
							<i class="fab fa-envira"></i>
						</div>
						<h4>야외석 있는</h4>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="single_feature">
						<div class="single_feature_icon">
							<i class="fas fa-laptop"></i>
						</div>
						<h4>작업하기 좋은</h4>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="single_feature">
						<div class="single_feature_icon">
							<i class="fas fa-coffee"></i>
						</div>
						<h4>핸드 드립</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 지도 -->
	<div class="col-6"></div>
</div>

<%-- <div class="padding2" align="center">
	<h3> 신규 리스트 </h3>
	<hr>
	<div class="main_slicks">
		<c:forEach begin="0" end="4">
			<div class="col-lg-4 col-sm-6">
			<div class="row">
				<div class="col-6">
					<a href="#" class="image fit">
					<img src="resources/images/main1.jpg" class="image"></a>
				</div>
				<div class="col-6">
					<h3>Yedam Cafe</h3>
					<i class='fas fa-heart' style= 'color:red'></i> <b>4.3</b>
					<h4>#해쉬태그</h4>
				</div>
			</div> 
		</div>
		</c:forEach>
	</div>
</div> --%>
<div class="padding2" align="center">
	<h3>신규업체 </h3>
	<hr>
	<div class="main_slicks">
		<c:forEach begin="0" end="4">
			<div>
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
					<a href="single.html" class="image"><img
						src="resources/images/main2.jpg" alt=""></a>
				</article>
			</div>
		</c:forEach>
	</div>
</div>
<div class="padding2" align="center">
	<h3> 인기리스트 </h3>
	<hr>
	<div class="main_slicks">
		<c:forEach begin="0" end="4">
			<div>
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
					<a href="single.html" class="image"><img
						src="resources/images/main2.jpg" alt=""></a>
				</article>
			</div>
		</c:forEach>
	</div>
</div>
<script>
	$(".main_slick").slick({
		dots : true,
		infinite : true,
		speed : 400,
		slidesToShow : 1,
		adaptiveHeight : true
	});

	$(".main_slick2").slick({
		infinite : true, /* 맨끝이미지에서 끝나지 않고 다시 맨앞으로 이동 */
		slidesToShow : 3, /* 화면에 보여질 이미지 갯수*/
		slidesToScroll : 3, /* 스크롤시 이동할 이미지 갯수 */
		autoplay : true, /* 자동으로 다음이미지 보여주기 */
		arrows : true, /* 화살표 */
		dots : true, /* 아래점 */
		autoplaySpeed : 10000,/* 다음이미지로 넘어갈 시간 */
		speed : 1000, /* 다음이미지로 넘겨질때 걸리는 시간 */
		pauseOnHover : true
	/* 마우스 호버시 슬라이드 이동 멈춤 */

	});
	$('.main_slicks').slick({
		slidesToShow : 4,
		slidesToScroll : 1,
		autoplay : true,
		autoplaySpeed : 2000,
		responsive : [ {
			breakpoint : 1024,
			settings : {
				slidesToShow : 3,
				slidesToScroll : 1
			}
		}, {
			breakpoint : 600,
			settings : {
				slidesToShow : 2,
				slidesToScroll : 1
			}
		}, {
			breakpoint : 480,
			settings : {
				slidesToShow : 1,
				slidesToScroll : 1
			}
		} ]
	});
</script>
