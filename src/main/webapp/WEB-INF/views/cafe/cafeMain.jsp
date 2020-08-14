<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(function(){
	$('.heart').on('click', function(){
		var i = $(this).find('i');
		console.log($(this).data('class')) 
		if(i.css('color')=='rgb(255, 0, 0)'){
			if(!confirm("정말 즐겨찾기목록에서 삭제하시겠습니까?")){
				return
			}else
			/* 클린한 곳에서 id를 찾아서 8번째 문자를 반환시켜줌 */
			var seq = $(this).find('i').attr('id').substr(14);
			$.ajax({
				url :'deleteBookmark?', 
				data : {bookmarkSeq:seq},
				method : 'post',
				dataType :'json' ,
				success:function(){
					$("#bookmarkDelete"+seq).css('color','black');
					$(this).find('i').removeAttr( 'id' )
					$(this).find('i').attr("id","bookmarkInsert")
					i.toggleClass('red');
					//.attr.idadd('id', 'id="bookmarkDelete${theme.bookmarkSeq} ')
					//$("#bookmark"+seq).closest('article').remove() /* closest 조상중에서 찾음 */
				} 
			})
		}else{
			if(!confirm("즐겨찾기목록에 등록하시겠습니까?")){
				return
			}
			var id = i.data('id');
			$.ajax({
				url :'insertBookmark', 
				data : {adminId:id },
				method : 'post',
				dataType :'json' ,
				success:function(data){
					i.css('color', 'red')
					.attr('id', 'bookmarkDelete'+data.bookmarkSeq)    				
				} 
			})
		}	  
	})
	})
</script>

<div id="wrapper">
	<article class="post">
		<div class="main_slick">
		<c:forEach items="${fileList}" var="file">
			<div>
				<img src="resources/upload/${file.photoName}" alt="img"
					class="image fit" style="max-height: 500px; overflow: hidden">
			</div>
		</c:forEach>
		</div>
		<!-- 기본정보 -->
		<div class="align-center">
			<div class="row">
				<div class="col-lg-4 boxs" style="padding: 2em">
					<div id="cafeName"><h2>${cafeDetail.cafeName }</h2></div>
					<div class="heart" data-class="${cafeDetail.bookmarks}">
					
						<c:if test="${not empty sessionScope.loginEmail}">
						<c:if test="${not empty cafeDetail.bookmarks}">
							<i class="far fa-heart" data-id='${cafeDetail.adminId}' style="color: red" data-placement="top" title="즐겨찾기 "	data-toggle="tooltip"
							id="bookmarkDelete${cafeDetail.bookmarkSeq}"></i>
							</c:if>
						
						 <c:if test="${empty cafeDetail.bookmarks}">
							<i class="far fa-heart" data-id='${cafeDetail.adminId}' style="color:black" data-placement="top" title="즐겨찾기 "	
							data-toggle="tooltip" id="bookmarkInsert"></i>
						</c:if>  
						</c:if>
						
						</div>
					
					<br> <br>
					<button>
						<i class='fas fa-map-marker-alt'></i> ${cafeDetail.cafeAddress }
					</button>
					<c:if test="${empty sessionScope.loginEmail}">
						<button type="button" onclick="orderLogin()">
							<i class="fas fa-shopping-cart"> </i> 주문하기
						</button>
					</c:if>
					<c:if test="${not empty sessionScope.loginEmail}">
						<button
							onclick="location.href='cafeOrder?adminId=${cafeDetail.adminId}'">
							<i class="fas fa-shopping-cart"> </i> 주문하기
						</button>
					</c:if>
				</div>
				<div class="col-lg-8 boxs">
					<article class="mini-post">
						<header>
							<h3>공지사항</h3>
							<p class="published">${adminNotice.adminNoticeContent }</p>
							<a href="#" class="author"><i class='far fa-heart'></i> <!-- <img src="resources/images/avatar.jpg" alt=""> --></a>
						</header>
					</article>
					<article class="mini-post">
						<header>
							<h3>기본 정보</h3>
							<h4 class="published">영업시간 : ${cafeDetail.cafeTime }</h4>
							<h4 class="published">
								쉬는 날 : <b style="color: red">${cafeDetail.cafeCloseday}</b>
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
						<c:if test="${'1' == cafeDetail.wifi }">
							<div class="single_feature">
								<div class="single_feature_icon">
									<i class="fas fa-wifi"></i>
								</div>
								<h4>와이파이</h4>
							</div>
						</c:if>

						<c:if test="${'1' == cafeDetail.animal }">
							<div class="single_feature">
								<div class="single_feature_icon">
									<i class="fas fa-dog"></i>
								</div>
								<h4>애완동물동반가능</h4>
							</div>
						</c:if>

						<c:if test="${'1' == cafeDetail.nokid}">
							<div class="single_feature">
								<div class="single_feature_icon">
									<i class="fa fa-times"></i>
								</div>
								<h4>노키즈존</h4>
							</div>
						</c:if>

						<c:if test="${'1' == cafeDetail.parking }">
							<div class="single_feature">
								<div class="single_feature_icon">
									<i class="fas fa-car-alt"></i>
								</div>
								<h4>주차가능</h4>
							</div>
						</c:if>

						<c:if test="${'1' == cafeDetail.charger }">
							<div class="single_feature">
								<div class="single_feature_icon">
									<i class="fa fa-plug"></i>
								</div>
								<h4>충전기 대여</h4>
							</div>
						</c:if>

						<c:if test="${'1' == cafeDetail.bigSeat}">
							<div class="single_feature">
								<div class="single_feature_icon">
									<i class="fas fa-users"></i>
								</div>
								<h4>단체석</h4>
							</div>
						</c:if>

						<c:if test="${'1' == cafeDetail.lend }">
							<div class="single_feature">
								<div class="single_feature_icon">
									<i class="fa fa-registered"></i>
								</div>
								<h4>대관가능</h4>
							</div>
						</c:if>

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
			<div class="col-lg-6">
			<h4>좌우로 스크롤하여 좌석 선택 !</h4>
				<div class="main_slick">
					<c:forEach items="${seatList }" var="seat">
						<div id="seatDiv">
							<article class="mini-post"
								onclick="getSeat('${seat.seatName}', '${seat.seatSize }', '${seat.seatSeq}')">
								<header class="row">
									<div class="col-sm-9">
										<h3>
											<a href="single.html">좌석명:${seat.seatName} </a>
										</h3>
										<c:if test="${seat.seatSize==1 }">
											<h4>2인석</h4>
										</c:if>
										<c:if test="${seat.seatSize==2 }">
											<h4>4인석</h4>
										</c:if>
										<c:if test="${seat.seatSize==3 }">
											<h4>단체석</h4>
										</c:if>
	
									</div>
									<div class="col-sm-3">
										<c:if test="${seat.seatReserve==0 }">
											<h4>예약불가</h4>
										</c:if>
										<c:if test="${seat.seatReserve==1 }">
											<h4>예약가능</h4>
										</c:if>
									</div>
								</header>
								<a class="image"><img src="resources/upload/${seat.seatImg}"
									alt=""></a>
							</article>
						</div>
					</c:forEach>
				</div>
				</div>
				
				<!-- 메뉴판 -->
				<article class="col-lg-6">
					<h3>menu</h3>
					<div class="menu" style="height: 350px; overflow: scroll;">
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
								</div></li>
							<c:forEach items="${cafeMenu}" var="menu">
								<li class="list-group-item row"><div
										class="col-lg-6 col-md-8 published">${menu.menuName }</div>
									<div class="col-lg-3 col-md-2 published">${menu.price }</div>
									<div class="col-lg-3 col-md-2 published">${menu.price+menu.priceAdd }</div></li>
							</c:forEach>
						</ul>
					</div>
				</article>
			</section>
		</div>
		<!-- end detail -->

		<!-- review -->
		<div>
			<article class="mini-post">	
				<header>
					<h3>Review</h3>
				</header>
			</article>
			<div class="toggleView">
				<div class="padding2 row cafeReviewList">
				</div>
			</div>
			<button type="button" class="btn_review" >more</button>
		</div>
		<!-- 지도 -->
		<div>
			<article class="mini-post">
				<header>
					<h3>카페위치</h3>
				</header>
			</article>
			<div id="map" style="width: 100%; height: 350px;">
				<input type="hidden" name="cafeX" value="${cafeLocation.cafeX}">
				<input type="hidden" name="cafeY" value="${cafeLocation.cafeY}">
			</div>
		</div>
	</article>
