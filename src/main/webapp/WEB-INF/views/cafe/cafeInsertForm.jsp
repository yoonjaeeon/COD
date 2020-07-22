<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<script type="text/javascript" >
$(function(){
      init();
 
      cafeList();

      cafeSelect();
      
      cafeDelete();
      
      cafeInsert();
   
      cafeUpdate();
      
   });
   
   //초기화
   function init() {
      //초기화 버튼 클릭
      $('#btnInit').on('click',function(){
         form1.reset(); 
      });
   }//init
   
   
   
   //사용자 삭제 요청
   function cafeDelete() {
      //삭제 버튼 클릭
      $('body').on('click','#btnDelete',function(){
         var adminId = $(this).closest('tr').find('#hidden_adminId').val();
         var result = confirm(adminId +" 사용자를 정말로 삭제하시겠습니까?");
         if(result) {
            $.ajax({
               url:'users/'+userId,  
               type:'DELETE',
               contentType:'application/json;charset=utf-8',
               dataType:'json',
               error:function(xhr,status,msg){
                  console.log("상태값 :" + status + " Http에러메시지 :"+msg);
               }, success:function(xhr) {
                  console.log(xhr.result);
                  userList();
               }
            });      }//if
      }); //삭제 버튼 클릭
   }//userDelete
   
   //사용자 조회 요청
   function cafeSelect() {
      //조회 버튼 클릭
      $('body').on('click','#btnSelect',function(){
         var userId = $(this).closest('tr').find('#hidden_userId').val();
         //특정 사용자 조회
         $.ajax({
            url:'users/'+userId,
            type:'GET',
            contentType:'application/json;charset=utf-8',
            dataType:'json',
            error:function(xhr,status,msg){
               alert("상태값 :" + status + " Http에러메시지 :"+msg);
            },
            success:userSelectResult
         });
      }); //조회 버튼 클릭
   }//userSelect
   
   //사용자 조회 응답
   function cafeSelectResult(user) {
      $('input:text[name="id"]').val(user.id);
      $('input:text[name="name"]').val(user.name);
      $('input:text[name="password"]').val(user.password);
      $('select[name="role"]').val(user.role).attr("selected", "selected");
   }//userSelectResult
   
   //사용자 수정 요청
   function cafeUpdate() {
      //수정 버튼 클릭
      $('#btnUpdate').on('click',function(){
         var id = $('input:text[name="id"]').val();
         var name = $('input:text[name="name"]').val();
         var password = $('input:text[name="password"]').val();
         var role = $('select[name="role"]').val();      
         $.ajax({ 
             url: "users", 
             type: 'PUT', 
             dataType: 'json', 
             data: JSON.stringify({ id: id, name:name,password: password, role: role }),
             contentType: 'application/json',
             success: function(data) { 
                 userList();
             },
             error:function(xhr, status, message) { 
                 alert(" status: "+status+" er:"+message);
             }
         });
      });//수정 버튼 클릭
   }//userUpdate
   
   //사용자 등록 요청
   function cafeInsert(){
      //등록 버튼 클릭
      $('#btnInsert').on('click',function(){
         $("#form1")
/*          var id = $('input:text[name="id"]').val();
         var name = $('input:text[name="name"]').val();
         var passsword = $('input:text[name="password"]').val();
         var role = $('select[name="role"]').val(); */      
         $.ajax({ 
             url: "users",  
             type: 'POST',  
             dataType: 'json',
             data : $("#form1").serialize(),
             //data: JSON.stringify({ id: id, name:name,password: password, role: role }),
            // data : JSON.stringify($("#form1").serializeObject()),
            // contentType: 'application/json', 
             success: function(response) {
                if(response.result == true) {
                   cafeList();
                }
             }, 
             error:function(xhr, status, message) { 
                 alert(" status: "+status+" er:"+message);
             } 
          });  
      });//등록 버튼 클릭
   }//userInsert
   
   //사용자 목록 조회 요청
   function cafeList() {
      $.ajax({
         url:'users',
         type:'GET',
         //contentType:'application/json;charset=utf-8',
         dataType:'json',
         error:function(xhr,status,msg){
            alert("상태값 :" + status + " Http에러메시지 :"+msg);
         },
         success:userListResult
      });
   }//userList
   
   //사용자 목록 조회 응답
   function cafeListResult(data) {
      $("tbody").empty();
      $.each(data,function(idx,item){
         $('<tr>')
         .append($('<td>').html(item.id))
         .append($('<td>').html(item.name))
         .append($('<td>').html(item.password))
         .append($('<td>').html(item.role))
         .append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
         .append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
         .append($('<input type=\'hidden\' id=\'hidden_userId\'>').val(item.id))
         .appendTo('tbody');
      });//each
   }//userListResult
