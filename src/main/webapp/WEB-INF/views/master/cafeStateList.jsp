<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function submit(param) {
		frm.id.value = param
	if (confirm("정말 승인 하시겠습니까?")) {
		cafeState = cafeState + 2;
		frm.submit();
	}
	}	
	function del(param) {
		frm.id.value = param
		if (confirm("정말 삭제하시겠습니까?")) {
			frm.submit();
		}
	}		
	function GoContents(param) {
		frm2.id.value = param;
		frm2.submit();
	}	
/* 	
	ajax({
        type : "post",
        url : "http://192.168.8.45:8099/webprac/ajax/AjaxController",
        data : serData,
        dataType : "json",
        success : function(obj) {
            showempinfo(obj);
        },
        complete : function(xhr,status) {
        
        },
        error : function(xhr, status, error) {
            console.log(error);
        }
    });
 */

</script>
<div id="listpage">
	<section class="posts">
		
				<div class="card shadow mb-4">			
						<a href="#collapseCardExample" class="d-block card-header py-3"
							data-toggle="collapse" role="button" aria-expanded="true"
							aria-controls="collapseCardExample"></a>
						<form id="frm">
						<h3 class="m-0 font-weight-bold ">카페 승인 대기 리스트</h3>				
						<div class="collapse show" id="collapseCardExample">
							<div class="card-body">
								<div class="order"> 
									<table class="table table-hover">
										<thead>
											<tr>
												<th>관리자 아이디</th>
												<th>카페이름</th>
												<th>카페주소</th>
												<th>연락처</th>
												<th>대기상태</th>
												<th>승인</th>
												<th>삭제</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${cafeStateList}" var="list">
												<!-- 상세정보 볼 수 있는 modal,,,?뭐든 작업하기 -->
												<tr>													
													<td>${list.adminId}</td>
													<td>${list.cafeName}</td>
													<td>${list.cafeAddress}</td>
													<td>${list.adminPhone}</td>
													<td>${list.cafeState}</td>
													<td><button class="btn btn-primary" type="button" onclick="Submit('${adminId }')">승인</button></td>
													<td><button class="btn btn-primary" type="button" onclick="del('${adminId }')">삭제</button></td>
													<!-- onclick 메소드 필요 함 -->
												</tr>
											</c:forEach>
										</tbody> 
									</table>
									</form>
									<div class="btn-group">							
							</div>
							</div>
						</div>
		


