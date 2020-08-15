<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" >
window.addEventListener("load", function(){
	back.addEventListener("click",backF);
})
function backF(){
	location.href="adminListForm"
}
</script>

<body>
<div class="container">
   <form action="cafeList" id="form1" name="form1" method="post" class="form-horizontal" enctype="multipart/form-data">
      <div align="center"><h2>카페 확인</h2></div>
      <div class="form-group">      
         <label> 관리자 아이디:</label>
         <input type="text"  class="form-control" id="id" name="adminId" value="${cafeList.adminId}" readonly>
      </div>   
       <div class="form-group">
         <label>사업자번호:</label><span id="saup" style="color:red"></span>
          <div class="row">
         <input type="text"  class="form-control col-9"  id="cafeBn" name="cafeBn" value="${cafeList.cafeBn}" >
         <input type="button" class="col-3" id="bnSearch" value="검색">
      </div>
      <div class="form-group">
         <label>카페이름:</label>
         <input type="text"  class="form-control"  id="name" name="cafeName" value="${cafeList.cafeName}">
      </div>   
      <div class="form-group">
         <label>카페주소:</label>
         <input type="text"  class="form-control" id="address" name="cafeAddress" value="${cafeList.cafeAddress}">
      </div>
      <div class="form-group">
         <label>전화번호:</label>
         <input type="text"  class="form-control" id="phone" name="cafePhone" value="${cafeList.cafePhone}" >
      </div>  
      <div class="form-group">
         <label>카페영업시간:</label>
         <input type="text"  class="form-control" id="time" name="cafeTime" value="${cafeList.cafeTime}" >
      </div>
      <div class="form-group">
         <label>휴무일:</label>
         <input type="text"  class="form-control" id="close" name="cafeCloseday" value="${cafeList.cafeCloseday}" >
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
         <input type="text"  class="form-control" id="cafeHashtag" name="cafeHashtag" value="${cafeList.cafeHashtag}"/>
     
       </div>     
        	 <br>
         <div>
         <label>문의사항:</label><br>
         <textarea rows="15" cols="40" id="cafeAskContent" name="cafeAskContent">${cafeList.cafeAskContent}</textarea>
      </div><br>


      <div class="btn-group">      
             <input type="button" class="btn btn-primary" value="확인" id="back"> 
           <!--  <button type="submit" data-toggle="modal" data-target="#contentModal"  class="btn btn-primary" >등록</button>  -->
            <!-- <input type="button"  class="btn btn-primary" value="수정"  id="btnUpdate" /> -->
         
      </div>
   </form>
</div>      
   <script type="text/javascript">
   /* 사업자번호 조회 */
$('body').on('click', '#bnSearch', function() {
	var value = $('#cafeBn').val();
	$.ajax( {
		url : "checkBus",
		data :  {value : value},
		success : function(datas){
			console.log( $(datas).find("smpcBmanTrtCntn").text());
			$('#saup').text($(datas).find("smpcBmanTrtCntn").text());
			
		}
	})
});
</script>  
  
