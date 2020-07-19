<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="main_slick">
	<c:forEach var="index" begin="1" end="3">
		<div>
			<img src="resources/images/main${index}.jpg" alt="img"
				class="image fit" style="max-height: 400px; overflow: hidden">
		</div>
	</c:forEach>
</div>

<!-- Thema Icon -->
<div class="main_feature text-center">
	<div class="icon_slick">
		<div class="single_feature">
			<div class="single_feature_icon">
				<i class="far fa-thumbs-up"></i>
			</div>
			<h4>추천 카페</h4>
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

<!-- <i class="far fa-envelope"></i> <i class='far fa-envelope-open'></i> -->
<!-- 아이콘/지도  -->
<div class="row" align="center" class="margin2">
	<div class="col-lg-6">
		<div>
			<h2>지역별 리스트 보기 </h2>
		</div>
		<div class="main_slick" style="width: 70%">
			<div>
				<a href="#" class="image fit"> <img
					src="resources/images/main1.jpg" class="image">
				</a>
			</div>
			<div>
				<a href="#" class="image fit"> <img
					src="resources/images/main3.jpg" class="image">
				</a>
			</div>
			<div>
				<a href="#" class="image fit"> <img
					src="resources/images/main2.jpg" class="image">
				</a>
			</div>
		</div>
	</div>
	<!-- 지도 -->
	<div class="col-lg-6">
		<div class="maps">
			<script type="text/javascript">
				function changeImg(img) {
					var mapimg = document.getElementById('map');
					mapimg.src = img;
				}
			</script>
			<img id="map" src="resources/images/map.png" border="0" usemap="#Map" />
			<map name="Map">
				<!-- 동구 -->
				<area shape="poly" href="#"
					coords="230,73,260,48,306,40,350,57,360,95,372,150,380,180,364,220,335,208,320,220,300,198,272,190,253,203,247,184,252,170,259,144,250,127,250,95"
					target="_self"
					onmouseover="changeImg('resources/images/map_dg_on.png')"
					onmouseout="changeImg('resources/images/map.png')">
				<!-- 북구 -->
				<area shape="poly" href="#"
					coords="230,75,247,95,252,129,257,144,253,169,256,178,240,196,215,195,186,175,147,181,150,160,170,130,165,83"
					target="_self"
					onmouseover="changeImg('resources/images/map_bg_on.png')"
					onmouseout="changeImg('resources/images/map.png')">
				<!-- 서구 -->
				<area shape="poly" href="#"
					coords="211,186,210,207,183,220,167,207,158,203,154,183,172,183,187,177"
					target="_self"
					onmouseover="changeImg('resources/images/map_sg_on.png')"
					onmouseout="changeImg('resources/images/map.png')">
				<!-- 중구 -->
				<area shape="poly" href="#"
					coords="241,197,244,204,238,197,210,212,212,204,214,197"
					target="_self"
					onmouseover="changeImg('resources/images/map_jg_on.png')"
					onmouseout="changeImg('resources/images/map.png')">
				<!-- 남구 -->
				<area shape="poly" href="#"
					coords="216,220,237,222,236,240,239,257,223,267,197,238"
					target="_self"
					onmouseover="changeImg('resources/images/map_ng_on.png')"
					onmouseout="changeImg('resources/images/map.png')">
				<!-- 달서구 -->
				<area shape="poly" href="#"
					coords="209,213,196,243,210,273,208,287,211,306,190,310,198,297,160,292,148,266,125,264,115,238,120,210,150,212,158,209,184,222"
					target="_self"
					onmouseover="changeImg('resources/images/map_dsg_on.png')"
					onmouseout="changeImg('resources/images/map.png')">
				<!-- 수성구 -->
				<area shape="poly" href="#"
					coords="245,204,261,205,275,195,300,200,319,219,346,217,345,237,333,246,339,265,310,292,257,271,227,271,238,259,240,225"
					target="_self"
					onmouseover="changeImg('resources/images/map_ssg_on.png')"
					onmouseout="changeImg('resources/images/map.png')">
				<!-- 달성군1,2 -->
				<area shape="poly" href="#"
					coords="147,182,158,184,154,211,121,212,114,240,75,226,40,225,55,172,59,166,64,150,99,126,120,130,120,153,115,166,135,180"
					target="_self"
					onmouseover="changeImg('resources/images/map_dsg2_on.png')"
					onmouseout="changeImg('resources/images/map.png')">
				<area shape="poly" href="#"
					coords="227,275,240,280,257,274,309,294,309,306,322,325,316,347,319,360,291,372,277,386,258,398,250,350,228,360,200,357,173,380,176,408,158,455,115,460,66,490,33,493,60,463,12,388,80,396,89,367,40,335,72,277,124,263,149,269,160,292,184,300,192,314,212,307,213,288"
					onmouseover="changeImg('resources/images/map_dsg2_on.png')"
					onmouseout="changeImg('resources/images/map.png')">
			</map>
		</div>
	</div>
</div>
<!-- 지도 end -->

<!-- 신규List -->
<div class="padding2" align="center">
	<h3>신규업체</h3>
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
<!-- 인기리스트 -->
<div class="padding2" align="center">
	<h3>인기리스트</h3>
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
