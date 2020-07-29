<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" >        
</script>
<script>
</script>
<body>
<div class="container">
   <form action="insertCafe" id="form1" name="form1" method="post" class="form-horizontal" enctype="multipart/form-data">
      <div align="center"><h2>카페 등록 및 수정</h2></div>
      <div class="form-group">      
         <label> 관리자 아이디:</label>
         <input type="text"  class="form-control" id="id" name="adminId" value="${cafe.adminId}" readonly>
      </div>   
      <div class="form-group">
         <label>카페이름:</label>
         <input type="text"  class="form-control"  id="name" name="cafeName" value="${cafe.cafeName}">
      </div>   
      <div class="form-group">
         <label>카페주소:</label>
         <input type="text"  class="form-control" id="address" name="cafeAddress" value="${cafe.cafeAddress}">
      </div>
      <div class="form-group">
         <label>전화번호:</label>
         <input type="text"  class="form-control" id="phone" name="cafePhone" value="${cafe.cafePhone}" >
      </div>  
      <div class="form-group">
         <label>카페영업시간:</label>
         <input type="text"  class="form-control" id="time" name="cafeTime" value="${cafe.cafeTime}" >
      </div>
      <div class="form-group">
         <label>휴무일:</label>
         <input type="text"  class="form-control" id="close" name="cafeCloseday" value="${cafe.cafeCloseday}" >
      </div>
       <%--  <div class="form-group">
      <label>썸네일:</label> 
      <input type="file" id="upload" name="upload" value="${caafe.upload}"/>
     </div>  
     	<div class="form-group">
      <label>카페등록사진:</label> 
      <input multiple="multiple" type="file"  id="uploadFile" name="uploadFile" value="${cafe.uploadfile}"/>
     	</div>  --%>
      <div class="form-group">
         <label>해시테그:</label>
         <input type="text"  class="form-control" id="cafeHashtag" name="cafeHashtag" value="${cafe.cafeHashtag}" >
      </div>
      <div class="form-group">
         <label >테마:</label>
         <div class="radio">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t4" value="${cafe.cafeTheme}"  >작업하기좋은</label>
         </div>
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t5" value="${cafe.cafeTheme}" >핸드드립</label>
         </div>
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t3" value="${cafe.cafeTheme}" >야외석있는</label>
         </div>  
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t1" value="${cafe.cafeTheme}" >이색카페</label>
         </div>  
         <div class="checkbox">
            <label><input type="radio"  name="cafeTheme" id="theme" value="t2" value="${cafe.cafeTheme}" >디저트</label>
         </div>
       </div>     
        	 <br>
         <div>
         <label>문의사항:</label><br>
         <textarea rows="15" cols="40" id="cafeAskContent" name="cafeAskContent" value="${cafe.cafeAskContent}" ></textarea>
      </div><br>
         
        <div class="form-group">
         <label >wifi 여부</label>
         <div class="radio">
            <label><input type="radio"  name="wifi" id="wifi"   value="${cafe.wifi}">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="wifi" id="wifi"   value="${cafe.wifi}">No</label>
         </div>
         </div> <br>
        
         <div class="form-group">
         <label >키즈존 여부</label>
         <div class="radio">
            <label><input type="radio"  name="nokid" id="nokid"  value="${cafe.nokid}">Yes</label>
         </div>
         <div class="radio"> 
            <label><input type="radio"  name="nokid" id="nokid"   value="${cafe.nokid}">No</label>
         </div> 
         </div><br>
         
         <div class="form-group">
         <label >주차여부</label>
         <div class="radio">
            <label><input type="radio"  name="parking" id="parking"  value="${cafe.parking}">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="parking" id="parking" value="${cafe.parking}">No</label>
         </div> 
         </div><br>
         
          <div class="form-group">
         <label >반려견동반여부</label>
         <div class="radio">
            <label><input type="radio"  name="animal" id="animal"  value="${cafe.animal}">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="animal" id="animal"  value="${cafe.animal}">No</label>
         </div>
         </div> <br>
         
          <div class="form-group">
         <label >빔프로젝트 대여여부</label>
         <div class="radio">
            <label><input type="radio"  name="beam" id="beam"  value="${cafe.beam}">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="beam" id="beam" value="${cafe.beam}">No</label>
         </div> 
         </div><br>
         
          <div class="form-group">
         <label >충전기 대여여부</label>
         <div class="radio">
            <label><input type="radio"  name="charger" id="charger" value="${cafe.charger}">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="charger" id="charger" value="${cafe.charger}">No</label>
         </div>
         </div> <br>
         
             <div class="form-group">
         <label >단체석 여부</label>
         <div class="radio">
            <label><input type="radio"  name="bigSeat" id="bigSeat" value="${cafe.charger}">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="bigSeat" id="bigSeat" value="${cafe.charger}">No</label>
            
         </div> 
         </div><br>
         
         <div class="form-group">
         <label >대관여부</label>
         <div class="radio">
            <label><input type="radio"  name="lend" id="lend" value="${cafe.lend}">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="lend" id="lend" value="${cafe.lend}">No</label>
         </div>
         </div> <br>

      <div class="btn-group">      
             <input type="submit" class="btn btn-primary" value="등록"> 
           <!--  <button type="submit" data-toggle="modal" data-target="#contentModal"  class="btn btn-primary" >등록</button>  -->
            <!-- <input type="button"  class="btn btn-primary" value="수정"  id="btnUpdate" /> -->
            <input type="button"  class="btn btn-primary" value="초기화" id="btnInit" />
      </div>
   </form>
</div>      
     
  
