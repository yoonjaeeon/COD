<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" >
	$(function(){
		UP();
		T1();
		T2();
		T3();	
		T4();
		T5();		
	});
	
	function T1() {
		//테마1
		$('body').on('click','#iconT1',function(){
			if(result) {
				$.ajax({
					url:'theme/t1'
					type:'SELECT',
					contentType:'application/json;charset=utf-8',
					dataType:'json',
					error:function(xhr,status,msg){
						console.log("상태값 :" + status + " Http에러메시지 :"+msg);
					}, success:function(xhr) {
						console.log(xhr.result);
						userList();
					}
				});      }//if
		}); //삭제 버튼 클릭
	}//userDelete
	//사용자 목록 조회 요청
	function userList() {
		$.ajax({
			url:'users',
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:userListResult
		});
	}//userList
	
	//사용자 목록 조회 응답
	function userListResult(data) {

		$.each(data,function(idx,item){
			htmls += "<header class='row align-center'><div class='col-6'>";
			htmls += "<h3>" + result[comment].hashtag + "#해쉬태그</h3></div>";
			htmls += "<div class='col-6'>"+"<i class='far fa-heart' style='font-size:24px;'></i><h2>"+result[comment].stars+"</h2></div>";
			htmls += "</header> <h2 class='margin1'><a href="+'주소값'+">"+ '카페명' + "</a> </h2>";
			htmls += "<a href='#' class='image'> <img src='resources/images/main2.jpg' alt=''></a></article></div>";	
		});
		$("#ThemaListView").html(htmls);
	}//userListResult
</script>




<!-- 테마 아이콘  -->
<div class="main_feature text-center">
	<div class="icon_slick">
		<div class="single_feature" id="iconT">
			<div class="single_feature_icon">
				<i class="far fa-thumbs-up"></i>
			</div>
			<h4>COD 추천 카페</h4>
		</div>
		<div class="single_feature" id="iconT1">
			<div class="single_feature_icon">
				<i class="fab fa-fort-awesome"></i>
			</div>
			<h4>이색 카페</h4>
		</div>
		<div class="single_feature" id="iconT2">
			<div class="single_feature_icon">
				<i class="fas fa-birthday-cake"></i>
			</div>
			<h4>디저트 맛집</h4>
		</div>
		<div class="single_feature" id="iconT3">
			<div class="single_feature_icon">
				<i class="fab fa-envira"></i>
			</div>
			<h4>야외석 있는</h4>
		</div>
		<div class="single_feature" id="iconT4">
			<div class="single_feature_icon">
				<i class="fas fa-laptop"></i>
			</div>
			<h4>작업하기 좋은</h4>
		</div>
		<div class="single_feature" id="iconT5">
			<div class="single_feature_icon">
				<i class="fas fa-coffee"></i>
			</div>
			<h4>핸드 드립</h4>
		</div>
	</div>
</div>
<div id="listpage">
	<section class="posts">
		<article class="mini-post" id="ThemaListView">
		
		</article>
		<%-- <c:forEach begin="0" end="3">
			<article class="mini-post">
				<header class="row align-center">
					<div class="col-6">
						<h3>#해쉬태그</h3>
					</div>
					<div class="col-6">
						<i class='far fa-heart' style='font-size:24px;'></i>
			            <h2>4.3</h2>
					</div>
				</header>
				<h2 class="margin1">
					<a href="#">yedam Cafe</a>
				</h2>

				<a href="#" class="image"> <img src="resources/images/main2.jpg"
					alt=""></a>
			</article>
		</c:forEach> --%>
	</section>
</div>
<script>
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