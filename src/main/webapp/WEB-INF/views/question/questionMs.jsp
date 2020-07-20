<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="align-center hovers row">
	<div class="col-lg-5">

			<div class="card shadow mb-4">
				<!-- Card Header - Accordion -->
				<a href="#collapseCardExample" class="d-block card-header py-3"
					data-toggle="collapse" role="button" aria-expanded="true"
					aria-controls="collapseCardExample">
					<h3 class="m-0 font-weight-bold">  문의 내역  </h3>
				</a>
				<div class="content">
					<div class="collapse show" id="collapseCardExample">
						<div class="card-body">
							<div class="order">
<div class="container">
   <form action="questionList" id="form1" name="form1"  class="form-horizontal">
   
   		<div class="form-group">      
         <label> 글번호</label>
         <input type="text"  class="form-control" name="id" value="${sessionScope.question_seq}" readonly>
      </div> 
   
      <div class="form-group">      
         <label> 이메일:</label>
         <input type="text"  class="form-control" name="id" value="${sessionScope.email}" readonly>
      </div>   
      <div class="form-group">      
         <label> 연락처:</label>
         <input type="text"  class="form-control" name="id" value="${sessionScope.phone}" readonly>
      </div>   
      <div class="form-group">
         <label>제목:</label>
         <input type="text"  class="form-control" value="${sessionScope.question_title}" name="name" readonly>
      </div>   
       <div class="form-group">
      내용:<br/>
		<textarea cols="30" rows="5" name="reviewContent" value="${sessionScope.question_content}"
		readonly>카페 완전 후레기네 !!</textarea><br />
      </div><br/>     
  		 <h3> 댓글 입력  </h3>
		
	<form name="frm" action="" method="post">
	내용:<br />
	<textarea cols="30" rows="5" name="reviewContent" id="reviewContent">ㅈㅅㅈㅅㅈㅅ (굽신)</textarea>
	<br />
	</form>   

</div>
</div>
</div>
</div>
<div class="btn-group">      
            <input type="submit"  class="btn btn-primary" value="등록" /> 
            <input type="button"  class="btn btn-primary" value="수정"  id="btnUpdate" />
            <input type="button"  class="btn btn-primary" value="초기화" id="btnInit" />
</div>

</div>
</div>
