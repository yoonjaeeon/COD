<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<body>
<div class="container">
   <form action="insertCafeMenu" id="form1" name="form1"  class="form-horizontal">
      <div align="center"><h2>메뉴 등록 및 수정</h2></div>
      <div class="form-group">      
         <label> 관리자 아이디:</label>
         <input type="text"  class="form-control" name="id" value="${sessionScope.adminId}" readonly>
      </div>   
      <div class="form-group">      
         <label> 메뉴번호:</label>
         <input type="text"  class="form-control" name="id" value="${sessionScope.adminId}" readonly>
      </div>   
      <div class="form-group">
         <label>메뉴분류:</label>
         <input type="text"  class="form-control"  name="name" >
      </div>
       <div class="form-group">
         <label>메뉴명:</label>
         <input type="text"  class="form-control"  name="hashtag" >
      </div>   
      <div class="form-group">
         <label>단가:</label>
         <input type="text"  class="form-control"  name=address" >
      </div></br>
      <div class="form-group">
         <label>인기메뉴:</label>
         <input type="text"  class="form-control"  name="time" >
      </div></br>
       <div class="form-group">
         <label>추가금액:</label>
         <input type="text"  class="form-control"  name="hashtag" >
      </div>
       <div class="form-group">
         <label>신메뉴:</label>
         <input type="text"  class="form-control"  name="hashtag" >
      </div>
        <div class="form-group">
         <label >시그니여부</label>
         <div class="radio">
            <label><input type="radio"  name="parking"  value="Yes">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="parking"  value="No">No</label>
         </div> 
         </div><br> 
      
        <div class="form-group">
         <label >메뉴상태</label>
         <div class="radio">
            <label><input type="radio"  name="parking"  value="hot">Hot</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="parking"  value="ice">Ice</label>
         </div> 
         </div><br>      

      <div class="btn-group">      
            <input type="submit"  class="btn btn-primary" value="등록" /> 
            <input type="button"  class="btn btn-primary" value="수정"  id="btnUpdate" />
            <input type="button"  class="btn btn-primary" value="초기화" id="btnInit" />
      </div>
   </form>
</div>      
     
  