</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=094a897b2c2dd75dce40464014299bf4"></script>
	<script>
	$('[data-toggle="tooltip"]').tooltip();
	//리뷰 작성 체크
		function orderLogin() {
			alert("주문은 회원가입 후 가능합니다");
		}

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng($('input[name=cafeY]').val(), $(
					'input[name=cafeX]').val()), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치입니다 
		var position = new kakao.maps.LatLng($('input[name=cafeY]').val(), $(
				'input[name=cafeX]').val());
		//var position =  new kakao.maps.LatLng($('input[name=cafeX]').val()), $('input[name=cafeY]').val());
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : position,
			clickable : true
		// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
		});

		// 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
		// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
		// marker.setClickable(true);

		// 마커를 지도에 표시합니다.
		marker.setMap(map);

		// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
		var iwContent = '<div style="padding:5px;">'+$('#cafeName').html()+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
		});

		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow.open(map, marker);
		});
//첫번째 페이지 로드
// $(".cafeReviewList").load("cafeReviewList?adminId=${param.adminId}");
//more 버튼 클릭시

$(function(){
	
	$(".btn_review").click(function() {
	 $.ajax(
		{url: "cafeReviewList",
		data:{reviewSeq:$(".reviewtitle").last().data("reviewseq"),adminId:"${param.adminId}"}
		}).done(function(data){
			$(".cafeReviewList").append(data)
		})
	});
// 로드 후 클릭 함수가 실행	
	 $(".btn_review").click();
//	 
	$(".btn_toggle").click(function() {
		$(".toggleView").collapse('toggle');
	});

	$("div.main_slick").slick({
		infinite : true,
		speed : 400,
		slidesToShow : 1,
		adaptiveHeight : true,
		dot : true
	});

	$('.icon_slick').slick({
		slidesToShow : 7,
		slidesToScroll : 1,
		autoplay : true,
		autoplaySpeed : 2000,
		responsive : [ {
			breakpoint : 900,
			settings : {
				slidesToShow : 4,
				slidesToScroll : 1
			}
		}, {
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
	

})
	
	function getSeat(seatName, seatSize, seatSeq){
		$('#seatName').html(seatName);
		$('#seatSeq').html(seatSeq);
		if(seatSize == 1){
		$('#seatSize').html("2인석");
		}else if(seatSize == 2){
			$('#seatSize').html("4인석")
		}else{
			$('#seatSize').html("단체석")
		}
	}
	
</script>