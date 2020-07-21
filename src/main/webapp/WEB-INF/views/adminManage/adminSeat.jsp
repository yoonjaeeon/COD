<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>카페 좌석 관리</h1>

<div id="listpage">
	<section class="posts">
			<article class="mini-post">
				<a href="#" class="image"><img src="resources/images/main2.jpg" style="max-width: 50%; height: auto;"
					alt=""></a>
						<header class="row">
					<div class="col-sm-10">
						<h3>
							<a href="single.html">좌석 번호</a>
						</h3>
						<h4>1~2인 사용 가능</h4>
						<h5>사용중</h5>
					</div>
				</header>
			</article>
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