</script>
</head>
<body>
<div class="container">
   <form action="insertCafe" id="form1" name="form1"  class="form-horizontal">
      <div align="center"><h2>카페 등록 및 수정</h2></div>
      <div class="form-group">      
         <label> 관리자 아이디:</label>
         <input type="text"  class="form-control" name="id" value="${sessionScope.adminId}" readonly>
      </div>   
      <div class="form-group">
         <label>카페이름:</label>
         <input type="text"  class="form-control"  name="name" >
      </div>   
      <div class="form-group">
         <label>카페주소:</label>
         <input type="text"  class="form-control"  name="address" >
      </div>
      <div class="form-group">
         <label>전화번호:</label>
         <input type="text"  class="form-control"  name="phone" >
      </div>  
      <div class="form-group">
         <label>카페영업시간:</label>
         <input type="text"  class="form-control"  name="time" >
      </div>
      <div class="form-group">
         <label>휴무일:</label>
         <input type="text"  class="form-control"  name="close" >
      </div>
     <div class="form-group">
      <label>썸네일:</label> 
      <input type="file" name="uploadfile"/>
     </div>       
      <div class="form-group">
         <label>해시테그:</label>
         <input type="text"  class="form-control"  name="hashtag" >
      </div>
      <div class="form-group">
         <label >테마:</label>
         <div class="checkbox">
            <label><input type="checkbox"  name="theme"  value="t4">작업하기좋은</label>
         </div>
         <div class="checkbox">
            <label><input type="checkbox"  name="theme"  value="t5">핸드드립</label>
         </div>
         <div class="checkbox">
            <label><input type="checkbox"  name="theme"  value="t3">야외석있는</label>
         </div>  
         <div class="checkbox">
            <label><input type="checkbox"  name="theme"  value="t1">이색카페</label>
         </div>  
         <div class="checkbox">
            <label><input type="checkbox"  name="theme"  value="t2">디저트</label>
         </div>     
         <br>
         <div>
         <label>문의사항:</label><br>
         <textarea rows="15" cols="40" name="contents"></textarea>
      </div><br>
         
        <div class="form-group">
         <label >wifi 여부</label>
         <div class="radio">
            <label><input type="radio"  name="theme"  value="Yes">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="theme"  value="No">No</label>
         </div>
         </div> <br>
        
         <div class="form-group">
         <label >키즈존 여부</label>
         <div class="radio">
            <label><input type="radio"  name="nokid"  value="Yes">Yes</label>
         </div>
         <div class="radio"> 
            <label><input type="radio"  name="nokid"  value="No">No</label>
         </div> 
         </div><br>
         
         <div class="form-group">
         <label >주차여부</label>
         <div class="radio">
            <label><input type="radio"  name="parking"  value="Yes">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="parking"  value="No">No</label>
         </div> 
         </div><br>
         
          <div class="form-group">
         <label >반려견동반여부</label>
         <div class="radio">
            <label><input type="radio"  name="animal"  value="Yes">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="aniaml"  value="No">No</label>
         </div>
         </div> <br>
         
          <div class="form-group">
         <label >빔프로젝트 대여여부</label>
         <div class="radio">
            <label><input type="radio"  name="beam"  value="Yes">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="beam"  value="No">No</label>
         </div> 
         </div><br>
         
          <div class="form-group">
         <label >충전기 대여여부</label>
         <div class="radio">
            <label><input type="radio"  name="beam"  value="Yes">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="beam"  value="No">No</label>
         </div>
         </div> <br>
         
             <div class="form-group">
         <label >단체석 여부</label>
         <div class="radio">
            <label><input type="radio"  name="big"  value="Yes">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="big"  value="No">No</label>
         </div> 
         </div><br>
         
         <div class="form-group">
         <label >대관여부</label>
         <div class="radio">
            <label><input type="radio"  name="lend"  value="Yes">Yes</label>
         </div>
         <div class="radio">
            <label><input type="radio"  name="lend"  value="No">No</label>
         </div>
         </div> <br>

      <div class="btn-group">      
            <input type="submit"  class="btn btn-primary" value="등록" /> 
            <!-- <input type="button"  class="btn btn-primary" value="수정"  id="btnUpdate" /> -->
            <input type="button"  class="btn btn-primary" value="초기화" id="btnInit" />
      </div>
   </form>
</div>      
     
  
