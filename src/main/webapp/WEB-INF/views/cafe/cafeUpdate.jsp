<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=094a897b2c2dd75dce40464014299bf4&libraries=services"></script>

</head>
<body>
<div class="container">
   <form action="cafeUpdate" id="form1" name="form1" method="post" class="form-horizontal" enctype="multipart/form-data">
      <div align="center"><h2>카페 수정</h2></div>
      <div class="form-group">      
         <!-- <label> 관리자 아이디:</label> -->
         <input type="hidden"  class="form-control" id="id" name="adminId" value="${sessionScope.adminId}">
      </div>  
        <div class="form-group">
         <label>사업자번호:</label>
          <div class="row">
         <input type="text"  class="form-control col-9"  id="cafeBn" name="cafeBn" value="${getCafe.cafeBn}" >
         <input type="button" class="col-3" id="bnSearch" value="검색">
      </div>  
      </div> 
      <div class="form-group">
         <label>카페이름:</label> 
         <input type="text"  class="form-control"  id="cafeName" name="cafeName" value="${getCafe.cafeName}" >
      </div>   
 		<div class="form-group">
         <label>카페주소:</label>
         <div class="row">
         <input type="text"  class="form-control col-9" id="address" name="cafeAddress"   value="${getCafe.cafeAddress}" >
         <input type="button" class="col-3" id="adressSearch" value="검색">
         </div>
      </div>
      <div class="form-group">
         <label>전화번호:</label>
         <input type="text"  class="form-control" id="phone" name="cafePhone" value="${getCafe.cafePhone}" >
      </div>  
      <div class="form-group">
         <label>카페영업시간:</label>
         <input type="text"  class="form-control" id="time" name="cafeTime" value="${getCafe.cafeTime}" >
      </div>
      <div class="form-group">
         <label>휴무일:</label>
         <input type="text"  class="form-control" id="close" name="cafeCloseday" value="${getCafe.cafeCloseday}" >
      </div>
        <div class="form-group">
      <label>썸네일:</label> <br><br>
      <img src="resources/upload/${getCafe.cafeThumbnail}"style="width: 350px"/><br><br>
     <input type="file" id="upload" name="upload"/>
     </div>   
        <div class="form-group">
      <label>카페등록사진:</label><br>
      <c:forEach items="${fileList}" var="file">
   		<img src="resources/upload/${file.photoName}"style="width: 300px"/><br>
 	  </c:forEach> 
      <input multiple="multiple" type="file"  id="uploadFile" name="uploadFile"/>
        </div> 
      <div class="form-group">
         <label>해시테그:</label>
         <input type="text"  class="form-control" id="cafeHashtag" name="cafeHashtag" value="${getCafe.cafeHashtag}" >
      </div>
      
      <div class="form-group">
         <label >테마:</label>
         <c:if test="${getCafe.cafeTheme == 't4'}">
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t4" checked="checked" >작업하기좋은</label>
         </div>
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t5" >핸드드립</label>
         </div>
          <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t3" >야외석있는</label>
         </div> 
          <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t1" >이색카페</label>
         </div>
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t2" >디저트</label>
         </div>
         </c:if>
         <c:if test="${getCafe.cafeTheme=='t5'}">
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t4"  >작업하기좋은</label>
         </div>
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t5" checked="checked">핸드드립</label>
         </div>
          <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t3">야외석있는</label>
         </div> 
          <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t1">이색카페</label>
         </div>
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t2" >디저트</label>
         </div>
         </c:if>
         <c:if test="${getCafe.cafeTheme=='t3'}">
        <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t4" >작업하기좋은</label>
         </div>
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t5" >핸드드립</label>
         </div>
          <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t3" checked="checked">야외석있는</label>
         </div> 
          <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t1" >이색카페</label>
         </div>
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t2" >디저트</label>
         </div>
         </c:if>
         <c:if test="${getCafe.cafeTheme=='t1'}"> 
          <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t4" >작업하기좋은</label>
         </div>
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t5" >핸드드립</label>
         </div>
          <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t3" >야외석있는</label>
         </div> 
          <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t1" checked="checked">이색카페</label>
         </div>
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t2" >디저트</label>
         </div>
         </c:if>
         <c:if test="${getCafe.cafeTheme=='t2'}"> 
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t4">작업하기좋은</label>
         </div>
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t5" >핸드드립</label>
         </div>
          <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t3" >야외석있는</label>
         </div> 
          <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t1" >이색카페</label>
         </div>
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t2" checked="checked">디저트</label>
         </div>
         </c:if>
       </div>     
            <br>
             
        <div class="row">
      		<div class="col-3">   
        <div class="form-group">
	         <label >wifi 여부</label>
	         <c:if test="${getCafe.wifi==1}">
	          <div class="radio">
	            <label><input type="radio"  name="wifi" id="wifi" value="1" checked="checked">Yes</label>
	            </div>
	            <div>
	            <label><input type="radio"  name="wifi" id="wifi"  value="0">No</label>
	            </div>
	            </c:if>
	            <c:if test="${getCafe.wifi==0}">
	           <div class="radio">
	            <label><input type="radio"  name="wifi" id="wifi" value="1">Yes</label>
	            </div>
	            <div>
	            <label><input type="radio"  name="wifi" id="wifi"  value="0" checked="checked">No</label>
	            </div>
	            </c:if>
         </div> <br>
        </div>
      <div class="col-3">   
        <div class="form-group">
	         <label >노키즈존 여부</label>
	         <c:if test="${getCafe.nokid==1}">
	          <div class="radio">
	            <label><input type="radio"  name="nokid" id="nokid" value="1" checked="checked">Yes</label>
	            </div>
	            <div>
	            <label><input type="radio"  name="nokid" id="nokid"  value="0">No</label>
	            </div>
	            </c:if>
	            <c:if test="${getCafe.nokid==0}">
	           <div class="radio">
	            <label><input type="radio"  name="nokid" id="nokid" value="1">Yes</label>
	            </div>
	            <div>
	            <label><input type="radio"  name="nokid" id="nokid"  value="0" checked="checked">No</label>
	            </div>
	            </c:if>
         </div> <br>
        </div>
        
          <div class="col-3">   
        <div class="form-group">
	         <label >주차여부</label>
	         <c:if test="${getCafe.parking==1}">
	          <div class="radio">
	            <label><input type="radio"  name="parking" id="parking" value="1" checked="checked">Yes</label>
	            </div>
	            <div>
	            <label><input type="radio"  name="parking" id="parking"  value="0">No</label>
	            </div>
	            </c:if>
	            <c:if test="${getCafe.parking==0}">
	           <div class="radio">
	            <label><input type="radio"  name="parking" id="parking" value="1">Yes</label>
	            </div>
	            <div>
	            <label><input type="radio"  name="parking" id="parking"  value="0" checked="checked">No</label>
	            </div>
	            </c:if>
         </div> <br>
        </div>
        
        <div class="col-3">   
        <div class="form-group">
	         <label >반려견동반여부</label>
	         <c:if test="${getCafe.animal==1}">
	          <div class="radio">
	            <label><input type="radio"  name="animal" id="animal" value="1" checked="checked">Yes</label>
	            </div>
	            <div>
	            <label><input type="radio"  name="animal" id="animal"  value="0">No</label>
	            </div>
	            </c:if>
	            <c:if test="${getCafe.animal==0}">
	           <div class="radio">
	            <label><input type="radio"  name="animal" id="animal" value="1">Yes</label>
	            </div>
	            <div>
	            <label><input type="radio"  name="animal" id="animal"  value="0" checked="checked">No</label>
	            </div>
	            </c:if>
         </div> <br>
        </div>
        
       <div class="col-3">   
        <div class="form-group">
	         <label >빔프로젝트 대여여부</label>
	         <c:if test="${getCafe.beam==1}">
	          <div class="radio">
	            <label><input type="radio"  name="beam" id="beam" value="1" checked="checked">Yes</label>
	            </div>
	            <div>
	            <label><input type="radio"  name="beam" id="beam"  value="0">No</label>
	            </div>
	            </c:if>
	            <c:if test="${getCafe.beam==0}">
	           <div class="radio">
	            <label><input type="radio"  name="beam" id="beam" value="1">Yes</label>
	            </div>
	            <div>
	            <label><input type="radio"  name="beam" id="beam"  value="0" checked="checked">No</label>
	            </div>
	            </c:if>
         </div> <br>
        </div>
        
		   <div class="col-3">   
        <div class="form-group">
	         <label >충전기 대여여부</label>
	         <c:if test="${getCafe.charger==1}">
	          <div class="radio">
	            <label><input type="radio"  name="charger" id="charger" value="1" checked="checked">Yes</label>
	            </div>
	            <div>
	            <label><input type="radio"  name="charger" id="charger"  value="0">No</label>
	            </div>
	            </c:if>
	            <c:if test="${getCafe.charger==0}">
	           <div class="radio">
	            <label><input type="radio"  name="charger" id="charger" value="1">Yes</label>
	            </div>
	            <div>
	            <label><input type="radio"  name="charger" id="charger"  value="0" checked="checked">No</label>
	            </div>
	            </c:if>
         </div> <br>
        </div>
        
           <div class="col-3">   
        <div class="form-group">
	         <label >단체석 여부</label>
	         <c:if test="${getCafe.bigSeat==1}">
	          <div class="radio">
	            <label><input type="radio"  name="bigSeat" id="bigSeat" value="1" checked="checked">Yes</label>
	            </div>
	            <div>
	            <label><input type="radio"  name="bigSeat" id="bigSeat"  value="0">No</label>
	            </div>
	            </c:if>
	            <c:if test="${getCafe.bigSeat==0}">
	           <div class="radio">
	            <label><input type="radio"  name="bigSeat" id="bigSeat" value="1">Yes</label>
	            </div>
	            <div>
	            <label><input type="radio"  name="bigSeat" id="bigSeat"  value="0" checked="checked">No</label>
	            </div>
	            </c:if>
         </div> <br>
        </div>
         
      <div class="col-3">   
        <div class="form-group">
	         <label >대관 여부</label>
	         <c:if test="${getCafe.lend==1}">
	          <div class="radio">
	            <label><input type="radio"  name="lend" id="lend" value="1" checked="checked">Yes</label>
	            </div>
	            <div>
	            <label><input type="radio"  name="lend" id="lend"  value="0">No</label>
	            </div>
	            </c:if>
	            <c:if test="${getCafe.lend==0}">
	           <div class="radio">
	            <label><input type="radio"  name="lend" id="lend" value="1">Yes</label>
	            </div>
	            <div>
	            <label><input type="radio"  name="lend" id="lend"  value="0" checked="checked">No</label>
	            </div>
	            </c:if>
         </div> <br>
        </div>
      <div class="btn-group">      
               <button type="button" class="btn btn-primary" onclick="cafeInsert()">재등록</button>
            
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
  <script type="text/javascript">
	function cafeInsert(){
		if ($('[name=cafeName]').val() == ""|| $('[name=cafeName]').val() == null){
			alert("카페이름이 입력되지 않았습니다.");
			$('[name=cafeName]').focus();
		}else if($('[name=cafeAddress]').val() == ""|| $('[name=cafeAddress]').val() == null){
			alert("카페주소가 입력되지 않았습니다.");
			$('[name=cafeAddress]').focus();
		  /* }else if($('[name=upload]').val() == ""|| $('[name=upload]').val() == null){
			alert("카페 썸네일이 입력되지 않았습니다.");
			$('[name=upload]').focus();	 
		 }else if($('[name=uploadFile]').val() == ""|| $('[name=uploadFile]').val() == null){
			alert("카페 상세사진이 입력되지 않았습니다.");
			$('[name=uploadFile]').focus();  */ 
		}else{	
			alert("카페등록이 완료 되었습니다.");
			form1.submit();
			return;
		
		}
	}

</script>
<script type="text/javascript">
$('body').on('click', '#bnSearch', function() {
	window.open('https://www.hometax.go.kr/websquare/websquare.wq?w2xPath=/ui/pp/index_pp.xml&tmIdx=1&tm2lIdx=0108000000&tm3lIdx=0108010000')
});
</script>
</body>
</html>