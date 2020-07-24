<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<script src="resources/json.min.js"></script>
<script type="text/javascript" >
$(function(){
   menuList();
   menuSelect();
   menuDelete();
   menuInsert();
   menuUpdate();
   init();
});

//초기화
function init() {
   //초기화 버튼 클릭
   $('#btnInit').on('click',function(){
      $('#menuform').each(function(){
         this.reset();
      });
   });
}//init

//메뉴 등록 요청 등록
function menuInsert(){
   $('#btnInsert').on('click',function(){
      $.ajax({ 
          url: "menu",  
          type: 'POST',  
          dataType: 'json', 
          data :  $("#menuform").serialize(),
          success: function(response) {
             if(response.result == true) {
                menuList();
             }
          }, 
          error:function(xhr, status, message) { 
              alert(" status: "+status+" er:"+message);
          } 
       });  
   });
}//menuInsert
//메뉴 삭제 요청
function menuDelete() {
   //삭제 버튼 클릭
   $('body').on('click','#btnDelete',function(){
      var menuSeq = $(this).closest('tr').find('#menuSeq').val();
      var result = confirm("정말로 삭제하시겠습니까?");
      if(result) {
         $.ajax({
            url:'menu/'+menuSeq,  
            type:'DELETE',
            contentType:'application/json;charset=utf-8',
            dataType:'json',
            error:function(xhr,status,msg){
               console.log("상태값 :" + status + " Http에러메시지 :"+msg);
            }, success:function(xhr) {
               console.log(xhr.result);
               menuList();
            }
         });      }//if
   }); //삭제 버튼 클릭
}//menuDelete

//메뉴 조회 요청
function menuSelect() {
   $('body').on('click','#btnSelect',function(){
      var menuSeq = $(this).closest('tr').find('#menuSeq').val();
      $.ajax({
         url:'menu/'+menuSeq,
         type:'GET',
         contentType:'application/json;charset=utf-8',
         dataType:'json',
         error:function(xhr,status,msg){
            alert("상태값 :" + status + " Http에러메시지 :"+msg);
         },
         success:menuSelectResult
      });
   }); //조회 버튼 클릭
}

//메뉴 조회 응답
function menuSelectResult(menu) {
	$('select[name="menuSort"]').val(menu.menuSort).attr("selected", "selected");
	$('input:text[name="menuName"]').val(menu.menuName);
	$('input:text[name="price"]').val(menu.price);
	$('input:text[name="priceAdd"]').val(menu.priceAdd);
}//menuSelectResult

//메뉴 수정 요청
function menuUpdate() {
   $('#btnUpdate').on('click',function(){
	   var menuSeq = $(this).closest('tr').find('#menuSeq').val();
	   console.log(JSON.stringify($("#menuform").serializeObject()));
      $.ajax({ 
          url: "menu/"+menuSeq, 
          type: 'PUT', 
          dataType: 'json', 
          data: JSON.stringify($("#menuform").serializeObject()),
          contentType: 'application/json',
          success: function(data) { 
              menuList();
          },
          error:function(xhr, status, message) { 
              alert(" status: "+status+" er:"+message);
          }
      });
   });
}//menuUpdate

//메뉴 목록 조회 요청
function menuList() {
   $.ajax({
      url:'menu',
      type:'GET',
      contentType:'application/json;charset=utf-8',
      dataType:'json',
      error:function(xhr,status,msg){
         alert("상태값 :" + status + " Http에러메시지 :"+msg);
      },
      success:menuListResult
   });
}//menuList

//메뉴 목록 조회 응답
function menuListResult(data) {
   $("tbody").empty();
   $.each(data,function(idx,item){
      $('<tr>')
      .append($('<td>').html(item.menuSort))
      .append($('<td>').html(item.menuName))
      .append($('<td>').html(item.price))
      .append($('<td>').html(item.menuState))
      .append($('<td>').html(item.priceAdd))
      .append($('<td>').html('<button id="btnSelect" class="btn btn-outline-info"\'>조회</button>'))
      .append($('<td>').html('<i id=\'btnDelete\'class="fas fa-times-circle" style="font-size:24px"></i>'))
      .append($('<input type=\'hidden\' id=\'menuSeq\'>').val(item.menuSeq))
      .appendTo('tbody');
   });//each
}//menuListResult
</script>
<div class="container">
         <h4>메뉴 등록 및 수정</h4><br>
   <form name="menuform" id="menuform" class="form-horizontal row">
      <div class="col-lg-6" >
      	 <input type="hidden" name="menuSeq">
         <select class="form-control" id="menuSort" name="menuSort">
              <option value="Coffee">Coffee</option>
              <option value="Non Coffee">Non Coffee</option>
              <option value="Tea">Tea</option>
              <option value="Dessert">Dessert</option>
          </select><br> <!-- <a href="#"><i class="fa fa-plus-square"></i></a><br> -->
         <input type="text" class="form-control" name="menuName"   placeholder="메뉴이름">      <br>
         <input type="text" class="form-control" name="price"   placeholder="메뉴금액">      <br>
      </div>
      <div class="col-lg-6 row">
            <div class = "col-6">
               <h6>메뉴판매상태</h6>
               <h6>시그니처 여부</h6>
               <h6>인기메뉴 여부</h6>
               <h6>신메뉴 여부</h6>
               <h6>아이스추가금여부</h6>
            </div>
            <div class="col-2">
               Hot <input type="radio"  name="menuState" value="0">
            </div>
            <div class="col-2">
               ICE <input type="radio"  name="menuState" value="1"> <br>
               Yes <input type="radio"  name="signiture" value="1"><br>
               Yes <input type="radio"  name="popularMenu" value="1">   <br>
               Yes <input type="radio"  name="newMenu" value="1"><br>
               Yes <input type="radio"  name="" value="1"><br>
            </div>
            <div class="col-2">
                 ALL <input type="radio"  name="menuState" checked="checked" value="2" ><br>
              	 N o <input type="radio"  name="signiture" checked="checked" value="0"><br>
               	 N o <input type="radio"  name="popularMenu" checked="checked" value="0"><br>
               	 N o <input type="radio"  name="newMenu" checked="checked" value="0"><br>
                 N o <input type="radio"  name="" checked="checked" value="0"><br>
            </div>
            <input type="text" class="form-control" name="priceAdd"   placeholder="아이스추가금" value="0">

      </div>
      <div class= "container" align="center">
      <input type="button" class="btn btn-outline-info" value="등록" id="btnInsert"/>
      <input type="button" class="btn btn-outline-info" value="수정" id="btnUpdate" />
      <input type="button" class="btn btn-outline-info" value="초기화" id="btnInit" />
      </div>
      
   </form>
   <div>
      <h4>메뉴</h4>
      <table class="table text-center">
         <thead>
            <tr>
               <th class="text-center">메뉴분류</th>
               <th class="text-center">메뉴명</th>
               <th class="text-center">단가</th>
               <th class="text-center">메뉴판매상태</th>
               <th class="text-center">추가금</th>
               <th class="text-center"> 조회 </th>
               <th class="text-center"> 삭제 </th>
            </tr>
         </thead>
         <tbody></tbody>
      </table>
   </div>
</div>