<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
   function test(obj) {
      var atid = obj.getAttribute('atrid')
      console.log(atid)

      $.ajax({
         url : "menuList/" + menuName,
         success : function(result) {
            result.menuName;
            result.price;
         }
      });
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
               <c:forEach begin="0" end="4">
                  <li atrid='aa' onclick="test(this)" class="list-group-item row"><div
                        class="col-lg-6 col-md-8 published" atrid='ddd'>아메리카노</div>
                     <div class="col-lg-3 col-md-2 published">2000</div>
                     <div class="col-lg-3 col-md-2 published">2500</div></li>
               </c:forEach>
            </ul>
         </article>
      </section>
      <br>
      <br>
      <br>

      <div class="container" id="showResult">
         <h2>주문확인</h2>
         <table class="table text-center">
            <thead>
               <tr>
                  <td>메뉴</td>
                  <td>수량</td>
                  <td>좌석번호</td>
                  <td>가격</td>
               </tr>
               <tr>
                  <td id="test">아메리카노</td>
                  <td>1</td>
                  <td>t1</td>
                  <td>2500</td>
            </thead>
         </table>
      </div>
      </table>
      <div align="right">
         <input type="button" value="결제" id="price" />
      </div>
   </div>
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

