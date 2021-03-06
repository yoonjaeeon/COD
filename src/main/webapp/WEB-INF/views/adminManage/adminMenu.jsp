<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<script src="resources/json.min.js"></script>
<script type="text/javascript" >
$(function(){
   menuList();
   menuSelect();
   menuDelete();
   menuUpdate();
   menuInsert();
   setDisplay();
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
	   if(!$("#menuName").val()){
			console.log("이름X");
			alert("메뉴이름을 입력해주세요");
			return;
		}
		if(!$("#price").val()){
			alert("단가를 입력해주세요");
			return;
		}
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
	$('input:hidden[name="menuSeq"]').val(menu.menuSeq);
	$('select[name="menuSort"]').val(menu.menuSort).attr("selected", "selected");
	$('input:text[name="menuName"]').val(menu.menuName);
	$('input:text[name="price"]').val(menu.price);
	$('input:text[name="priceAdd"]').val(menu.priceAdd);
	if(menu.priceAdd != 0){
	$('input:radio[name="addState"]').filter("[value=1]").prop("checked",true);
	}
	$('input:radio[name="menuState"]').filter("[value="+menu.menuState+"]").prop("checked",true);
	$('input:radio[name="signiture"]').filter("[value="+menu.signiture+"]").prop("checked",true);
	$('input:radio[name="popularMenu"]').filter("[value="+menu.popularMenu+"]").prop("checked",true);
	$('input:radio[name="newMenu"]').filter("[value="+menu.newMenu+"]").prop("checked",true);
	setDisplay();

}//menuSelectResult

//메뉴 수정 요청
function menuUpdate() {
   $('#btnUpdate').on('click',function(){
	   var menuSeq = $(this).closest('tr').find('#menuSeq').val();
      $.ajax({ 
          url: "menu/", 
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
	   var icon;
	   switch(item.menuState) {
	    case 0: 
	    	icon = "HOT";
	        break;
	    case 1: 
	    	icon = "ICE";
	         break;
	    case 2:
	    	icon = "ALL";
	    	break;
	    default: 
	    	icon = "<i class='fas fa-cookie'></i>";
	        break;
	  }
	  var scheck="";
	  var ncheck="";
	  var pcheck="";
	  if(item.signiture == 1){
			scheck="<i class='fa fa-check' style='font-size:24px'></i>";
	  }
	  if(item.newMenu == 1){
		  ncheck="<i class='fa fa-check' style='font-size:24px'></i>";
	  }
	  if(item.popularMenu == 1){
		  pcheck="<i class='fa fa-check' style='font-size:24px'></i>";
	  }
	
      $('<tr>')
      .append($('<td>').html(item.menuSort))
      .append($('<td>').html(item.menuName))
      .append($('<td>').html(item.price+item.priceAdd))
      .append($('<td>').html(icon))
      .append($('<td>').html(ncheck))
      .append($('<td>').html(scheck))
      .append($('<td>').html(pcheck))
      .append($('<td>').html('<i id="btnSelect" class="fas fa-eye"style="font-size:24px"\'></button>'))
      .append($('<td>').html('<i id=\'btnDelete\'class="fas fa-times-circle" style="font-size:24px"></i>'))
      .append($('<input type=\'hidden\' id=\'menuSeq\'>').val(item.menuSeq))
      .appendTo('tbody');
   });//each
}//menuListResult
$(document).ready(function(){
	$("#searchMenu").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#menuTbl tr").filter(function() {
	    	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});
	$("#price").on("keyup", function(event){
		var regNumber = /^[0-9]*$/;
		var temp = $("#price").val();
		if(!regNumber.test(temp)){
			$("#price").val(temp.replace(/[^0-9]/g,""));
			alert("숫자만입력해주세요");
		}
	})
});
function setDisplay(){
	if($('input:radio[id=add]').is(':checked')){
    	$('#priceAdd').show();
    }else if($('input:radio[id=noadd]').is(':checked')){
    	$('#priceAdd').hide();
    }
}
function setting(){
	$('#priceAdd').val()=0;
}

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
         <input type="text" class="form-control" id="menuName" name="menuName"   placeholder="메뉴이름" ><br>
         <input type="text" class="form-control" id="price" name="price"   placeholder="메뉴금액" ><br>
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
               Hot <input type="radio"  name="menuState" value="0" onclick="setting()">
            </div>
            <div class="col-2">
               ICE <input type="radio"  name="menuState" value="1" onclick="setting()"> <br>
               Yes <input type="radio"  name="signiture" value="1"><br>
               Yes <input type="radio"  name="popularMenu" value="1">   <br>
               Yes <input type="radio"  name="newMenu" value="1"><br>
               Yes <input type="radio"  name="addState" value="1" id="add" onclick="setDisplay()"><br>
            </div>
            <div class="col-2">
                 ALL <input type="radio"  name="menuState" checked="checked" value="2" ><br>
              	 N o <input type="radio"  name="signiture" checked="checked" value="0"><br>
               	 N o <input type="radio"  name="popularMenu" checked="checked" value="0"><br>
               	 N o <input type="radio"  name="newMenu" checked="checked" value="0"><br>
                 N o <input type="radio"  name="addState" id = "noadd" checked="checked" value="0" onclick="setDisplay()" ><br>
            </div>
            <input type="text" class="form-control" id="priceAdd" name="priceAdd" placeholder="아이스추가금" value="0">

      </div>
      <div class= "container" align="center">
      <input type="button" class="btn btn-outline-info" value="등록" id="btnInsert"/>
      <input type="button" class="btn btn-outline-info" value="수정" id="btnUpdate" />
      <input type="button" class="btn btn-outline-info" value="초기화" id="btnInit" />
      </div>
      
   </form>
   <div>
      <h4>메뉴</h4>
      <div class="row" style="margin-bottom: 1em">
      	<div class="col-6"></div>
      	<input class="form-control col-5" id="searchMenu" type="text" placeholder="Search..">
      	<i class="fa fa-search col-1" style="font-size:24px;" ></i>
      </div>
      <table class="table text-center" id="menuTbl">
         <thead>
            <tr>
               <th class="text-center">메뉴분류</th>
               <th class="text-center">메뉴명</th>
               <th class="text-center">단가</th>
               <th class="text-center">메뉴판매상태</th>
               <th class="text-center">신메뉴</th>
               <th class="text-center">시그니처</th>
               <th class="text-center">신메뉴</th>
               <th class="text-center"> 조회 </th>
               <th class="text-center"> 삭제 </th>
            </tr>
         </thead>
         <tbody></tbody>
      </table>
   </div>
</div>