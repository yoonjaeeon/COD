<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<script src="resources/json.min.js"></script>
<script type="text/javascript" >
$(function(){
   inventoryList(); 
   inventorySelect();
   inventoryDelete();
   inventoryInsert();
   inventoryUpdate();
   init();
});

//초기화
function init() {
   //초기화 버튼 클릭
   $('#btnInit').on('click',function(){
      $('#inventoryform').each(function(){
         this.reset();
      });
   });
}//init

//메뉴 등록 요청 등록
function inventoryInsert(){
   $('#btnInsert').on('click',function(){
      $.ajax({ 
          url: "inventory",  
          type: 'POST',  
          dataType: 'json', 
          data :  $("#inventoryform").serialize(),
          success: function(response) {
             if(response.result == true) {
                inventoryList();
             }
          }, 
          error:function(xhr, status, message) { 
              alert(" status: "+status+" er:"+message);
          } 
       });  
   });
}//InventoryInsert
//메뉴 삭제 요청
function inventoryDelete() {
   //삭제 버튼 클릭
   $('body').on('click','#btnDelete',function(){
      var inventorySeq = $(this).closest('tr').find('.inventorySeq').text();
      var result = confirm("정말로 삭제하시겠습니까?");
      if(result) {
         $.ajax({
            url:'inventory/'+inventorySeq,  
            type:'DELETE',
            contentType:'application/json;charset=utf-8',
            dataType:'json',
            error:function(xhr,status,msg){
               console.log("상태값 :" + status + " Http에러메시지 :"+msg);
            }, success:function(xhr) {
               console.log(xhr.result);
               inventoryList();
            }
         });      }//if
   }); //삭제 버튼 클릭
}//InventoryDelete

//메뉴 조회 요청
function inventorySelect() {
   $('body').on('click','#btnSelect',function(){
      var inventorySeq = $(this).closest('tr').find('.inventorySeq').text();
      $.ajax({
         url:'inventory/'+inventorySeq,
         type:'GET',
         contentType:'application/json;charset=utf-8',
         dataType:'json',
         error:function(xhr,status,msg){
            alert("상태값 :" + status + " Http에러메시지 :"+msg);
         },
         success:inventorySelectResult
      });
   }); //조회 버튼 클릭
}

//메뉴 조회 응답
function inventorySelectResult(inventory) {
	$('input:hidden[name="adminId"]').val(inventory.adminId);
	$('input:hidden[name="inventorySeq"]').val(inventory.inventorySeq);
	$('input:text[name="inventoryName"]').val(inventory.inventoryName);
	$('input:text[name="inventoryAmount"]').val(inventory.inventoryAmount);
	$('input:text[name="volume"]').val(inventory.volume);
	$('input:text[name="nowVolume"]').val(inventory.nowVolume);
	$('input:text[name="inventoryPrice"]').val(inventory.inventoryPrice);

}//InventorySelectResult

//메뉴 수정 요청
function inventoryUpdate() {
   $('#btnUpdate').on('click',function(){
	   var inventorySeq = $(this).closest('tr').find('.inventorySeq').text();
	   console.log(JSON.stringify($("#inventoryform").serializeObject()));
      $.ajax({ 
          url: "inventory/", 
          type: 'PUT', 
          dataType: 'json', 
          data: JSON.stringify($("#inventoryform").serializeObject()),
          contentType: 'application/json',
          success: function(data) { 
              inventoryList();
          },
          error:function(xhr, status, message) { 
              alert(" status: "+status+" er:"+message);
          }
      });
   });
}//InventoryUpdate

//메뉴 목록 조회 요청
function inventoryList() {
   $.ajax({
      url:'inventory',
      type:'GET',
      contentType:'application/json;charset=utf-8',
      dataType:'json',
      error:function(xhr,status,msg){
         alert("상태값 :" + status + " Http에러메시지 :"+msg);
      },
      success:inventoryListResult
   });
}//InventoryList

//메뉴 목록 조회 응답
function inventoryListResult(data) {
   $("tbody").empty();
   $.each(data,function(idx,item){
      $('<tr>')
      .append($('<input type=\'hidden\' id=\'adminId\'>').html(item.adminId))
      .append($('<input type=\'hidden\' class=\'inventorySeq\'>').html(item.inventorySeq))
      .append($('<td>').html(item.inventoryName))
      .append($('<td>').html(item.inventoryAmount))
      .append($('<td>').html(item.volume))
      .append($('<td>').html(item.nowVolume))
      .append($('<td>').html(item.inventoryPrice))
      .append($('<td>').html('<i id="btnSelect" class="fas fa-eye"style="font-size:24px"\'></button>'))
      .append($('<td>').html('<i id=\'btnDelete\'class="fas fa-times-circle" style="font-size:24px"></i>'))
      .appendTo('tbody');
   });//each
}//InventoryListResult
$(document).ready(function(){
	  $("#searchInventory").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#inventoryTbl tr").filter(function() {
	    	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});
});
</script>
<div class="container">
         <h4>재고 관리</h4><br>
   <form name="inventoryform" id="inventoryform" class="form-horizontal row" >
      <div align="center">
	      <div class="row" style="width: 80%; margin: 30px">
	      	 <input type="hidden" name="adminId">
	      	 <input type="hidden" name="inventorySeq">
	      	 <input type="text" class="form-control  " name="inventoryName"   placeholder="재고명" id="inventoryName">      <br><br>
	         <input type="text" class="form-control  " name="inventoryAmount"   placeholder="재고수량" id="inventoryAmount">     <br> <br>
	         <input type="text" class="form-control  " name="volume"   placeholder="용량" id="volume">      <br><br>
	         <input type="text" class="form-control  " name="nowVolume"   placeholder="현재용량" id="nowVolume">      <br><br>
	         <input type="text" class="form-control  " name="inventoryPrice"   placeholder="단가" id="inventoryPrice">
	      </div>
	  </div>
      <div class= "container" align="center">
      <input type="button" class="btn btn-outline-info" value="등록" id="btnInsert"/>
      <input type="button" class="btn btn-outline-info" value="수정" id="btnUpdate" />
      <input type="button" class="btn btn-outline-info" value="초기화" id="btnInit" />
      </div>
      
   </form>
   <div>
      <h4>재고 목록</h4>
      <div class="row" style="margin-bottom: 1em">
      	<div class="col-6"></div>
      	<input class="form-control col-5" id="searchInventory" type="text" placeholder="Search..">
      	<i class="fa fa-search col-1" style="font-size:24px;" ></i>
      </div>
      <table class="table text-center" id="inventoryTbl">
         <thead>
            <tr>
               <th class="text-center">재고명</th>
               <th class="text-center">재고수량</th>
               <th class="text-center">용량</th>
               <th class="text-center">현재용량</th>
               <th class="text-center">단가</th>
               <th class="text-center"> 조회 </th>
               <th class="text-center"> 삭제 </th>
            </tr>
         </thead>
         <tbody></tbody>
      </table>
   </div>
</div>