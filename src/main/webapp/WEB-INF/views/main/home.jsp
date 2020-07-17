<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<script>

$(".main_slick").slick({        
	dots: true,
	infinite: true,
	speed: 400,
	slidesToShow: 1,
	adaptiveHeight: true
});

</script>
