<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=094a897b2c2dd75dce40464014299bf4&libraries=services"></script>

<div class="container">
   <form action="insertCafe" id="form1" name="form1" method="post" class="form-horizontal" enctype="multipart/form-data">
      <div align="center">
      <h2>카페 등록</h2></div>
      <div class="form-group">      
        <!--  <label> 관리자 아이디:</label> -->
         <input type="hidden"  class="form-control" id="id" name="adminId" value="${sessionScope.adminId}" readonly>
      </div>
          <div class="form-group">
         <label>사업자번호:</label>
         <input type="text"  class="form-control"  id="cafeBn" name="cafeBn" maxlength="12" placeholder="000-00-00000" >
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
      <div class="form-group" >
         <label>전화번호:</label>
         <input type="text"  class="form-control" id="phone" name="cafePhone" maxlength="13" placeholder="010-0000-0000" >
      </div>  
      <div class="form-group">
         <label>카페영업시간:</label>
         <input type="text"  class="form-control" id="time" name="cafeTime" >
      </div>
      <div class="form-group">
         <label>휴무일:</label>
         <input type="text"  class="form-control" id="close" name="cafeCloseday" >
      </div>
      	<label>썸네일:</label> 
	<div class="custom-file mb-3">
	      <input type="file" class="custom-file-input" id="upload" name="upload">
	      <label class="custom-file-label" for="customFile"> 파일을 선택해 주세요 </label>
    </div>
      <br>
        <label>카페상세사진:</label> 
      <div class="custom-file mb-3">
	      <input multiple="multiple" type="file" class="custom-file-input" id="uploadFile" name="uploadFile">
	      <label class="custom-file-label" for="customFile"> 파일을 선택해 주세요 </label>
      </div>
      <div class="form-group">
         <label>해시테그:</label>
         <input type="text"  class="form-control" id="cafeHashtag" name="cafeHashtag" >
      </div>
      <div class="form-group">
         <label >테마:</label>
         <div class="row">
         <div class="radio col-4">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t4" checked="checked" >작업하기좋은</label>
         </div>
         <div class="checkbox col-4">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t5">핸드드립</label>
         </div>
         <div class="checkbox col-4">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t3">야외석있는</label>
         </div>  
         <div class="checkbox col-4">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t1">이색카페</label>
         </div>  
         <div class="checkbox col-4">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t2">디저트</label>
         </div>
       </div>
       </div>
            <br>
         <div>
         <label>문의사항:</label><br>
         <textarea rows="15" cols="40" id="cafeAskContent" name="cafeAskContent" style=" width: 100%; height: 150px"></textarea>
      </div><br>
      <div class="row">
            <div class="col-3">
            <div class="form-group">
               <label >wifi 여부</label>
               <div class="radio">
                  <label><input type="radio"  name="wifi" id="wifi" value="1" >Yes</label>
             </div>
               
            <div class="radio">
                  <label><input type="radio"  name="wifi" id="wifi"  value="0" checked="checked">No</label>
             </div>
             </div><br>
           </div>
           <div class="col-3">
            <div class="form-group">
            <label >노키즈존 여부</label>
            <div class="radio">
               <label><input type="radio"  name="nokid" id="nokid" value="1" >Yes</label>
            </div>
            <div class="radio"> 
               <label><input type="radio"  name="nokid" id="nokid"  value="0" checked="checked">No</label>
            </div> 
            </div><br>
            </div>
            <div class="col-3">
               <div class="form-group">
               <label >주차여부</label>
               <div class="radio">
                  <label><input type="radio"  name="parking" id="parking" value="1" >Yes</label>
               </div>
               <div class="radio">
                  <label><input type="radio"  name="parking" id="parking" value="0" checked="checked">No</label>
               </div> 
               </div><br>
            </div>
            <div class="col-3">
               <div class="form-group">
               <label >반려견동반여부</label>
               <div class="radio">
                  <label><input type="radio"  name="animal" id="animal" value="1" >Yes</label>
               </div>
               <div class="radio">
                  <label><input type="radio"  name="animal" id="animal" value="0" checked="checked">No</label>
               </div>
               </div> <br>
            </div>
            <div class="col-3">
             <div class="form-group">
            <label >빔프로젝트 대여여부</label>
               <div class="radio">
                  <label><input type="radio"  name="beam" id="beam"  value="1" >Yes</label>
               </div>
               <div class="radio">
                  <label><input type="radio"  name="beam" id="beam" value="0" checked="checked">No</label>
               </div> 
               </div><br>
            </div>
            <div class="col-3">
                <div class="form-group">
               <label >충전기 대여여부</label>
               <div class="radio">
                  <label><input type="radio"  name="charger" id="charger" value="1" >Yes</label>
               </div>
               <div class="radio">
                  <label><input type="radio"  name="charger" id="charger" value="0" checked="checked">No</label>
               </div>
               </div> <br>
            </div>
            <div class="col-3">
                <div class="form-group">
               <label >단체석 여부</label>
               <div class="radio">
                  <label><input type="radio"  name="bigSeat" id="bigSeat" value="1">Yes</label>
               </div>
               <div class="radio">
                  <label><input type="radio"  name="bigSeat" id="bigSeat" value="0"  checked="checked">No</label>
               </div> 
               </div><br>
            </div>
            <div class="col-3">
               <div class="form-group">
               <label >대관여부</label>
               <div class="radio">
                  <label><input type="radio"  name="lend" id="lend" value="1" >Yes</label>
               </div>
               <div class="radio">
                  <label><input type="radio"  name="lend" id="lend" value="0" checked="checked">No</label>
               </div>
            </div>
            </div> <br>
         </div>
      <input type="hidden" name="cafeX">
      <input type="hidden" name="cafeY">   
      <div align="center">      
            <button type="button" class="btn btn-outline-info" onclick="cafeInsert()">등록</button>
            <input type="button"  class="btn btn-outline-info" value="초기화" id="btnInit" />
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
                        }
                });
            }
        }).open();
   }); 

