<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="wrapper">
	<article class="post">
		<div class="main_slick">
			<c:forEach var="index" begin="1" end="3">
				<div class="image featured"
					style="max-height: 500px; overflow: hidden">
					<img src="resources/images/main${index}.jpg" alt="img"
						class="image fit">
				</div>
			</c:forEach>
		</div>
		<!-- 기본정보 -->
		<div class="align-center">
			<div class="row">
				<div class="col-lg-4 boxs" style="padding: 2em">
					<h2>카페이름</h2>
					<i class='far fa-heart' style='font-size: 24px'></i><br> <br>
					<button>
						<i class='fas fa-map-marker-alt'></i> 위치보기
					</button>
					<button>
						<i class="fas fa-shopping-cart"> </i> 주문하기
					</button>
				</div>
				<div class="col-lg-8 boxs">
					<article class="mini-post">
						<header>
							<h3>공지사항</h3>
							<p class="published">07월21일 09:00am 소독 완료 ! 편하게 놀러오세요 :)</p>
							<a href="#" class="author"><i class='far fa-heart'></i> <!-- <img src="resources/images/avatar.jpg" alt=""> --></a>
						</header>
					</article>
					<article class="mini-post">
						<header>
							<h3>기본 정보</h3>
							<h4 class="published">영업시간 : am10:00~ pm07:00</h4>
							<h4 class="published">
								쉬는 날 : <b style="color: red">매주 일요일</b>
							</h4>
						</header>
					</article>

				</div>
			</div>
		</div>
		
		<!-- 서비스 -->
			<article class="mini-post">
				<header>
					<h2>서비스</h2>
					<div class="main_feature text-center">
						<div class="icon_slick">
							<div class="single_feature">
								<div class="single_feature_icon">
									<i class="fas fa-wifi"></i>
								</div>
								<h4>와이파이</h4>
							</div>
							<div class="single_feature">
								<div class="single_feature_icon">
									<i class="fas fa-dog"></i>
								</div>
								<h4>애완동물동반가능</h4>
							</div>
							<div class="single_feature">
								<div class="single_feature_icon">
									<i class="fa fa-times"></i>
								</div>
								<h4>노키즈존</h4>
							</div>
							<div class="single_feature">
								<div class="single_feature_icon">
									<i class="fas fa-car-alt"></i>
								</div>
								<h4>주차가능</h4>
							</div>
							<div class="single_feature">
								<div class="single_feature_icon">
									<i class="fa fa-plug"></i>
								</div>
								<h4>충전기 대여</h4>
							</div>
							<div class="single_feature">
								<div class="single_feature_icon">
									<i class="fas fa-users"></i>
								</div>
								<h4>단체석</h4>
							</div>
							<div class="single_feature">
								<div class="single_feature_icon">
									<i class="fa fa-registered"></i>
								</div>
								<h4>대관가능</h4>
							</div>
						</div>
					</div>
				</header>
			</article>
			<br>
			<!-- end service -->
			
			<!-- detail -->
			<div id="listpage">
				<section class="posts row">
					<!-- 좌석선택 -->
					<div class="main_slick col-lg-6">
						<c:forEach begin="0" end="3">
							<div>
								<article class="mini-post">
									<header class="row">
										<div class="col-sm-9">
											<h3>
												<a href="single.html">T1</a>
											</h3>
											<h4>2~4인</h4>
										</div>
										<div class="col-sm-3">
											<i class="far fa-heart"></i>
											<h4>예약가능</h4>
										</div>
									</header>
									<a href="#" class="image"><img
										src="resources/images/main2.jpg" alt=""></a>
								</article>
							</div>
						</c:forEach>
					</div>
					<!-- 메뉴판 -->
					<article class="col-lg-6">
							<h3>menu</h3>
						<ul class="list-group list-group-flush">
						    <li class="list-group-item row"><div class="col-lg-6 col-md-8 published"><b>메뉴명</b></div><div class="col-lg-3 col-md-2 published"><b>hot</b></div><div class="col-lg-3 col-md-2 published"><b>ice</b></div></li>
						    <c:forEach begin="0" end="4">
						    <li class="list-group-item row"><div class="col-lg-6 col-md-8 published">아메리카노</div><div class="col-lg-3 col-md-2 published">2000</div><div class="col-lg-3 col-md-2 published">2500</div></li>
							</c:forEach>
						</ul>
					</article>
				</section>
			</div>
	</article>
</div>

<script type="text/javascript">
	$("div.main_slick").slick({
		infinite : true,
		speed : 400,
		slidesToShow : 1,
		adaptiveHeight : true,
		dot : true
	});

	$(document).ready(function() {
		var max_h = 0;
		$("div.boxs ").each(function() {
			var h = parseInt($(this).css("height"));
			if (max_h < h) {
				max_h = h;
			}
		});
		$(".boxs ").each(function() {
			$(this).css({
				height : max_h
			});
		});
	});
	$('.icon_slick').slick({
		slidesToShow : 7,
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
				slidesToShow : 2,
				slidesToScroll : 1
			}
		} ]
	});
</script>