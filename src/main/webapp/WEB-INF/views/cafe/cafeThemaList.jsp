<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 테마 아이콘  -->
<div class="main_feature text-center">
	<div class="row">
		<div class="col-sm-2">
			<div class="single_feature">
				<div class="single_feature_icon">
					<i class="far fa-thumbs-up"></i>
				</div>
				<h4>추천 카페</h4>
			</div>
		</div>
		<div class="col-sm-2">
			<div class="single_feature">
				<div class="single_feature_icon">
					<i class="fab fa-fort-awesome"></i>
				</div>
				<h4>이색 카페</h4>
			</div>
		</div>
		<div class="col-sm-2">
			<div class="single_feature">
				<div class="single_feature_icon">
					<i class="far fa-lemon"></i>
				</div>

				<h4>디저트 맛집</h4>
			</div>
		</div>
		<div class="col-sm-2">
			<div class="single_feature">
				<div class="single_feature_icon">
					<i class="fab fa-envira"></i>
				</div>
				<h4>야외석 있는</h4>
			</div>
		</div>
		<div class="col-sm-2">
			<div class="single_feature">
				<div class="single_feature_icon">
					<i class="fas fa-laptop"></i>
				</div>
				<h4>작업하기 좋은</h4>
			</div>
		</div>
		<div class="col-sm-2">
			<div class="single_feature">
				<div class="single_feature_icon">
					<i class="fas fa-coffee"></i>
				</div>
				<h4>핸드 드립</h4>
			</div>
		</div>
	</div>
</div>

<div id="listpage">
	<section class="posts">
		<c:forEach begin="0" end="3">
			<article>
				<a href="#" class="image fit"><img
					src="resources/images/main1.jpg" alt=""></a>
				<header>
					<h2>Yedam Cafe</h2>
					<h4>#분위기좋은 #동촌유원지</h4>
				</header>
				<i class='far fa-heart' style='font-size:24px;'></i>
				<h2>4.3</h2>
			</article>
		</c:forEach>
	</section>
</div>