</script>
  <script type="text/javascript">
   function cafeInsert(){
      if ($('[name=cafeBn]').val() ==""|| $('[name=cafeBn]').val() == null){
         alert("사업자 번호가 입력되지 않았습니다.");         
         $('[name=cafeBn]').focus();
      }else if($('[name=cafeName]').val() == ""|| $('[name=cafeName]').val() == null){
         alert("카페이름이 입력되지 않았습니다.");
         $('[name=cafeName]').focus();
      }else if($('[name=cafeAddress]').val() == ""|| $('[name=cafeAddress]').val() == null){
         alert("카페주소가 입력되지 않았습니다.");
         $('[name=cafeAddress]').focus();
       } else if($('[name=upload]').val() == ""|| $('[name=upload]').val() == null){
         alert("카페 썸네일이 입력되지 않았습니다.");
         $('[name=upload]').focus();    
       }else if($('[name=uploadFile]').val() == ""|| $('[name=uploadFile]').val() == null){
         alert("카페 상세사진이 입력되지 않았습니다.");
         $('[name=uploadFile]').focus(); 
      
       }else{   
         alert("카페등록이 완료 되었습니다.");
         form1.submit();
         return;
      }
   }

    var autoHypenPhone = function(str){
          str = str.replace(/[^0-9]/g, '');
          var tmp = '';
          if( str.length < 4){
              return str;
          }else if(str.length < 7){
              tmp += str.substr(0, 3);
              tmp += '-';
              tmp += str.substr(3);
              return tmp;
          }else if(str.length < 11){
              tmp += str.substr(0, 3);
              tmp += '-';
              tmp += str.substr(3, 3);
              tmp += '-';
              tmp += str.substr(6);
              return tmp;
          }else{              
              tmp += str.substr(0, 3);
              tmp += '-';
              tmp += str.substr(3, 4);
              tmp += '-';
              tmp += str.substr(7);
              return tmp;
          }

          return str;
      }


      var phone = document.getElementById('phone');

      phone.onkeyup = function(){
      console.log(this.value);
      this.value = autoHypenPhone( this.value ) ;  
      }
      
      
      var autoHypenCafeBn = function(str){
          str = str.replace(/[^0-9]/g, '');
          var tmp = '';
          if( str.length < 4){
              return str;
          }else if(str.length < 5){
              tmp += str.substr(0, 3);
              tmp += '-';
              tmp += str.substr(3);
              return tmp;
          }else{              
              tmp += str.substr(0, 3);
              tmp += '-';
              tmp += str.substr(3, 2);
              tmp += '-';
              tmp += str.substr(5);
              return tmp;
          }

          return str;
      }
      var phone = document.getElementById('cafeBn');
      cafeBn.onkeyup = function(){
      console.log(this.value);
      this.value = autoHypenCafeBn( this.value ) ;  
      } 

	   $(".custom-file-input").on("change", function() {
	     var fileName = $(this).val().split("\\").pop();
	     $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	   });

</script>
  
  