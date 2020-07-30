<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
#seatSeq{display : none}
</style>
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
	
}
function amountUp(price,seq){
	var value = $(event.target).prev();
	var $price =parseInt(price); 
	value.html(parseInt(value.html())+1);
	$('#prices'+seq+'').html(parseInt(price)*parseInt(value.html()));
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

//메뉴 클릭시
	function test(name, price, seq, state, realState) {
		var validCheck=$('#appendTest td:contains('+state+' '+name+')');
		if(validCheck.length > 0 ) {
			var span = validCheck.next().find('span'); //수량
			span.text(parseInt(span.text())+1);
			
			validCheck.next().next().find('span').text(parseInt(validCheck.next().next().text())+price);
			
			sum();
		} 
		else{		
			
			var tr =							
				'<tr id="'+seq+'" data-price="'+price+'">'  
					+'<td align="center">'+state+' '+ name+'</td>'  
					+'<td ><button onclick="amountDown('+price+","+seq+')">-</button><span id="amount'+seq+'">' + 1	+ '</span><button onclick="amountUp('+price+","+seq+')">+</button></td>'  
					+'<td><span class="menuPrice" id="prices'+seq+'">'+price+'<span></td>'
					+'<td><button onclick="deleteValue('+seq+')">삭제</button></td>'
					+ '</tr>';
			$('#appendTest').append(tr);
				$('tr#'+seq).data('orderLine',{menuSeq:seq,orderState:realState, price:price});	
			sum();
		}	
		
		
	}
</script>
<!-- 기본정보 -->
<div class="align-center">
	<div align="center">

		<h2>${menuList[1].cafeName}</h2>
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
									onclick="test('${menu.menuName }',${menu.price },${menu.menuSeq}, '핫',${menu.menuState })"
									class="col-lg-3 col-md-2 published" data-placement="top"
									title="Hot선택 " data-toggle="tooltip">${menu.price }</div>

								<div
									onclick="test('${menu.menuName }',${menu.price+menu.priceAdd },${menu.menuSeq}, '아이스', ${menu.menuState })"
									class="col-lg-3 col-md-2 published" data-placement="top"
									title="Ice선택" data-toggle="tooltip">${menu.price+menu.priceAdd }</div>
							</c:if> <c:if test="${menu.menuState==0 }">
								<div align="center"
									onclick="test('${menu.menuName }',${menu.price },${menu.menuSeq}, '', ${menu.menuState })"
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
			<div>
				<label id="seatName"></label> <label id="seatSize"></label><label id="seatSeq"></label>
			</div>
			<table class="table text-center" id="table">
				<thead>
					<tr id="tr">
						<td>메뉴</td>
						<td>수량</td>
						<td>가격</td>
					</tr>
				</thead>
				<tbody id="appendTest">
				</tbody>
			</table>
		</div>
		<div align="right">
			<label id="sum">0</label>
			<button type="button"
				onclick="requestPay('${menuList[0].cafeName}','${menuList[0].adminId }');insertOrder('${menuList[0].adminId}');">
				결제</button>
			<!-- <input type="button" value="결제" id="price" /> -->
		</div>
	</div>
</div>

<script type="text/javascript">
function insertOrder(adminId){
	
	var seatSeq = $('#seatSeq').html();
	var amount =  $('#amount')
			//id="amount'+seq+'"
	var result =[];		
	var trs = $('#appendTest tr').each(function(index, item){
	var obj = $(item).data('orderLine')
	obj["orderlineAmount"] = $(item).find('span').first().html();   //수량
		result.push(obj);  //json 구조의 객체를 result배열에 담아줌.
	});		
	console.log(result);
	 $.ajax({
		url:"insertOrders",
		type: 'POST',
		contentType:'application/json',
        dataType: 'json',
        data: JSON.stringify(result), //객체를 json구조의 String으로 변환시켜줌
         success : function(data){
        	alert(data)
        } 
		
	})
} 


$('[data-toggle="tooltip"]').tooltip();

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

<script>
	        var IMP = window.IMP; // 생략가능
	        IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	//아엠포트 결제연동
	//var name= cafeName;
  function requestPay(cafeName,adminId){
	        IMP.request_pay({
	            pg : 'kakaopay',
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name : cafeName,
	            amount : $('#sum').html(),
	            buyer_email : 'yedam@ac.kr',
	            buyer_name : '서강',
	            buyer_tel : '010-1598-1521',
	            buyer_addr : '대구 곽병원',
	            buyer_postcode : '123-456',
	            //m_redirect_url : 'http://www.naver.com'
	        }, function(rsp) {
	            if ( rsp.success ) {
	                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	                jQuery.ajax({
	                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	                    type: 'POST',
	                    dataType: 'json',
	                    data: {
	                        imp_uid : rsp.imp_uid
	                        //기타 필요한 데이터가 있으면 추가 전달
	                    }
	                }).done(function(data) {
	                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	                    if ( everythings_fine ) {
	                        msg = '결제가 완료되었습니다.';
	                        msg += '\n고유ID : ' + rsp.imp_uid;
	                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                        msg += '\결제 금액 : ' + rsp.paid_amount;
	                        msg += '카드 승인번호 : ' + rsp.apply_num;
	                        
	                        alert(msg);
	                    } else {
	                        //[3] 아직 제대로 결제가 되지 않았습니다.
	                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	                    }
	                });
	                //성공시 이동할 페이지
	                location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg;
	            } else {
	                msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	                //실패시 이동할 페이지
	                location.href="<%=request.getContextPath()%>/cafeOrder?adminId="+adminId;
	                alert(msg);
	            }
	        });
	        
  }
 
</script>


