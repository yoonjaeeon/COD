<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>카페 좌석 관리</h1>
<style>
	div { text-align: center; }
</style>
<div class="container">
	<div style="float:right;">
       <button onclick="location='insertSeatForm'">좌석 등록</button>
    </div>
	<div id="listpage">
		<section class="posts">
				<article >
						<div class="row"> 
						<c:forEach begin="0" end="3">
						<div class="col-md-6">
						<a href="#" class="image fit"><img src="resources/images/main2.jpg"	alt="" style="width: 60%"></a>
							<h3>
								<a href="updateSeatForm">좌석 번호</a>
							</h3>
							<h4>1~2인이상</h4>
						</div>				
						</c:forEach>
						</div>
				</article>
		</section>
	</div>
</div>
