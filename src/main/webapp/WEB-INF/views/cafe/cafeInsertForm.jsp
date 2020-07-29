<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=094a897b2c2dd75dce40464014299bf4&libraries=services"></script>

<div class="container">
   <form action="insertCafe" id="form1" name="form1" method="post" class="form-horizontal" enctype="multipart/form-data">
      <div align="center"><h2>카페 등록 및 수정</h2></div>
      <div class="form-group">      
         <label> 관리자 아이디:</label>
         <input type="text"  class="form-control" id="id" name="adminId" value="${sessionScope.adminId}" readonly>
      </div>   
      <div class="form-group">
         <label>카페이름:</label>
         <input type="text"  class="form-control"  id="name" name="cafeName" >
      </div>   
      <div class="form-group">
         <label>카페주소:</label>
         <div class="row">
         <input type="text"  class="form-control col-9" id="address" name="cafeAddress" >
         <input type="button" class="col-3" id="adressSearch" value="검색">
         
         </div>
      </div>
      <div class="form-group">
         <label>전화번호:</label>
         <input type="text"  class="form-control" id="phone" name="cafePhone" >
      </div>  
      <div class="form-group">
         <label>카페영업시간:</label>
         <input type="text"  class="form-control" id="time" name="cafeTime" >
      </div>
      <div class="form-group">
         <label>휴무일:</label>
         <input type="text"  class="form-control" id="close" name="cafeCloseday" >
      </div>
        <div class="form-group">
      <label>썸네일:</label> 
      <input type="file" id="upload" name="upload"/>
     </div>  
     	<div class="form-group">
      <label>카페등록사진:</label> 
      <input multiple="multiple" type="file"  id="uploadFile" name="uploadFile"/>
     	</div> 
      <div class="form-group">
         <label>해시테그:</label>
         <input type="text"  class="form-control" id="cafeHashtag" name="cafeHashtag" >
      </div>
      <div class="form-group">
         <label >테마:</label>
         <div class="radio">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t4" checked="checked" >작업하기좋은</label>
         </div>
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t5">핸드드립</label>
         </div>
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t3">야외석있는</label>
         </div>  
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t1">이색카페</label>
         </div>  
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t2">디저트</label>
         </div>
       </div>     
        	 <br>
         <div>
         <label>문의사항:</label><br>
         <textarea rows="15" cols="40" id="cafeAskContent" name="cafeAskContent"></textarea>
      </div><br>
         
        <div class="form-group">
         <label >wifi 여부</label>
         <div class="radio">
            <label><input type="radio"  name="wifi" id="wifi" value="1" checked="checked">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="wifi" id="wifi"  value="0">No</label>
         </div>
         </div> <br>
        
         <div class="form-group">
         <label >키즈존 여부</label>
         <div class="radio">
            <label><input type="radio"  name="nokid" id="nokid" value="1" checked="checked">Yes</label>
         </div>
         <div class="radio"> 
            <label><input type="radio"  name="nokid" id="nokid"  value="0">No</label>
         </div> 
         </div><br>
         
         <div class="form-group">
         <label >주차여부</label>
         <div class="radio">
            <label><input type="radio"  name="parking" id="parking" value="1" checked="checked">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="parking" id="parking" value="0">No</label>
         </div> 
         </div><br>
         
          <div class="form-group">
         <label >반려견동반여부</label>
         <div class="radio">
            <label><input type="radio"  name="animal" id="animal" value="1" checked="checked">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="animal" id="animal" value="0">No</label>
         </div>
         </div> <br>
         
          <div class="form-group">
         <label >빔프로젝트 대여여부</label>
         <div class="radio">
            <label><input type="radio"  name="beam" id="beam"  value="1" checked="checked">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="beam" id="beam" value="0">No</label>
         </div> 
         </div><br>
         
          <div class="form-group">
         <label >충전기 대여여부</label>
         <div class="radio">
            <label><input type="radio"  name="charger" id="charger" value="1" checked="checked">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="charger" id="charger" value="0">No</label>
         </div>
         </div> <br>
         
             <div class="form-group">
         <label >단체석 여부</label>
         <div class="radio">
            <label><input type="radio"  name="bigSeat" id="bigSeat" value="1" checked="checked">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="bigSeat" id="bigSeat" value="0">No</label>
            
         </div> 
         </div><br>
         
         <div class="form-group">
         <label >대관여부</label>
         <div class="radio">
            <label><input type="radio"  name="lend" id="lend" value="1" checked="checked">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="lend" id="lend" value="0">No</label>
         </div>
         </div> <br>
         <input type="hidden" name="cafeX">
		 <input type="hidden" name="cafeY">	
      <div class="btn-group">      
             <input type="submit" class="btn btn-primary" value="등록"> 
           <!--  <button type="submit" data-toggle="modal" data-target="#contentModal"  class="btn btn-primary" >등록</button>  -->
            <!-- <input type="button"  class="btn btn-primary" value="수정"  id="btnUpdate" /> -->
            <input type="button"  class="btn btn-primary" value="초기화" id="btnInit" />
      </div>
   </form>
</div>      


<script>
	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	
    $('body').on('click', '#adressSearch', function() {
    	new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        var result = results[0]; //첫번째 결과의 값을 활용
                        var coords = new daum.maps.LatLng(result.y, result.x);

                        console.log(result.y);
                        console.log(result.x);
                        
                        $('input:hidden[name="cafeY"]').val(result.y);
                        $('input:hidden[name="cafeX"]').val(result.x);
                        /* document.getElementById("cafeY").text(result.y);
                        document.getElementById("cafeX").text(result.x);
 */
                    }
                });
            }
        }).open();
	}); 

</script>
  
  
  
