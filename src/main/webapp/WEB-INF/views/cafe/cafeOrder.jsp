<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script>
function amountDown(price,seq){ //수량 및 가격 내려줌
	var value = $(event.target).next();
	var $price =parseInt(price); 
	
	if(parseInt(value.html()) <= 1){
		alert("1개 이상 주문 부탁드립니다^^");
	}else if(parseInt(value.html()) >= 1){
		value.html(parseInt(value.html())-1);
		$('#prices'+seq+'').html(parseInt(price)*parseInt(value.html()));
	sum();
	}
	//price.html(parseInt($price) - price);
	//$('#menuPrice').html(parseInt($('#menuPrice').html)-parseInt(price));
	
}
function amountUp(price,seq){
	var value = $(event.target).prev();
	var $price =parseInt(price); 
		//parseInt($(event.target).closest("#prices").html());
	value.html(parseInt(value.html())+1);
	$('#prices'+seq+'').html(parseInt(price)*parseInt(value.html()));
			//$('#menuPrice').html(parseInt($('#sum').html)+price);
			sum();
			
			
	//+1 , 가격+
}
function sum(){
	var result=0;	
		$('.menuPrice').each(function(index, item){
			result += parseInt($(item).html());
				//parseInt(item);			
		})
		$('#sum').html(result);
}


function deleteValue(seq){ //주문상세 지우는 페이지
			$('#sum').html(
					 parseInt($('#sum').html())-parseInt($('#menuPrice').html()) 
					);
			
			if($('#sum').html()== null || $('#sum').html()==""){
				$('#sum').html("0");
			}
	$('#'+seq+'').empty();
}

/* 핫 메뉴 클릭 */
	function test(name, price, seq, state) {
		//var sum = parseInt($('#sum').innerHtml()) + parseInt($('#price').text());		
		var validCheck=$('#appendTest td:contains('+state+' '+name+')');
		//var sum2 =parseInt(validCheck=$('#appendTest td:contains('+name+')').next().next().next().text());
		//같은 메뉴인지 검사
		if(validCheck.length > 0 ) {
			var span = validCheck.next().find('span')
			span.text(parseInt(span.text())+1);
			
			validCheck.next().next().next().text(parseInt(validCheck.next().next().next().text())+price);
			sum();
					/* $('#sum').html(
							 parseInt($('#sum').html()) + 
							
							 parseInt(price)  //같은 메뉴일떄는 텍스트값만 가져와서 더해줘야함 계속 더해주면 안된다.
							); */
			//parseInt(sum2+parseInt(price));
			//parseInt($('#sum').html(price))+parseInt(price);
		} //name을 찾아줌   $('#id').attr('style', "display:none;");

		else{		
			
			var tr =							
				'<tr id="'+seq+'" data-price="'+price+'">'  
					+'<td align="center">'+state+' '+ name+'</td>'  
					+'<td ><button onclick="amountDown('+price+","+seq+')">-</button><span id="amount'+seq+'">' + 1	+ '</span><button onclick="amountUp('+price+","+seq+')">+</button></td>'  
					+'<td>선택</td>'
					+'<td><span class="menuPrice" id="prices'+seq+'">'+price+'<span></td>'
					+'<td><button onclick="deleteValue('+seq+')">삭제</button></td>'
					+ '</tr>';
					
					
			$('#appendTest').append(tr);
			sum();
							/* $('#sum').html(
									parseInt($('#sum').html()) + 
									parseInt(price)
									); */
					
		}	
	
		
	}
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
							<a class="image"><img src="resources/upload/${seat.seatImg}"
								alt=""></a>
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
						</div></li>

					<c:forEach items="${menuList}" var="menu">
						<li id='aa' class="list-group-item row" data-id='${menu.menuSeq}'>
							<div class="col-lg-6 col-md-8 published" id='ddd'>${menu.menuName }</div>
							<c:if test="${menu.menuState ==2 }">
								<div
									onclick="test('${menu.menuName }',${menu.price },${menu.menuSeq}, '핫')"
									class="col-lg-3 col-md-2 published" data-placement="top"
									title="Hot선택 " data-toggle="tooltip">${menu.price }</div>

								<div
									onclick="test('${menu.menuName }',${menu.price+menu.priceAdd },${menu.menuSeq}, '아이스')"
									class="col-lg-3 col-md-2 published" data-placement="top"
									title="Ice선택" data-toggle="tooltip">${menu.price+menu.priceAdd }</div>
							</c:if> <c:if test="${menu.menuState==0 }">
								<div align="center"
									onclick="test('${menu.menuName }',${menu.price },${menu.menuSeq}, '')"
									class="col-lg-3 col-md-2 published" data-placement="top"
									title="메뉴 선택" data-toggle="tooltip">${menu.price }</div>
							</c:if>
						</li>
					</c:forEach>
				</ul>
			</article>
		</section>
		<br> <br> <br>

		<div class="container" id="showResult">
			<h2>주문확인</h2>

			<table class="table text-center" id="table">
				<thead>
					<tr id="tr">
						<td>메뉴</td>
						<td>수량</td>
						<td>좌석번호</td>
						<td>가격</td>
					</tr>
				</thead>
				<tbody id="appendTest">
				</tbody>
			</table>
		</div>
		<div align="right">
			<label id="sum">0</label> <input type="button" value="결제" id="price" />
		</div>
	</div>
</div>

<script type="text/javascript">
$('[data-toggle="tooltip"]').tooltip()
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


