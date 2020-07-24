<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" >
 
/* 모달 */


/* 	$(function() {
		$('#contentModal').on('shown.bs.modal', function() {
			$('#myInput').trigger('focus');
			console.log($('#name').html($('#name').val()));
		})

		$()
	});
	 */

</script>


<!-- Modal -->
<div class="modal fade" id="contentModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">선택목록</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			
				카페이름:<span id="name"></span><br>
				카페주소:<span id="address"></span><br>
				전화번호:<span id="phone"></span><br>
				카페영업시간:<span id="time"></span><br>
				휴무일:<span id="close"></span><br>
				썸네일:<span id="uploadfile"></span><br>
				해시테그:<span id="hashtag"></span><br>
				테마:<span id="theme">
				<c:if test="form1.theme.value = t1">이색카페</c:if>
				<c:if test="form1.theme.value = t2">디저트카페</c:if>
				<c:if test="form1.theme.value = t3">야외카페</c:if>
				<c:if test="form1.theme.value = t4">작업하기좋은카페</c:if>
				<c:if test="form1.theme.value = t5">핸드드립카페</c:if>
				</span><br>
				문의사항:<span id="contents"></span><br>
				wifi:<span id="wifi"></span><br>
				키즈존여부:<span id="nokid"></span><br>
				주차장여부:<span id="parking"></span><br>
				반려견동반여부:<span id="anlmal"></span><br>
				빔프로젝트여부:<span id="beam"></span><br>
				충전기여부:<span id="charger"></span><br>
				단체석여부:<span id="big"></span><br>
				대관여부:<span id="lend"></span><br>
				
				
				<%-- ${messageTitle } <br>
				${getMessageContent}fff --%>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>
 <script>
 $('#contentModal').on('show.bs.modal', function (e) {
		$.ajax({
			url : 'cafeInsertForm',  
			method:'post',
			data : $("#form1").serialize(),
			dataType :'json',
			success:function(data){
				if(data == null){
					alert("data=0");
					data=0;
				}else{
					$('#name').html($('#name').val());
					$('#messageCount').load("getMessageCount");
				}
			}
		})

	})         
</script>

  


</head>
<body>
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
         <input type="text"  class="form-control" id="address" name="cafeAddress" >
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

      <div class="btn-group">      
             <input type="submit" class="btn btn-primary" value="등록"> 
           <!--  <button type="submit" data-toggle="modal" data-target="#contentModal"  class="btn btn-primary" >등록</button>  -->
            <!-- <input type="button"  class="btn btn-primary" value="수정"  id="btnUpdate" /> -->
            <input type="button"  class="btn btn-primary" value="초기화" id="btnInit" />
      </div>
   </form>
</div>      
     
  
