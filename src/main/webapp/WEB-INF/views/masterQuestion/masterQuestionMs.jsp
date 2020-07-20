<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<div class="align-center hovers row">
	<div class="col-lg-5">

<article>
<div class="card shadow mb-4">
					<!-- Card Header - Accordion -->
					<a href="#collapseCardExample" class="d-block card-header py-3"
						data-toggle="collapse" role="button" aria-expanded="true"
						aria-controls="collapseCardExample">
						<h3 class="m-0 font-weight-bold ">* 문의내역 *</h3>
					</a>
					<div class="content">
					<div class="collapse show" id="collapseCardExample">
						<div class="card-body">
							<div class="order">
  		
  
		email<input type="text" name="name" id="name"  />  <br/>	<br/>				
		이름<input type="text" name="" id="name"/><br/><br/>
		연락처<input type="text" name="" id="name" /> <br/>	<br/>				
		제목<input type="text" name="" id="name"/><br/><br/>
		내용:<br/>
		<textarea cols="30" rows="5"
         name="reviewContent" id="reviewContent">카페 완전 후레기네 !!</textarea><br/>	
         </div>
         </div>
         </div>
         </div>
</div>

</article>
<article>
			<div class="card shadow mb-4">
					<!-- Card Header - Accordion -->
					<a href="#collapseCardExample" class="d-block card-header py-3"
						data-toggle="collapse" role="button" aria-expanded="true"
						aria-controls="collapseCardExample">
						<h3 class="m-0 font-weight-bold ">* 댓글입력  *</h3>
					</a>
					<div class="content">
					<div class="collapse show" id="collapseCardExample">
						<div class="card-body">
							<div class="order">

<form name="frm" action="" method="post">
내용:<br/>
<textarea cols="30" rows="5"
          name="reviewContent" id="reviewContent">ㅈㅅㅈㅅㅈㅅ (굽신)</textarea><br/>

</form>    
 
 </div>
 </div>
 </div>
 </div>
 </div>
</article>
<button type="button" onclick="validCheck()">등록</button>
<input type="reset" value="지우기" />

</div>
</div> 