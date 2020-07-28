<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function test(obj) {
		if($('#addMenuName') != $(this).(#'ddd').html()){
			$(#'table').append('<tr>')
		}else{
			
		}
		
		var atid = obj.getAttribute('atrid')
		console.log(atid)

		$.ajax({
			url : "menuList/" + menuName,
			success : function(result) {
				result.menuName;
				result.price;
			}
		});
		var menu_name = $('input:text[name="menuName"]').val(menuList.menuName);
		var menu_price = 2500;
		var table = document.createElement('table');
		
/* <table class="table text-center" id="table">
		<tr>
			<td>메뉴</td>
			<td>수량</td>
			<td>좌석번호</td>
			<td>가격</td>
		</tr>
		<tr id="tr">
			<td id="addMenuName">아메리카노</td>
			<td id="addMenuAmount">1</td>
			<td id="addSeat">t1</td>
			<td id="addMenuPrice">2500</td>
</table> */
	}
</script>



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





<!-- 기본정보 -->
<div class="align-center">
	<div align="center">

		<h2>카페93.4C</h2>


		<article class="mini-post">
			<header>
				<h3>이벤트</h3>
				<h4 class="published">
					구매후 다른 각도의 음료 사진 2장을 인스타 업로드 후 <br /> 직원에게 보여주시면 쿠기 무료 제공
				</h4>
			</header>
		</article>

	</div>


	<!-- 서비스 -->
	<article class="mini-post">
		<header>
			<h2 align="center">주문하기</h2>

		</header>
	</article>
	<br>
	<!-- end service -->

	<!-- detail -->
	<div id="listpage">
		<section class="posts row">
			<!-- 좌석선택 -->
			<div class="main_slick col-lg-6">
				<c:forEach items="${seatList }" var="seat">
					<div>
						<article class="mini-post">
							<header class="row">
								<div class="col-sm-9">
									<h3>
										<a href="single.html">${seat.seatName} </a>
									</h3>
									<h4>${seat.seatSize}</h4>
								</div>
								<div class="col-sm-3">
									<i class="far fa-heart"></i>
									<c:if test="${seat.seatReserve==0 }">
										<h4>예약불가</h4>
									</c:if>
									<c:if test="${seat.seatReserve==1 }">
										<h4>예약가능</h4>
									</c:if>
								</div>
							</header>
							<a class="image"><img src="resources/upload/${seat.seatImg}" alt=""></a>
						</article>
					</div>
				</c:forEach>
			</div>
			<!-- 메뉴판 -->
			<article class="col-lg-6">
				<h3>menu</h3>
				<ul class="list-group list-group-flush">
					<li class="list-group-item row"><div
							class="col-lg-6 col-md-8 published">
							<b>메뉴명</b>
						</div>
						<div class="col-lg-3 col-md-2 published">
							<b>hot</b>
						</div>
						<div class="col-lg-3 col-md-2 published">
							<b>ice</b>
						</div>
					</li>
						
					<c:forEach items="${menuList}" var="menu">
						<li id='aa' onclick="test(this)" class="list-group-item row">
						<div class="col-lg-6 col-md-8 published" id='ddd'>${menu.menuName }</div>
							<div class="col-lg-3 col-md-2 published">${menu.price }</div>
							<div class="col-lg-3 col-md-2 published">${menu.price+menu.priceAdd }</div>
						</li>
					</c:forEach>
				</ul>
			</article>
		</section>
		<br>
		<br>
		<br>

		<div class="container" id="showResult">
			<h2>주문확인</h2>
			
			<table class="table text-center" id="table">
				
					<tr id="tr">
						<td>메뉴</td>
						<td>수량</td>
						<td>좌석번호</td>
						<td>가격</td>
					</tr>
					<tr>
						<td id="addMenuName">아메리카노</td>
						<td id="addMenuAmount">1</td>
						<td id="addSeat">t1</td>
						<td id="addMenuPrice">2500</td>
					</tr>
			</table>
		</div>
		<div align="right">
			<input type="button" value="결제" id="price" />
		</div>
	</div>		
</div>



