<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="resources/json.min.js"></script>
<script type="text/javascript" >

	$(function(){
/* 		advertList(1);
		advertList(0); */

		advertSelect();
		
		advertDelete();
		
		advertInsert();
	
		advertUpdate(); 
		
		init();
	});	
	var adverCurrentState = 0;
	
	//초기화
	function init() {
		//초기화 버튼 클릭
		$('#btnInit').on('click',function(){
			$('#advertform').each(function(){
				this.reset();
				$(".custom-file-label").html('Choose file');
			});
		});

		$('#state0').on('click' , function() { advertList(0); adverCurrentState= 0;}); //조회 버튼 클릭
		$('#state1').on('click' , function() { advertList(1); adverCurrentState= 1;}); //조회 버튼 클릭
		
	}//init	
	//사용자 등록 요청
	function advertInsert(){
		//등록 버튼 클릭
		$('#btnInsert').on('click',function(){
			console.log($("#advertform").serialize());
			var form = $('#advertform')[0];
			var data = new FormData(form);
			$.ajax({ 
			    url: "advert",  
			    type: 'POST',
			    dataType: 'json', 
			    enctype: 'multipart/form-data',
			    data :data,
			    contentType:false,
			    processData: false,
			    cache: false,
			    success: function(data) {
			     	if(data.result == true) {
			    		advertList(1);
			    	}
			    }, 
			    error:function(xhr, status, message) { 
			        alert(""+ status+" 정보를 입력해주세요 "+message);
			    } 
			 });  
		});//등록 버튼 클릭
	}//userInsert	
	
	//사용자 삭제 요청
	function advertDelete() {
		//삭제 버튼 클릭
		$('body').on('click','#btnDelete',function(){
			var advertiseSeq = $(this).closest('tr').find('#sel_advertiseSeq').text();
			var result = confirm(advertiseSeq +" 사용자를 정말로 삭제하시겠습니까?");
			if(result) {
				$.ajax({
					url:'advert/'+ advertiseSeq,  
					type:'DELETE',
					contentType:'application/json;charset=utf-8',
					cache: false,
					dataType:'json',
					error:function(xhr,status,msg){
						console.log("상태값 :" + status + " Http에러메시지 :"+msg);
					}, success:function(xhr) {
						console.log(xhr.result);
						advertList(adverCurrentState);
					}
				});      }//if
		}); //삭제 버튼 클릭
	}//userDelete
	
	//사용자 조회 요청
	function advertSelect() {
		//조회 버튼 클릭
		$('body').on('click','#btnSelect',function(){
			var advertiseSeq = $(this).closest('tr').find('#sel_advertiseSeq').text();
			console.log(advertiseSeq);
			//특정 사용자 조회
			$.ajax({
				url:'advert/' + advertiseSeq,
				type:'GET',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:advertSelectResult
			});
		}); //조회 버튼 클릭
	}//userSelect


	//사용자 조회 응답
	function advertSelectResult(advertisement) {
		$('input:text[name="advertiseSeq"]').val(advertisement.advertiseSeq);
		$('input:text[name="advertiser"]').val(advertisement.advertiser);
		$('input:text[name="advertiserPhone"]').val(advertisement.advertiserPhone);
		$('input:text[name="advertiseMoney"]').val(advertisement.advertiseMoney);
		$('input:text[name="site"]').val(advertisement.site);
		$('input[name="contractPeriod"]').val(advertisement.contractPeriod);
		$('input[name="contractENDPeriod"]').val(advertisement.contractENDPeriod);
		$('input[file="advertiseFile"]').val(advertisement.advertiseFile);
		
		//$('select[name="role"]').val(worker.role).attr("selected", "selected");
	}//userSelectResult
	
	
	//사용자 수정 요청
	function advertUpdate() {
		//수정 버튼 클릭
		$('#btnUpdate').on('click', function(){	
		 var form = $('#advertform')[0];
			var data = new FormData(form);
			
			$.ajax({ 
			    url: "advertup", 
			    type: 'post', 
			    dataType: 'json', 
			    data : data,  
			    enctype: 'multipart/form-data',
			    contentType:false,
			    processData: false,
			    cache: false,
			    success: function(data) { 
			    	advertList(1);
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" 에러:"+message);
			    }
			});
		});//수정 버튼 클릭
	}//userUpdate
	
	//사용자 목록 조회 요청
	function advertList(selcets) {
		$.ajax({
			url:'advert',
			type:'GET',	
			data: {advertiseState:selcets},
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " 에러 메세지:"+msg);
			},
			success:advertListResult
		});
	}//직원 리스트 조회
	
	//사용자 목록 조회 응답
	function advertListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<td id=\'sel_advertiseSeq\'></td>').html(item.advertiseSeq))
			.append($('<td>').html(item.advertiser))
			.append($('<td>').html(item.advertiserPhone))		
			.append($('<td>').html(item.advertiseMoney))
			.append($('<td>').html(item.advertiseFile))
			.append($('<td>').html(item.site))
			.append($('<td>').html(item.remain+"일"))
			.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
			.append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
			.appendTo('tbody');
		});//each
	}//userListResult
	
	$(document).ready(function(){
		  $("#searchMenu").on("keyup", function() {
		    var value = $(this).val().toLowerCase();
		    $("#adminTbl tr").filter(function() {
		    	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});
	});
	
</script>

<div class="container">
	<div class="row">
		<div class="col-lg-4">
			<form id="advertform" class="form-horizontal" method="post"  enctype="multipart/form-data" >
				<h2>광고등록</h2>
				<div class="form-group">
					<!-- <label> 광고번호:</label>  --><input type="hidden" class="form-control"
						name="advertiseSeq" id="advertiseSeq" readonly>
				</div>
				<div class="form-group">
					<label>광고주 성함:</label> <input type="text" class="form-control"
						name="advertiser" id="advertiser">
				</div>
				<div class="form-group">
					<label>광고주 연락처:</label> <input type="text" class="form-control"
						name="advertiserPhone" id="advertiserPhone">
				</div>
				<div class="form-group">
					<label>금액:</label> <input type="text" class="form-control"
						name="advertiseMoney" id="advertiseMoney">
				</div>
				<div class="form-group">
					<label>사이트:</label> <input type="text" class="form-control"
						name="site" id="site">
				</div>
				
				<div class="form-group">   
					<label>계약시작:</label>
					<input type="date" id="date" class="form-control" name="contractPeriod" >	   		
				</div>
				<div class="form-group">   
					<label>계약만료:</label>
					<input type="date" id="date" class="form-control" name="contractENDPeriod" >	   		
				</div>	
				<label>첨부파일:</label>			
				<div class="custom-file">
				  <input type="file" class="custom-file-input" id="upload" name="upload">
				  <label class="custom-file-label" for="customFile">Choose file</label>
				</div><br><br>

				<div align="center">      
					<input type="button"  class="btn btn-outline-info" value="등록"  id="btnInsert" /> 
					<input type="button"  class="btn btn-outline-info" value="수정"  id="btnUpdate" />
					<input type="button"  class="btn btn-outline-info" value="초기화" id="btnInit" />		
				</div>
			</form>
		</div>

		
		<div class="col-lg-8">
			<br>
			<h2>광고목록</h2>
				<div class="container" align="center">
				<input type="button" class="btn btn-outline-info" value="광고 계약 리스트 " id="state1" /> &nbsp;
				<input type="button" class="btn btn-outline-info" value="광고 계약 만료 리스트 " id="state0" /> &nbsp; 
			</div>
			<div style="overflow:auto; width:900px" >
			<table class="table text-center" id="adminTbl" style="width:900px" >
				<thead>
				<tr>				
					<th class="text-center">광고번호</th>
					<th class="text-center">광고주</th>
					<th class="text-center">광고주연락처</th>
					<th class="text-center">금액</th>
				    <th class="text-center">첨부파일</th>
					<th class="text-center">사이트</th>
					<th class="text-center">계약남은기간</th>
					<th class="text-center">조회</th>
					<th class="text-center">삭제</th>
				</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
</div>
</div>
<script>
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});

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


var adminPhone = document.getElementById('advertiserPhone');

adminPhone.onkeyup = function(){
console.log(this.value);
this.value = autoHypenPhone( this.value ) ;  
}
</script>