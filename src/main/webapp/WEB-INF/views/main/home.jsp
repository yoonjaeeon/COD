<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="padding: 100px 100px; background-color: pink;"
	align="center">
	<div class="main_slick">
		<div>one</div>
		<div>two</div>
		<div>three</div>
		<div>ha...</div>
		<div>omg</div>
	</div>

</div>
<div style="padding: 100px 100px;"	align="center">
	<div class="main_slick2">
		<c:forEach begin="0" end="3">
			<div>
				<div style="background-color : skyblue;height: 250px; width: 400px"></div>
				<i class="fas fa-coffee"></i>  <strong> 예담카페</strong>
				
			</div>
		</c:forEach>
	</div>
</div>
<script>

$(".main_slick").slick({        
	dots: true,
	infinite: true,
	speed: 400,
	slidesToShow: 1,
	adaptiveHeight: true
});

$(".main_slick2").slick({        
	infinite: true , /* 맨끝이미지에서 끝나지 않고 다시 맨앞으로 이동 */         
	slidesToShow: 3, /* 화면에 보여질 이미지 갯수*/        
	slidesToScroll: 3,  /* 스크롤시 이동할 이미지 갯수 */         
	autoplay: true, /* 자동으로 다음이미지 보여주기 */         
	arrows: true, /* 화살표 */         
	dots:true, /* 아래점 */         
	autoplaySpeed:10000,/* 다음이미지로 넘어갈 시간 */         
	speed:1000 , /* 다음이미지로 넘겨질때 걸리는 시간 */         
	pauseOnHover:true /* 마우스 호버시 슬라이드 이동 멈춤 */    
});

</script>
