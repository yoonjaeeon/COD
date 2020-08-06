<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
       <!--   <label>카페이름:</label> -->
         <input type="hidden"  class="form-control"  id="cafeName" name="cafeName" value="${getCafe.cafeName}" >
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
 
      <div class="btn-group">      
             <button type="submit" class="btn btn-primary"> 수정</button>
            <button type="reset"  class="btn btn-primary" value="초기화" id="btnInit" >초기화</button>
      </div>
   </form>
</div> 
</body>
</html>