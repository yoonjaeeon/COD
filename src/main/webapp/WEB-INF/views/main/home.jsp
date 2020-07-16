<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

<div align="center" style="width: 100%; height: 1000px">
흠..
</div><%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>

 <div style="padding:300px 100px; background-color: pink;" align="center">
   <div id ="slick_list">
      <div> 		one     </div>
      <div> 		two    	</div>
      <div> 		three   </div>
      <div> 		three   </div>
      <div> 		three   </div>
   </div>
   <span class="prev" id="aro_prev2"><i class="fas fa-arrow-left"></i></span>
   <span class="next" id="aro_next2"><i class="fas fa-arrow-right"></i></span>

</div>
<script>
$('#slick_list').slick({
    autoplay : false,
    dots: false,
    speed : 300 /* 이미지가 슬라이딩시 걸리는 시간 */,
    infinite: false,
    autoplaySpeed: 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
    prevArrow: $('#aro_prev1'),
    nextArrow: $('#aro_next1'),
    arrows: true,
    slidesToShow: 5,
    slidesToScroll: 5,
    fade: false
 }); 
</script>
